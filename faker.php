<?php

// pour lancer le code, dans le terminal écrire: php -S localhost:8000 et http://localhost:8000/filled.php sur un navigateur

require_once 'vendor/autoload.php';

$host = '127.0.0.1';
$db = 'e-commerce';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
    echo 'Connexion réussie à la base de données MySQL' . PHP_EOL;
} catch (PDOException $e) {
    throw new PDOException($e->getMessage(), (int)$e->getCode());
}

$faker = Faker\Factory::create();

$stmt = $pdo->prepare("
    INSERT INTO product (Name, Price, Category, stock_quantity)
    VALUES (:name, :price, :category, :stock_quantity)
");

for ($i = 0; $i < 10; $i++) {
    $stmt->execute([
        ':name' => $faker->word,
        ':price' => $faker->randomFloat(2, 10, 1000),
        ':category' => $faker->word,
        ':stock_quantity' => $faker->numberBetween(1, 100)
    ]);
}

echo 'Produits insérés avec succès.' . PHP_EOL;

$stmt = $pdo->prepare("
    INSERT INTO user_cart (User_ID, Cart_ID)
    VALUES (:user_id, :cart_id)
");

for ($i = 0; $i < 10; $i++) {
    $stmt->execute([
        ':user_id' => $faker->numberBetween(1, 10),
        ':cart_id' => $faker->numberBetween(1, 10)
    ]);
}

echo 'User Carts insérés avec succès.' . PHP_EOL;

$stmt = $pdo->prepare("
    INSERT INTO command (User_ID, Date, User_Cart)
    VALUES (:user_id, :date, :user_cart)
");

for ($i = 0; $i < 10; $i++) {
    $stmt->execute([
        ':user_id' => $faker->numberBetween(1, 10),
        ':date' => $faker->dateTimeThisYear->format('Y-m-d H:i:s'),
        ':user_cart' => $faker->numberBetween(1, 10)
    ]);
}

echo 'Commandes insérées avec succès.' . PHP_EOL;

$stmt = $pdo->prepare("
    INSERT INTO invoices (User_ID, Total, Command_ID)
    VALUES (:user_id, :total, :command_id)
");

for ($i = 0; $i < 10; $i++) {
    $stmt->execute([
        ':user_id' => $faker->numberBetween(1, 10),
        ':total' => $faker->randomFloat(2, 20, 500),
        ':command_id' => $faker->numberBetween(1, 10)
    ]);
}

echo 'Factures insérées avec succès.' . PHP_EOL;

$stmt = $pdo->prepare("
    INSERT INTO payment (User_ID, Command_ID)
    VALUES (:user_id, :command_id)
");

for ($i = 0; $i < 10; $i++) {
    $stmt->execute([
        ':user_id' => $faker->numberBetween(1, 10),
        ':command_id' => $faker->numberBetween(1, 10)
    ]);
}

echo 'Paiements insérés avec succès.' . PHP_EOL;

$stmt = $pdo->prepare("
    INSERT INTO rate (Note, Opinion, Product_ID)
    VALUES (:note, :opinion, :product_id)
");

for ($i = 0; $i < 10; $i++) {
    $stmt->execute([
        ':note' => $faker->numberBetween(1, 5),
        ':opinion' => $faker->sentence,
        ':product_id' => $faker->numberBetween(1, 10)
    ]);
}

echo 'Évaluations insérées avec succès.' . PHP_EOL;
