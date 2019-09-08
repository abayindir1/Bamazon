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
        message: "What would you like to do?",
        choices: [{ name: "View Product Sales by Department", value: "viewProducts" },
        { name: "Create New Department", value: "createDepartment" }]
    }
]).then(function (response) {
    switch (response.command) {
        case "viewProducts":
            viewProductsByDepartment()
            break;
        case "createDepartment":
            createDepartment()
            break;
    }
});


function viewProductsByDepartment() {
    connection.query(
        "SELECT departments.department_id, departments.departments_name, departments.over_head_cost, SUM(products.product_sales) AS product_sales, SUM(products.product_sales) - departments.over_head_cost AS total_profit FROM departments RIGHT JOIN products ON departments.departments_name = products.department_name GROUP BY departments_name",
        function (err, results) {
            if (err) {
                throw err;
            }

            console.table(results)

        }
    )
}

function createDepartment() {
    inquirer.prompt([
        {
            type: "input",
            name: "name",
            message: "Enter the name of the new department.",
        }
        , {
            type: "input",
            name: "overHeadCost",
            message: "What is the over head cost o the new department?",
        }
    ]).then(function (response) {
        connection.query(
            "INSERT INTO `bamazon_db`.`departments` (`departments_name`, `over_head_cost`) VALUES (?, ?)",
            [response.name, response.overHeadCost],
            function (err, result) {
                if (err) {
                    throw err;
                }
                console.log("Added!")
                viewDepartmentsTable();
            }
        )
    })
}

function viewDepartmentsTable() {
    connection.query(
        "SELECT * FROM departments",
        function (err, results) {
            if (err) {
                throw err;
            }
            console.table(results);
        }
    )
}