var inquirer = require("inquirer");
var mysql = require("mysql");

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "password",
    database: "bamazon_db"
});

connection.connect(function (err) {
    if (err) throw err;
});

inquirer.prompt([
    {
        type: "list",
        name: "command",
        message: "What would you like to do",
        choices: [{ name: "View Products for Sale", value: "viewProducts" },
        { name: "View Low Inventory", value: "lowInventory" },
        { name: "Add to Inventory", value: "addToInventory" },
        { name: "Add New Product", value: "addNewProduct" }]
    }

]).then(function (response) {
    switch (response.command) {
        case "viewProducts":
            viewProducts()
            break;
        case "lowInventory":
            viewLowInventory()
            break;
        case "addToInventory":
            addToInventory()
            break;
        case "addNewProduct":
            addNewProduct()
            break;
    }
});

function viewProducts() {
    connection.query(
        "SELECT item_id, product_name, price, stock_quantity FROM products",
        function (err, results) {
            if (err) {
                throw err;
            }
            console.table(results);
        }
    )
}

function viewLowInventory() {
    connection.query(
        "SELECT * FROM products WHERE stock_quantity < 5",
        function (err, results) {
            if (err) {
                throw err;
            }
            console.table(results);
        }
    )
}

function addToInventory() {
    inquirer.prompt([
        {
            type: "input",
            name: "userInput",
            message: "Enter the ID of the product you would add item.",
            filter: Number
        }
        ,
        {
            type: "input",
            name: "userUnitInput",
            message: "How many units would you like to buy?",
            filter: Number
        }
    ]).then(function (response) {
        connection.query(
            "UPDATE products SET stock_quantity = stock_quantity + ? WHERE item_id = ?",
            [response.userUnitInput, response.userInput],
            function(err, result){
                if (err) {
                    throw err;
                }
                console.log("Added!")
                viewProducts()
            }
        )
    })
}

function addNewProduct(){
   inquirer.prompt([
    {
        type: "input",
        name: "productName",
        message: "Enter the name of the new product.",
    }
    ,{
        type: "input",
        name: "departmentName",
        message: "What is the department of the new product?",
    }
    ,{
        type: "input",
        name: "price",
        message: "Enter the price of the new item.",
        filter: Number
    }
    ,{
        type: "input",
        name: "stockQuantity",
        message: "how many items to add inventory.",
        filter: Number
    }
   ]).then(function(response){
    connection.query(
        "INSERT INTO `bamazon_db`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES (?, ?, ?, ?);",
        [response.productName, response.departmentName, response.price, response.stockQuantity],
        function(err, result){
         if (err) {
             throw err;
         }
         console.log("Added!")
         viewProducts()
        }
     )
   })

}