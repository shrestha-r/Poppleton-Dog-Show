<?php
require_once __DIR__ . '/../core/config.php';
require_once __DIR__ . '/../core/db.php';
$conn = getConnection();
session_start();

/* if logged-in show that user, otherwise use ?id= query-string for public view */
if (isset($_SESSION['user_id'])) {
    $owner = $conn->prepare('SELECT * FROM users WHERE id = ?');
    $owner->execute([$_SESSION['user_id']]);
} else {
    $id = $_GET['id'] ?? 0;
    $owner = $conn->prepare('SELECT * FROM users WHERE id = ?');
    $owner->execute([$id]);
}
$owner = $owner->fetch();
if (!$owner) {
    http_response_code(404);
    exit('User not found');
}

/* dogs this user owns (if any) */
$dogs = $conn->prepare('SELECT d.name AS dog_name, b.name AS breed
                        FROM dogs d
                        JOIN breeds b ON b.id = d.breed_id
                        WHERE d.owner_id = ?');
$dogs->execute([$owner['id']]);
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><?= htmlspecialchars($owner['username']) ?> - <?= APP_NAME ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?= APP_URL ?>/assets/css/styles.css">
</head>
<body>
<?php include __DIR__ . '/partials/header.php'; ?>

<main class="owner-page">
    <div class="card profile">
        <h1><?= htmlspecialchars($owner['username']) ?></h1>
        <p>Email: <a href="mailto:<?= htmlspecialchars($owner['email']) ?>"><?= htmlspecialchars($owner['email']) ?></a></p>

        <?php if (isset($_SESSION['user_id']) && $_SESSION['user_id'] == $owner['id']): ?>
            <a class="btn" href="o3_logout.php">Logout</a>
        <?php endif; ?>
    </div>

    <h2>Dogs (<?= $dogs->rowCount() ?>)</h2>
    <div class="dog-list">
        <?php while ($d = $dogs->fetch()): ?>
            <div class="dog-mini">
                <?php
                /* primary image or random API */
                $img = $conn->query(
                    "SELECT image_url FROM images WHERE dog_id = ? AND is_primary = 1 LIMIT 1"
                )->fetch();
                $imgSrc = $img
                    ? $img['image_url']
                    : 'https://dog.ceo/api/breed/' . strtolower(explode(' ', $d['breed'])[0]) . '/images/random';
                ?>
                <img src="<?= $imgSrc ?>" alt="<?= htmlspecialchars($d['dog_name']) ?>"
                     onerror="this.src='<?= APP_URL ?>/assets/images/placeholder-dog.jpg'">
                <div>
                    <strong><?= htmlspecialchars($d['dog_name']) ?></strong><br>
                    <?= htmlspecialchars($d['breed']) ?>
                </div>
            </div>
        <?php endwhile; ?>
    </div>
</main>

<?php include __DIR__ . '/partials/footer.php'; ?>
<script src="<?= APP_URL ?>/assets/js/scripts.js"></script>
</body>
</html>