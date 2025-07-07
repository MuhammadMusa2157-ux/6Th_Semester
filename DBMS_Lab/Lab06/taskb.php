<?php
$conn = new mysqli("localhost", "root", "", "Musa");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// INSERT
if (isset($_POST['insert'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $sql = "INSERT INTO users (name, email) VALUES ('$name', '$email')";
    $conn->query($sql);
}

// UPDATE
if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $sql = "UPDATE users SET name='$name', email='$email' WHERE id=$id";
    $conn->query($sql);
}

// DELETE
if (isset($_POST['delete'])) {
    $id = $_POST['id'];
    $sql = "DELETE FROM users WHERE id=$id";
    $conn->query($sql);
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Task 6.2 - PHP MySQLi OOP</title>
</head>
<body>
<h2>Insert New User</h2>
<form method="post">
    Name: <input type="text" name="name" required>
    Email: <input type="email" name="email" required>
    <input type="submit" name="insert" value="Insert">
</form>

<h2>Update User</h2>
<form method="post">
    ID: <input type="number" name="id" required>
    New Name: <input type="text" name="name">
    New Email: <input type="email" name="email">
    <input type="submit" name="update" value="Update">
</form>

<h2>Delete User</h2>
<form method="post">
    ID: <input type="number" name="id" required>
    <input type="submit" name="delete" value="Delete">
</form>

<h2>All Users</h2>
<?php
$result = $conn->query("SELECT * FROM users");
if ($result->num_rows > 0) {
    echo "<table border='1'><tr><th>ID</th><th>Name</th><th>Email</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>".$row["id"]."</td><td>".$row["name"]."</td><td>".$row["email"]."</td></tr>";
    }
    echo "</table>";
} else {
    echo "No users found.";
}
$result->free();
$conn->close();
?>
</body>
</html>
