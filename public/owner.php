<?php
require_once __DIR__ . '/../core/config.php';
require_once __DIR__ . '/../core/db.php';

$conn = getConnection();

// /* -------------------------
//    Validate owner ID
// -------------------------- */
if (!isset($_GET['id']) || !ctype_digit($_GET['id'])) {
    die('Invalid owner.');
}

$ownerId = (int) $_GET['id'];

// /* -------------------------
//    Fetch owner
// -------------------------- */
$ownerStmt = $conn->prepare("
    SELECT id, name, email, address, phone
    FROM owners
    WHERE id = :id
");
$ownerStmt->execute([':id' => $ownerId]);
$owner = $ownerStmt->fetch();

if (!$owner) {
    die('Owner not found.');
}

// /* -------------------------
//    Fetch dogs
// -------------------------- */
$dogsStmt = $conn->prepare("
    SELECT 
        d.id,
        d.name AS dog_name,
        b.name AS breed,
        COUNT(e.id) AS entries_count,
        ROUND(AVG(e.score),2) AS avg_score,
        di.image_url
    FROM dogs d
    INNER JOIN breeds b ON d.breed_id = b.id
    LEFT JOIN entries e ON e.dog_id = d.id
    LEFT JOIN dog_images di
           ON di.dog_id = d.id
    WHERE d.owner_id = :owner_id
    GROUP BY d.id, d.name, b.name, di.image_url
    ORDER BY avg_score DESC
");
$dogsStmt->execute([':owner_id' => $ownerId]);
$dogs = $dogsStmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?= htmlspecialchars($owner['name']) ?> | <?= APP_NAME ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?= APP_URL ?>/assets/css/styles.css">
</head>
<body>

<?php include __DIR__ . '/partials/header.php'; ?>

<main class="owner-page">

    <!-- OWNER INFO -->
    <section class="profile card">
        <h1><?= htmlspecialchars($owner['name']) ?></h1>

        <p><strong>Email:</strong>
            <a href="mailto:<?= htmlspecialchars($owner['email']) ?>">
                <?= htmlspecialchars($owner['email']) ?>
            </a>
        </p>

        <p><strong>Address:</strong> <?= htmlspecialchars($owner['address']) ?></p>
        <p><strong>Phone:</strong> <?= htmlspecialchars($owner['phone']) ?></p>
    </section>

    <!-- DOGS -->
    <section>
        <h2>Dogs</h2>

        <?php if (!$dogs): ?>
            <p>No dogs registered for this owner.</p>
        <?php else: ?>
            <div class="dog-list">
                <?php foreach ($dogs as $dog): ?>
                    <div class="dog-mini">
                        <img src="<?= htmlspecialchars(
                            $dog['image_url']
                            ?? APP_URL . '/assets/images/placeholder-dog.jpg'
                        ) ?>"
                        alt="<?= htmlspecialchars($dog['dog_name']) ?>">

                        <div>
                            <strong><?= htmlspecialchars($dog['dog_name']) ?></strong><br>
                            Breed: <?= htmlspecialchars($dog['breed']) ?><br>
                            Entries: <?= $dog['entries_count'] ?><br>
                            Avg score:
                            <?= $dog['avg_score'] !== null ? $dog['avg_score'] : 'N/A' ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </section>

</main>

<?php include __DIR__ . '/partials/footer.php'; ?>

</body>
</html>
