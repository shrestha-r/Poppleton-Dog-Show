<?php
require_once __DIR__ . '/../core/config.php';
require_once __DIR__ . '/../core/db.php';
session_start();
$conn = getConnection();

/* ---------- counters ---------- */
$stats = $conn->query(
    "SELECT  
        (SELECT COUNT(*) FROM owners) AS owners,
        (SELECT COUNT(*) FROM dogs)   AS dogs,
        (SELECT COUNT(*) FROM events) AS events"
)->fetch();

/* ---------- top-10 dogs (avg score) ---------- */
$topDogs = $conn->query(
    "SELECT 
        d.name        AS dog_name,
        b.name        AS breed,
        COUNT(e.dog_id) AS no_entries,
        ROUND(AVG(e.score),1) AS avg_score,
        o.id          AS owner_id,
        o.name        AS owner_name,
        o.email
     FROM entries e
     INNER JOIN dogs   d ON e.dog_id   = d.id
     INNER JOIN breeds b ON d.breed_id = b.id
     INNER JOIN owners o ON d.owner_id = o.id
     GROUP BY e.dog_id
     HAVING no_entries > 1
     ORDER BY avg_score DESC
     LIMIT 10"
)->fetchAll();

/* ---------- event winners (highest score per competition) ---------- */
$winners = $conn->query(
    "SELECT evt.description AS event_name,
            d.name          AS dog_name,
            b.name          AS breed,
            o.name          AS owner_name,
            e.score
     FROM entries e
     INNER JOIN (
         SELECT competition_id, MAX(score) AS max_score
         FROM entries
         GROUP BY competition_id
     ) max_s ON e.competition_id = max_s.competition_id AND e.score = max_s.max_score
     INNER JOIN competitions c ON c.id = e.competition_id
     INNER JOIN events evt ON evt.id = c.event_id
     INNER JOIN dogs d ON d.id = e.dog_id
     INNER JOIN breeds b ON b.id = d.breed_id
     INNER JOIN owners o ON o.id = d.owner_id
     ORDER BY c.id ASC
     LIMIT 6"
)->fetchAll();
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><?= APP_NAME ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?= APP_URL ?>/assets/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
</head>
<body>
<?php include __DIR__ . '/partials/header.php'; ?>

