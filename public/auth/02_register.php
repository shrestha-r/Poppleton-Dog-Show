<?php
require_once __DIR__ . '/../../core/config.php';
require_once __DIR__ . '/../../core/db.php';
session_start();

$name = $email = $password = $err = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name     = trim($_POST['username'] ?? '');
    $email    = trim($_POST['email']    ?? '');
    $password = trim($_POST['password'] ?? '');

    if (strlen($password) < 6) {
        $err = 'Password must be at least 6 characters.';
    } else {
        $conn = getConnection();
        /* email unique check */
        $exists = $conn->prepare('SELECT id FROM users WHERE email = ?');
        $exists->execute([$email]);
        if ($exists->fetch()) {
            $err = 'Email already registered.';
        } else {
            $hash = password_hash($password, PASSWORD_DEFAULT);
            $stmt = $conn->prepare('INSERT INTO users (username, email, password) VALUES (?,?,?)');
            $stmt->execute([$name, $email, $hash]);

            /* auto-login */
            $_SESSION['user_id']  = $conn->lastInsertId();
            $_SESSION['username'] = $name;
            header('Location: 01_index.php');
            exit;
        }
    }
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Register - <?= APP_NAME ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?= APP_URL ?>/assets/css/styles.css">
</head>
<body>
<?php include __DIR__ . '/partials/header.php'; ?>

<main class="auth-form-container">
    <form class="auth-form" method="post">
        <h2>Register</h2>

        <?php if ($err): ?><p class="error"><?= htmlspecialchars($err) ?></p><?php endif; ?>

        <label>Username
            <input type="text" name="username" value="<?= htmlspecialchars($name) ?>" required>
        </label>

        <label>Email
            <input type="email" name="email" value="<?= htmlspecialchars($email) ?>" required>
        </label>

        <label>Password
            <input type="password" name="password" required minlength="6">
        </label>

        <button type="submit">Create Account</button>

        <p>Already registered? <a href="01_login.php">Login here</a></p>
    </form>
</main>

<?php include __DIR__ . '/partials/footer.php'; ?>
<script src="<?= APP_URL ?>/assets/js/scripts.js"></script>
</body>
</html>