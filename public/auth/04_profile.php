<?php
session_start();

require_once __DIR__ . '/../../core/config.php';
require_once __DIR__ . '/../../core/db.php';

/* -------------------------
   Require login
-------------------------- */
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$conn = getConnection();

/* -------------------------
   Fetch user
-------------------------- */
$stmt = $conn->prepare("
    SELECT email, role, is_active, created_at, updated_at
    FROM users
    WHERE id = :id
");
$stmt->execute([':id' => $_SESSION['user_id']]);
$user = $stmt->fetch();

if (!$user) {
    session_destroy();
    header('Location: login.php');
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile | <?= APP_NAME ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?= APP_URL ?>/assets/css/styles.css">
</head>
<body>

<?php include __DIR__ . '/partials/header.php'; ?>

<main class="owner-page">

    <section class="profile card">
        <h1>My Profile</h1>

        <p><strong>Email:</strong> <?= htmlspecialchars($user['email']) ?></p>
        <p><strong>Role:</strong> <?= ucfirst($user['role']) ?></p>
        <p><strong>Status:</strong>
            <?= $user['is_active'] ? 'Active' : 'Inactive' ?>
        </p>

        <p><strong>Account created:</strong>
            <?= date('d M Y', strtotime($user['created_at'])) ?>
        </p>

        <?php if ($user['updated_at']): ?>
            <p><strong>Last updated:</strong>
                <?= date('d M Y', strtotime($user['updated_at'])) ?>
            </p>
        <?php endif; ?>

        <a href="03_logout.php" class="btn">Logout</a>
    </section>

</main>

<?php include __DIR__ . '/partials/footer.php'; ?>

</body>
</html>