<main class="homepage">

    <!-- 1. HERO -->
    <section class="hero">
        <h1>🏆 Famous Poppleton Dog Show</h1>
        <p>Celebrating excellence, agility and the bond between dogs and their owners.<br>
            Browse top performers, past winners and breed highlights.</p>
    </section>

    <!-- 2. DOG OF THE DAY -->
    <section class="dog-of-day">
        <?php
        $dog = $conn->query(
            "SELECT d.id, d.name AS dog_name, b.name AS breed, o.name AS owner_name, o.email
             FROM dogs d
             JOIN breeds b ON b.id = d.breed_id
             JOIN owners o ON o.id = d.owner_id
             ORDER BY RAND()
             LIMIT 1"
        )->fetch();

        $img = $conn->query(
            "SELECT image_url FROM images WHERE dog_id = ? AND is_primary = 1 LIMIT 1"
        )->fetch();
        $imgSrc = $img
            ? $img['image_url']
            : 'https://dog.ceo/api/breed/' . strtolower(explode(' ', $dog['breed'])[0]) . '/images/random';
        ?>
        <div class="card">
            <span class="badge">⭐ Featured</span>
            <img src="<?= $imgSrc ?>" alt="<?= htmlspecialchars($dog['dog_name']) ?>"
                 onerror="this.src='<?= APP_URL ?>/assets/images/placeholder-dog.jpg'">
            <h3><?= htmlspecialchars($dog['dog_name']) ?></h3>
            <p><strong>Breed:</strong> <?= htmlspecialchars($dog['breed']) ?></p>
            <p><strong>Owner:</strong> <?= htmlspecialchars($dog['owner_name']) ?></p>
            <p><a href="mailto:<?= htmlspecialchars($dog['email']) ?>">Contact owner</a></p>
        </div>
    </section>

    <!-- 3. FUN FACT (schema-correct) -->
    <section class="fun-fact">
        <?php
        $facts = [
            /* most popular breed */
            $conn->query(
                "SELECT br.name AS breed, COUNT(*) AS c
                   FROM dogs d
                   JOIN breeds br ON br.id = d.breed_id
                   GROUP BY br.id
                   ORDER BY c DESC
                   LIMIT 1"
            )->fetch(),

            /* owner with most dogs */
            $conn->query(
                "SELECT o.name AS owner_name, COUNT(*) AS c
                   FROM owners o
                   JOIN dogs d ON d.owner_id = o.id
                   GROUP BY o.id
                   ORDER BY c DESC
                   LIMIT 1"
            )->fetch(),

            /* busiest judge (chief judge of most competitions) */
            $conn->query(
                "SELECT j.name AS judge_name, COUNT(*) AS c
                   FROM judges j
                   JOIN competitions c ON c.chief_judge_id = j.id
                   GROUP BY j.id
                   ORDER BY c DESC
                   LIMIT 1"
            )->fetch(),

            /* highest average entry score per event */
            $conn->query(
                "SELECT e.description AS event_name, AVG(en.score) AS avg
                   FROM entries en
                   JOIN competitions c ON c.id = en.competition_id
                   JOIN events e ON e.id = c.event_id
                   GROUP BY e.id
                   ORDER BY avg DESC
                   LIMIT 1"
            )->fetch()
        ];

        $idx  = array_rand($facts);
        $fact = $facts[$idx];
        ?>
        <div class="card">
            <?php if ($idx == 0): ?>
                <h3>🐾 Fun Fact</h3>
                <p>The most common breed is <strong><?= htmlspecialchars($fact['breed']) ?></strong> with <?= $fact['c'] ?> dogs!</p>
            <?php elseif ($idx == 1): ?>
                <h3>👑 Super Owner</h3>
                <p>The owner with the most dogs is <strong><?= htmlspecialchars($fact['owner_name']) ?></strong> with <?= $fact['c'] ?> dogs.</p>
            <?php elseif ($idx == 2): ?>
                <h3>👨‍⚖️ Judge Spotlight</h3>
                <p>The busiest judge is <strong><?= htmlspecialchars($fact['judge_name']) ?></strong>, chief judge for <?= $fact['c'] ?> competitions.</p>
            <?php else: ?>
                <h3>🏅 Event Highlight</h3>
                <p>The highest average score was in <strong><?= htmlspecialchars($fact['event_name']) ?></strong> (<?= number_format($fact['avg'], 1) ?> pts).</p>
            <?php endif; ?>
        </div>
    </section>

    <!-- 4. STATS -->
    <section class="stats">
        <div class="stat-card">
            <div class="value"><?= $stats['owners'] ?></div>
            <div class="label">Owners</div>
        </div>
        <div class="stat-card">
            <div class="value"><?= $stats['dogs'] ?></div>
            <div class="label">Dogs</div>
        </div>
        <div class="stat-card">
            <div class="value"><?= $stats['events'] ?></div>
            <div class="label">Events</div>
        </div>
    </section>

    <!-- 5. SEARCH + TABLE + WINNERS -->
    <section class="search-bar">
        <input type="text" id="dogSearch" placeholder="🔍 Search dogs, breeds, or owners...">
    </section>

    <section class="top-dogs">
        <h2>Top 10 Dogs</h2>
        <div class="table-wrapper">
            <table id="dogTable">
                <thead>
                    <tr>
                        <th>Dog Name</th>
                        <th>Breed</th>
                        <th>Avg Score</th>
                        <th>Owner</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($topDogs as $row): ?>
                        <tr>
                            <td><?= htmlspecialchars($row['dog_name']) ?></td>
                            <td><?= htmlspecialchars($row['breed']) ?></td>
                            <td><?= $row['avg_score'] ?></td>
                            <td><a href="owner.php?id=<?= $row['owner_id'] ?>"><?= htmlspecialchars($row['owner_name']) ?></a></td>
                            <td><a href="mailto:<?= htmlspecialchars($row['email']) ?>"><?= htmlspecialchars($row['email']) ?></a></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </section>

    <section class="event-winners">
        <h2>Best Score in Every Event</h2>
        <div class="winner-cards">
            <?php foreach ($winners as $w): ?>
                <div class="winner-card">
                    <h3><?= htmlspecialchars($w['event_name']) ?></h3>
                    <p><strong><?= htmlspecialchars($w['dog_name']) ?></strong> (<?= htmlspecialchars($w['breed']) ?>)</p>
                    <p><?= $w['score'] ?> pts</p>
                    <p>Owner: <?= htmlspecialchars($w['owner_name']) ?></p>
                </div>
            <?php endforeach; ?>
        </div>
    </section>

</main>

<?php include __DIR__ . '/partials/footer.php'; ?>
<script src="<?= APP_URL ?>/assets/js/scripts.js"></script>
</body>
</html>