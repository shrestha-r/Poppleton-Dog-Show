<?php
require_once __DIR__ . '/../../core/config.php';
require_once __DIR__ . '/../../core/db.php';
session_start();

$email = $password = $err = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email    = trim($_POST['email']   ?? '');
    $password = trim($_POST['password'] ?? '');

    $stmt = getConnection()->prepare('SELECT id, username, password FROM users WHERE email = ?');
    $stmt->execute([$email]);
    $user = $stmt->fetch();

    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['user_id']   = $user['id'];
        $_SESSION['username']  = $user['username'];
        header('Location: 01_index.php');
        exit;
    }
    $err = 'Invalid email or password.';
}
$author = 'Rahul Shrestha';
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Login - <?= APP_NAME ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?= APP_URL ?>/assets/css/styles.css">
</head>
<body>
<?php include __DIR__ . '/partials/header.php'; ?>

<main class="auth-form-container">
    <form class="auth-form" method="post">
        <h2>Login</h2>

        <?php if ($err): ?><p class="error"><?= htmlspecialchars($err) ?></p><?php endif; ?>

        <label>Email
            <input type="email" name="email" value="<?= htmlspecialchars($email) ?>" required>
        </label>

        <label>Password
            <input type="password" name="password" required>
        </label>

        <button type="submit">Login</button>

        <p>Need an account? <a href="02_register.php">Register here</a></p>
    </form>
</main>

<?php include __DIR__ . '/partials/footer.php'; ?>
<script src="<?= APP_URL ?>/assets/js/scripts.js"></script>
</body>
</html>