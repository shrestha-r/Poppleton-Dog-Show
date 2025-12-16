<?php
require_once __DIR__ . '/../core/config.php';
require_once __DIR__ . '/../core/db.php';
$conn = getConnection();
session_start();

/* ---------- all dogs + breed + owner ---------- */
$dogs = $conn->query(
    "SELECT d.name AS dog_name,
            b.name AS breed,
            o.name AS owner_name,
          di.image_url AS image_url
     FROM dogs d
     JOIN breeds b ON b.id = d.breed_id
     JOIN owners o ON o.id = d.owner_id
     JOIN dog_images di ON di.dog_id = d.id
     ORDER BY d.name;"
)->fetchAll();
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Our Dogs - <?= APP_NAME ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?= APP_URL ?>/assets/css/styles.css">
</head>
<body>
<?php include __DIR__ . '/partials/header.php'; ?>

<main class="dogs-page">
    <h1>Meet the Dogs</h1>

    <div class="dog-grid">
        <?php foreach ($dogs as $d):?>
            <div class="dog-card">
                <img src="<?= $d['image_url'] ?>" alt="<?= htmlspecialchars($d['dog_name']) ?>"
                     onerror="this.src='<?= APP_URL ?>/assets/images/placeholder-dog.jpg'">
                <h3><?= htmlspecialchars($d['dog_name']) ?></h3>
                <p><?= htmlspecialchars($d['breed']) ?></p>
                <small>Owner: <?= htmlspecialchars($d['owner_name']) ?></small>
            </div>
        <?php endforeach; ?>
    </div>
</main>

<?php include __DIR__ . '/partials/footer.php'; ?>
<script src="<?= APP_URL ?>/assets/js/scripts.js"></script>
</body>
</html>