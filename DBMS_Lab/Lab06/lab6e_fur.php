<?php
$username = 'root';
$password = '';
try {
    $str = 'mysql:host=localhost;dbname=Musa;charset=utf8';
    $db = new PDO($str, $username, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully<br><br>";
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>PHP PDO Basics</title></head><body>
<?php
$q = $db->prepare("SELECT * FROM department");
$q->execute();
$q_records = $q->fetchAll();
foreach ($q_records as $row) {
    printf("%s %s\n", $row["departmentID"], $row["department_name"]);
    echo "<br>";
}
?>
</body>
</html>
<?php
$db = null;
?>