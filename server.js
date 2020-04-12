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
  database: "company_trackerDB",
});

connection.connect(function (err) {
  if (err) throw err;
  runSearch();
});

function runSearch() {
  inquirer
    .prompt({
      name: "action",
      type: "list",
      message: "What would you like to do?",
      choices: [
        "View all departments",
        "View all employees",
        "View all roles",
        "Update employee roles",
        "Add a department",
        "Add a role",
        "Add an employee",
        "Exit application",
      ],
    })
    .then(function (answer) {
      switch (answer.action) {
        case "Add a department":
          addDepartment();
          break;

        case "Add a role":
          addRolePrompt();
          break;

        case "Add an employee":
          addEmployee();
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

//to be completed
function updateRoles() {
  console.log("working on it");
}

//working
function addDepartment() {
  inquirer
    .prompt({
      name: "name",
      type: "input",
      message: "add a department",
    })
    .then(function (res) {
      connection.query(
        "INSERT INTO department (name) VALUE (?)",
        res.name,
        function (err, res) {
          if (err) throw err;
          viewDepartments();
        }
      );
    });
}

//working now
function addRolePrompt() {
  inquirer
    .prompt([
      {
        name: "position",
        message: "What is the name of the position you'd like to add?",
      },
      {
        name: "salary",
        message: "What is the yearly salary for this role?",
      },
      {
        name: "department",
        message:
          "What department is this role associated with? (Enter (1) for Marketing, (2) for Operations, (3) for Finance, (4) for Sales or (5) for Human Resources)",
      },
    ])
    .then((answer) => {
      const position = answer.position.toString();
      const salary = parseFloat(answer.salary);
      const department = answer.department.toString();
      addRole(position, salary, department);
    });
}

function addRole(position, salary, department) {
  connection.query(`SELECT * FROM role, department`, (err, role) => {
    if (err) throw err;
    connection.query(
      `INSERT INTO role (position, salary, departmentID) VALUES(?, ?, ?)`,
      [position, salary, department],
      (err) => {
        if (err) throw err;
        viewRoles();
        console.log("Successfully added the role into the roles table!");
      }
    );
  });
}

function addEmployee() {
  inquirer
    .prompt([
      {
        name: "firstName",
        message: "What is employees first name?",
      },
      {
        name: "lastName",
        message: "What is employees last name?",
      },
      {
        name: "position",
        message: "What is employees position within the company?",
      },
      {
        name: "manager",
        message:
          "Who is their manager? Enter the id of the manager (enter 6, 7, 8, 15, or 17)",
      },
    ])
    .then((answer) => {
      const firstName = answer.firstName;
      const lastName = answer.lastName;
      const position = answer.position;
      const manager = answer.manager;

      connection.query(
        `INSERT INTO employee (firstName, lastName, roleID, managerID) VALUES (?, ?, (SELECT roleID FROM role WHERE position = ?), ?)`,
        [firstName, lastName, position, manager],
        (err, res) => {
          if (err) throw err;
          console.log(`Successfully added a new employee!`);
          viewEmployees();
        }
      );
    });
}

function viewDepartments() {
  connection.query(`SELECT * FROM department`, (err, departments) => {
    if (err) throw err;
    const newTable = table.getTable(departments);
    console.log(newTable);
    inquirer
      .prompt([
        {
          name: "action",
          message: "Type yes and hit enter to go back to the search prompt",
        },
      ])
      .then((answer) => {
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
          message: "Type yes and hit enter to go back to the search prompt",
        },
      ])
      .then((answer) => {
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
          message: "Type yes and hit enter to go back to the search prompt",
        },
      ])
      .then((answer) => {
        if (answer.action) {
          runSearch();
        }
      });
  });
}
