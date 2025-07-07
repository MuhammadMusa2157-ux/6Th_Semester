<?php
class Vehicle {
    public $brand;
    public $color;
    public function __construct($brand, $color) {
        $this->brand = $brand;
        $this->color = $color;    }
    public function displayInfo() {
        echo "This vehicle is a $this->color $this->brand.<br>";
    }
}
class Car extends Vehicle {
    public $doors;
    public function __construct($brand, $color, $doors) {
        parent::__construct($brand, $color);  
        $this->doors = $doors;
    }

    public function displayInfo() {
        echo "This car is a $this->color $this->brand with $this->doors doors.<br>";
    }
}

$myCar = new Car("BMW", "Black", 4);
$myCar->displayInfo();
?>
