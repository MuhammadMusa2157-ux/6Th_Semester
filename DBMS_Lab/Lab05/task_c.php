<?php

// Function to check if a number is prime
function isPrime($num) {
    if ($num <= 1) return false;
    if ($num == 2) return true;
    if ($num % 2 == 0) return false;
    for ($i = 3; $i <= sqrt($num); $i += 2) {
        if ($num % $i == 0) return false;
    }
    return true;
}

$max = 10;  // Change this if you want a bigger table

echo "<table border='1' cellpadding='8' cellspacing='0'>";
echo "<tr><th>/</th>";

// Header row: numbers 1 to $max
for ($header = 1; $header <= $max; $header++) {
    echo "<th>$header</th>";
}
echo "</tr>";

// Generate division table with additional info
for ($row = 1; $row <= $max; $row++) {
    echo "<tr>";
    echo "<th>$row</th>";  // Row header

    for ($col = 1; $col <= $max; $col++) {
        $div = $row / $col;

        // Determine odd or even for the numerator (row number)
        $oddEven = ($row % 2 == 0) ? "Even" : "Odd";

        // Check if prime
        $primeMsg = isPrime($row) ? "<br><small>(Prime)</small>" : "";

        // Cell content
        echo "<td>";
        echo number_format($div, 2) . "<br>";
        echo "<small>$oddEven $primeMsg</small>";
        echo "</td>";
    }
    echo "</tr>";
}
echo "</table>";

?>
