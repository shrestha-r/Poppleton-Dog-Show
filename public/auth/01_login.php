<?php
require_once __DIR__ . '/../../core/config.php';
require_once __DIR__ . '/../../core/db.php';
session_start();

$email = $password = $err = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email    = trim($_POST['email']   ?? '');
    $password = trim($_POST['password'] ?? '');

    $stmt = getConnection()->prepare(
        'SELECT id, email, password_hash, role
         FROM users
         WHERE email = ? AND is_active = 1'
    );
    $stmt->execute([$email]);
    $user = $stmt->fetch();

    if ($user && password_verify($password, $user['password_hash'])) {
        $_SESSION['user_id']  = $user['id'];
        $_SESSION['email'] = $user['email'];
        $_SESSION['role']     = $user['role'];
        header('Location: ../01_index.php');
        exit;
    }
    $err = 'Invalid email or password.';
}
$author = 'Rahul Shrestha';   // footer credit
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Login | <?= APP_NAME ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?= APP_URL ?>/assets/css/styles.css">
</head>
<body>
<?php include __DIR__ . '/../partials/header.php'; ?>

<main class="auth-wrapper">
    <div class="auth-card">
        <h2>Login</h2>

        <?php if ($err): ?><p class="error-bubble"><?= htmlspecialchars($err) ?></p><?php endif; ?>

        <form method="post" action="01_login.php">
            <label>Email</label>
            <input type="email" name="email" value="<?= htmlspecialchars($email) ?>" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <button type="submit">Login</button>
        </form>

        <p class="auth-link">Don’t have an account? <a href="02_register.php">Register here</a></p>
    </div>
</main>

<?php include __DIR__ . '/../partials/footer.php'; ?>
<script src="<?= APP_URL ?>/assets/js/scripts.js"></script>
</body>
</html>