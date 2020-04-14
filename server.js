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
        "Update an employee",
        "Update a role",
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

        case "Update a role":
          updateRole();
          break;

        case "Update an employee":
          updateEmployee();
          break;

        case "Exit application":
          connection.end();
          break;
      }
    });
}

//working
function updateEmployee() {
  inquirer
    .prompt([
      {
        name: "employeeID",
        type: "input",
        message:
          "Enter the ID number of employee you wish to update (Keep in mind ID 14, 16, 20, 29, and 41 are managers)",
      },
      {
        name: "firstName",
        type: "input",
        message: "Enter the employee's new first name",
      },
      {
        name: "lastName",
        type: "input",
        message: "Enter the employee's new last name",
      },
      {
        name: "roleID",
        type: "input",
        message: "Enter the employee's new role ID",
      },
      {
        name: "managerID",
        type: "input",
        message:
          "Enter the manager ID the updated employee is associated with ((6) Human Resources Manager, (7) Project Manager, (8) Finance Manager, (15) Director of Sales, or (17) Chief Design Engineer)",
      },
    ])
    .then(function (answer) {
      connection.query(
        "UPDATE employee SET firstName = ?, lastName = ?, roleID = ?, managerID = ? WHERE employeeID = ?",
        [
          answer.firstName,
          answer.lastName,
          answer.roleID,
          answer.managerID,
          answer.employeeID,
        ],
        (err) => {
          if (err) throw err;
          console.log("Successfully updated role!");
          viewEmployees();
        }
      );
    });
}

//working
function updateRole() {
  inquirer
    .prompt([
      {
        name: "roleID",
        type: "input",
        message:
          "Enter the ID number of role you wish to update (Enter a number from 1-21 keeping in mind 6, 7, 8, 15, and 17 are manager roles)",
      },
      {
        name: "position",
        type: "input",
        message: "Enter the name of this new role",
      },
      {
        name: "salary",
        type: "input",
        message: "Enter the salary of this new role",
      },
      {
        name: "departmentID",
        type: "input",
        message:
          "Enter a department ID for this role (Enter a number from 1-5)",
      },
    ])
    .then(function (answer) {
      connection.query(
        "UPDATE role SET position = ?, salary = ?, departmentID = ? WHERE roleID = ?",
        [answer.position, answer.salary, answer.departmentID, answer.roleID],
        (err) => {
          if (err) throw err;
          console.log("Successfully updated role!");
          viewRoles();
        }
      );
    });
}

//working
function addDepartment() {
  inquirer
    .prompt({
      name: "name",
      type: "input",
      message: "Add a new department",
    })
    .then(function (answer) {
      connection.query(
        "INSERT INTO department (name) VALUE (?)",
        answer.name,
        function (err, res) {
          if (err) throw err;
          viewDepartments();
        }
      );
    });
}

//working
function addRolePrompt() {
  inquirer
    .prompt([
      {
        name: "position",
        message: "What is the name of the position you'd like to add?",
      },
      {
        name: "salary",
        message: "What is the salary for this role?",
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

//working
function addRole(position, salary, department) {
  connection.query(
    `INSERT INTO role (position, salary, departmentID) VALUES(?, ?, ?)`,
    [position, salary, department],
    (err) => {
      if (err) throw err;
      viewRoles();
      console.log("Successfully added the role into the roles table!");
    }
  );
}

//working
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
        message:
          "What is the employee's position within the company? (Use the employee table for reference)",
      },
      {
        name: "manager",
        message:
          "Enter the employee's corresponding manager ID: (6) Human Resources Manager, (7) Project Manager, (8) Finance Manager, (15) Director of Sales, or (17) Chief Design Engineer",
      },
    ])
    .then((answer) => {
      connection.query(
        `INSERT INTO employee (firstName, lastName, roleID, managerID) VALUES (?, ?, (SELECT roleID FROM role WHERE position = ?), ?)`,
        [answer.firstName, answer.lastName, answer.position, answer.manager],
        (err, res) => {
          if (err) throw err;
          console.log(`Successfully added a new employee!`);
          viewEmployees();
        }
      );
    });
}

//working
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

//working
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

//working
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
