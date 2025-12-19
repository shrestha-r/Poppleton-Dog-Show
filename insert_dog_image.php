<?php
$host = 'localhost';
$db   = 'cis2360_dog_show';
$user = 'root';
$pass = '';

$pdo = new PDO(
    "mysql:host=$host;dbname=$db;charset=utf8mb4",
    $user,
    $pass,
    [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
);

$sql = "
    SELECT d.id AS dog_id, b.name AS breed_name
    FROM dogs d
    JOIN breeds b ON d.breed_id = b.id
    ORDER BY d.id
";
$dogs = $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);

function breedToApiPath(string $breedName): string {
    $breedName = trim($breedName);
    $parts = preg_split('/\s+/', $breedName);

    if (count($parts) === 1) {
        return strtolower($parts[0]);
    }

    return strtolower(end($parts)) . '/' . strtolower($parts[0]);
}

$insert = $pdo->prepare("
    INSERT INTO dog_images (dog_id, image_url, is_primary)
    VALUES (:dog_id, :image_url, 1)
");

foreach ($dogs as $dog) {
    $breedPath = breedToApiPath($dog['breed_name']);
    $apiUrl = "https://dog.ceo/api/breed/$breedPath/images/random";

    $json = @file_get_contents($apiUrl);
    if ($json === false) {
        continue; // you will handle placeholders manually
    }

    $data = json_decode($json, true);
    if (($data['status'] ?? '') !== 'success') {
        continue;
    }

    $insert->execute([
        ':dog_id'    => $dog['dog_id'],
        ':image_url' => $data['message']
    ]);

    echo "Inserted image for dog ID {$dog['dog_id']}<br>";

    usleep(300000); // polite API usage
}
?>



<!-- 

For failed rows 
run ths  following sql command


INSERT INTO dog_images (dog_id, image_url, is_primary)
SELECT d.id, 'https://placehold.co/600x400?text=No+Image', 1
FROM dogs d
LEFT JOIN dog_images di ON di.dog_id = d.id
WHERE di.dog_id IS NULL;

-->
