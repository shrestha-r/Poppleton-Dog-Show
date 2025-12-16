<?php
require_once __DIR__ . '/../../core/config.php';
require_once __DIR__ . '/../../core/db.php';
session_start();

$username = $email = $password = $confirm = $err = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $email    = trim($_POST['email']    ?? '');
    $password = trim($_POST['password'] ?? '');
    $confirm  = trim($_POST['confirm']  ?? '');

    if (strlen($password) < 6) {
        $err = 'Password must be at least 6 characters.';
    } elseif ($password !== $confirm) {
        $err = 'Passwords do not match.';
    } else {
        $conn = getConnection();
        $exists = $conn->prepare('SELECT id FROM users WHERE email = ?');
        $exists->execute([$email]);
        if ($exists->fetch()) {
            $err = 'Email already registered.';
        } else {
            $hash = password_hash($password, PASSWORD_DEFAULT);
            $stmt = $conn->prepare(
                'INSERT INTO users (username, email, password_hash, role, owner_id)
                 VALUES (?, ?, ?, "user", NULL)'
            );
            $stmt->execute([$username, $email, $hash]);

            $_SESSION['user_id']  = $conn->lastInsertId();
            $_SESSION['username'] = $username;
            header('Location: ../01_index.php');
            exit;
        }
    }
}
$author = 'Rahul Shrestha';   // footer credit
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Register | <?= APP_NAME ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?= APP_URL ?>/assets/css/styles.css">
</head>
<body>
<?php include __DIR__ . '/../partials/header.php'; ?>

<main class="auth-wrapper">
    <div class="auth-card">
        <h2>Register</h2>

        <?php if ($err): ?><p class="error-bubble"><?= htmlspecialchars($err) ?></p><?php endif; ?>

        <form method="post" action="02_register.php">
            <label>Username</label>
            <input type="text" name="username" value="<?= htmlspecialchars($username) ?>" required>

            <label>Email</label>
            <input type="email" name="email" value="<?= htmlspecialchars($email) ?>" required>

            <label>Password</label>
            <input type="password" name="password" required minlength="6">

            <label>Confirm Password</label>
            <input type="password" name="confirm" required minlength="6">

            <button type="submit">Create Account</button>
        </form>

        <p class="auth-link">Already registered? <a href="01_login.php">Login here</a></p>
    </div>
</main>

<?php include __DIR__ . '/../partials/footer.php'; ?>
<script src="<?= APP_URL ?>/assets/js/scripts.js"></script>
</body>
</html>