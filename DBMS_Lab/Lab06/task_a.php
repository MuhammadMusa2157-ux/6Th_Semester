<?php
$conn = new mysqli("localhost", "root", "", "Musa");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully<br><br>";
?>
<!DOCTYPE html><html><head>
    <title>PHP MySqli (Object-Oriented) Basics</title></head><body>
<?php
$sql = "SELECT * FROM department";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo $row["departmentID"] . " " . $row["department_name"] . "<br />";
    }
} else {
    echo "0 results";
}

$result->free_result();
?>
</body>
</html>
<?php
$conn->close();
?>