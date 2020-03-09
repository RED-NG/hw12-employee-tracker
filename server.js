const mysql = require("mysql");
const inquirer = require("inquirer");
const table = require("console.table");

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "codingbootcamp1",
  database: "company_trackerDB"
});

connection.connect(function(err) {
  if (err) throw err;
  runSearch();
});

function runSearch() {
  inquirer
    .prompt({
      name: "action",
      type: "rawlist",
      message: "What would you like to do?",
      choices: [
        "View all departments",
        "View all employees",
        "View all roles",
        "Update employee roles",
        "Add a department",
        "Add a role",
        "Add an employee",
        "Remove an employee",
        "Remove a role",
        "Remove a department",
        "Exit application"
      ]
    })
    .then(function(answer) {
      switch (answer.action) {
        case "Add a department":
          addDepartment();
          break;

        case "Add a role":
          addRole();
          break;

        case "Add an employee":
          addEmployee();
          break;

        case "Remove a department":
          removeDepartment();
          break;

        case "Remove a role":
          removeRole();
          break;

        case "Remove an employee":
          removeEmployee();
          break;

        case "View all departments":
          viewDepartments();
          break;

        case "View all employees":
          viewEmployees();
          break;

        case "View all roles":
          viewRoles();
          break;

        case "Update employee roles":
          updateRoles();
          break;

        case "Exit application":
          connection.end();
          break;
      }
    });
}

function addDepartment() {
  inquirer
    .prompt({
      name: "name",
      type: "input",
      message: "add a department"
    })
    .then(function(res) {
      connection.query(
        "INSERT INTO department (name) VALUE (?)",
        res.name,
        function(err, res) {
          if (err) throw err;
          viewDepartments();
        }
      );
    });
}

function addRole() {}

function addEmployee() {}

function removeDepartment() {}

function removeRole() {}

function removeEmployee() {}

function viewDepartments() {
  connection.query(`SELECT * FROM department`, (err, departments) => {
    if (err) throw err;
    const newTable = table.getTable(departments);
    console.log(newTable);
    inquirer
      .prompt([
        {
          name: "action",
          message: "Type yes and hit enter to go back to the search prompt"
        }
      ])
      .then(answer => {
        if (answer.action) {
          runSearch();
        }
      });
  });
}

function viewEmployees() {
  connection.query(`SELECT * FROM employee`, (err, employee) => {
    if (err) throw err;
    const newTable = table.getTable(employee);
    console.log(newTable);
    inquirer
      .prompt([
        {
          name: "action",
          message: "Type yes and hit enter to go back to the search prompt"
        }
      ])
      .then(answer => {
        if (answer.action) {
          runSearch();
        }
      });
  });
}

function viewRoles() {
  connection.query(`SELECT * FROM role`, (err, role) => {
    if (err) throw err;
    const newTable = table.getTable(role);
    console.log(newTable);
    inquirer
      .prompt([
        {
          name: "action",
          message: "Type yes and hit enter to go back to the search prompt"
        }
      ])
      .then(answer => {
        if (answer.action) {
          runSearch();
        }
      });
  });
}

function updateRoles() {}
