<?php
$db = mysqli_connect("localhost", "root", "", "Musa");
if (!$db) {
    die("Connection failed: " . mysqli_connect_error());
}
?>

<html>
<head>
    <title>PHP MySQL Basics</title>
</head> 
<body>
<?php
$result = mysqli_query($db, "SELECT * FROM department");
while ($row = mysqli_fetch_array($result)) {
    echo $row[0] . " " . $row[1] . "<br />";
}
?>
</body>
</html>

<?php
mysqli_close($db);
?>
