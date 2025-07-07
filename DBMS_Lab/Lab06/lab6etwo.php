<?php
$db = mysqli_connect("localhost", "root", "", "Musa");

if (!$db) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>PHP MySqli (Procedural) Basics</title>
</head>
<body>
<?php
$sql = "SELECT * FROM department";
$result = mysqli_query($db, $sql);
if (!$result) {
    die("Error in query: " . mysqli_error($db));
}
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
    printf("%s %s\n", $row["departmentID"], $row["department_name"]);
    echo "<br/>";
}
mysqli_free_result($result);
?>
</body>
</html>
<?php
mysqli_close($db);
?>
