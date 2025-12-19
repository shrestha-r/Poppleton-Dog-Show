<?php
require_once __DIR__ . '/../core/config.php';
session_start();

$sent = false;
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name  = trim($_POST['name']  ?? '');
    $email = trim($_POST['email'] ?? '');
    $msg   = trim($_POST['msg']   ?? '');

    // simple mail (change to your address)
    $to      = 'poppleton@example.com';
    $subject = 'Poppleton Dog Show - Contact Form';
    $body    = "Name: $name\nEmail: $email\n\nMessage:\n$msg";
    mail($to, $subject, $body, "From: $email");
    $sent = true;
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Contact - <?= APP_NAME ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?= APP_URL ?>/assets/css/styles.css">
</head>
<body>
<?php include __DIR__ . '/partials/header.php'; ?>

<main class="contact-page">
    <h1>Contact Us</h1>

    <div class="card">
        <?php if ($sent): ?>
            <p class="success">Thanks! Your message has been sent.</p>
        <?php else: ?>
            <form method="post" class="auth-card">
                <label>Name
                    <input type="text" name="name" required>
                </label>

                <label>Email
                    <input type="email" name="email" required>
                </label>

                <label>Message
                    <textarea name="msg" rows="6" required></textarea>
                </label>

                <button type="submit">Send Message</button>
            </form>
        <?php endif; ?>
    </div>

    <!-- Google-map embed (replace src if you want) -->
    <div class="map-box">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2435.123456!2d-2.123456!3d53.123456!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNTPCsDA3JzI2LjAiTiAywrAwNic1MC4wIlc!5e0!3m2!1sen!2suk!4v1234567890"
                allowfullscreen="" loading="lazy"></iframe>
    </div>
</main>

<?php include __DIR__ . '/partials/footer.php'; ?>
<script src="<?= APP_URL ?>/assets/js/scripts.js"></script>
</body>
</html>