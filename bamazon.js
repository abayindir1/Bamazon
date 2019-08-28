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

function showTable() {
    connection.query(
        "SELECT * FROM products",
        function (err, results) {
            if (err) {
                throw err;
            }
            console.table(results);
        }
    )
}


showTable()
inquirer.prompt([
    {
        type: "input",
        name: "userInput",
        message: "Enter the ID o the product you would like to buy.",
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
        "UPDATE products SET stock_quantity = stock_quantity - ? WHERE item_id = ? and stock_quantity > 0",
        [response.userUnitInput, response.userInput],
        function (err, results) {
            if (err) {
                throw err;
            }
            showTable() 
        }
    )
});