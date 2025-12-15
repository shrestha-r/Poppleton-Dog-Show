<?php
require_once __DIR__ . '/../core/config.php';
session_start();
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>About Us - <?= APP_NAME ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?= APP_URL ?>/assets/css/styles.css">
</head>
<body>
<?php include __DIR__ . '/partials/header.php'; ?>

<main class="about-page">
    <section class="intro">
        <h1>About Poppleton Dog Show</h1>
        <p class="lead">For over 30 years Poppleton has celebrated the joy, agility and companionship of dogs with one of the friendliest shows in the country.</p>
    </section>

    <section class="mission">
        <div class="card">
            <h2>Our Mission</h2>
            <p>We promote responsible ownership, showcase canine talent and bring together a community that loves dogs as much as we do. Every tail-wag is a trophy.</p>
        </div>
    </section>

    <section class="features">
        <h2>What We Offer</h2>
        <div class="grid">
            <div class="item">
                <span class="emoji">🏆</span>
                <h3>Competitive Events</h3>
                <p>Agility, obedience, breed conformation and fun games for every skill level.</p>
            </div>
            <div class="item">
                <span class="emoji">🎯</span>
                <h3>Expert Judges</h3>
                <p>Experienced, Kennel-Club-approved professionals give fair, constructive feedback.</p>
            </div>
            <div class="item">
                <span class="emoji">🤝</span>
                <h3>Community Spirit</h3>
                <p>Meet breeders, trainers and fellow owners—swap tips, stories and smiles.</p>
            </div>
            <div class="item">
                <span class="emoji">📸</span>
                <h3>Memories & Prizes</h3>
                <p>Professional photos, rosettes and goodies for winners and participants alike.</p>
            </div>
        </div>
    </section>

    <section class="contact-cta">
        <div class="card">
            <h2>Join the Fun</h2>
            <p>Entries open three months before show-day. Got a question? <a href="04_contact.php">Contact us</a>—we’d love to hear from you.</p>
        </div>
    </section>
</main>

<?php include __DIR__ . '/partials/footer.php'; ?>
<script src="<?= APP_URL ?>/assets/js/scripts.js"></script>
</body>
</html>