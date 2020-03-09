DROP DATABASE IF EXISTS company_trackerDB;
CREATE DATABASE company_trackerDB;

USE company_trackerDB;

CREATE TABLE department(
    departmentID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)  
);

CREATE TABLE role (
    roleID INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(30) NOT NULL,
    salary DECIMAL NOT NULL,
    department_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (departmentID) REFERENCES department (departmentID)
);

CREATE TABLE employee (
    employeeID INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    roleID INT,
    managerID INT,
	PRIMARY KEY (employeeID),
    FOREIGN KEY (roleID) REFERENCES role (roleID),
    FOREIGN KEY (managerID) REFERENCES role (roleID)
);