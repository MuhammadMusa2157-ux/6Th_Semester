<?php
// Define a class
class Vehicle {
    public $brand;
    public $color;

    // Constructor method
    public function __construct($brand, $color) {
        $this->brand = $brand;
        $this->color = $color;
    }

    // Method to display info
    public function displayInfo() {
        echo "This vehicle is a $this->color $this->brand.<br>";
    }
}

// Create objects from the class
$car = new Vehicle("Toyota", "Red");
$bike = new Vehicle("Honda", "Blue");

// Use object methods
$car->displayInfo();
$bike->displayInfo();
?>
