DROP DATABASE IF EXISTS company_trackerDB;
CREATE DATABASE company_trackerDB;

USE company_trackerDB;

CREATE TABLE department(
    departmentID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    PRIMARY KEY (departmentID)  
);

CREATE TABLE role (
    roleID INT NOT NULL AUTO_INCREMENT,
    position VARCHAR(45) NOT NULL,
    salary DECIMAL NOT NULL,
    departmentID INT,
    PRIMARY KEY (roleID),
    FOREIGN KEY (departmentID) REFERENCES department (departmentID)
);

CREATE TABLE employee (
    employeeID INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    roleID INT,
    managerID INT,
	PRIMARY KEY (employeeID),
    FOREIGN KEY (roleID) REFERENCES role (roleID)
);

INSERT INTO department(name) VALUES ("Marketing");
INSERT INTO department(name) VALUES ("Operations");
INSERT INTO department(name) VALUES ("Finance");
INSERT INTO department(name) VALUES ("Sales");
INSERT INTO department(name) VALUES ("Human Resources");

INSERT INTO role(position, salary, departmentID) VALUES ("Account Executive", 244900, 4);
INSERT INTO role(position, salary, departmentID) VALUES ("Automation Specialist", 108376, 2);
INSERT INTO role(position, salary, departmentID) VALUES ("Tax Accountant", 287749, 3);
INSERT INTO role(position, salary, departmentID) VALUES ("Paralegal", 55000, 5);
INSERT INTO role(position, salary, departmentID) VALUES ("Administrative Officer", 40000, 5);
INSERT INTO role(position, salary, departmentID) VALUES ("Human Resources Manager", 200000, 5);
INSERT INTO role(position, salary, departmentID) VALUES ("Project Manager", 55000.00, 1);
INSERT INTO role(position, salary, departmentID) VALUES ("Finance Manager", 65000.00, 3);
INSERT INTO role(position, salary, departmentID) VALUES ("Staff Scientist", 20000.00, 2);
INSERT INTO role(position, salary, departmentID) VALUES ("Assistant Media Planner", 43000, 1);
INSERT INTO role(position, salary, departmentID) VALUES ("Junior Executive", 108376, 3);
INSERT INTO role(position, salary, departmentID) VALUES ("Web Developer", 287749, 1);
INSERT INTO role(position, salary, departmentID) VALUES ("Senior Cost Accountant", 108500, 3);
INSERT INTO role(position, salary, departmentID) VALUES ("Internal Auditor", 40000, 5);
INSERT INTO role(position, salary, departmentID) VALUES ("Director of Sales", 200000, 4);
INSERT INTO role(position, salary, departmentID) VALUES ("Research Associate", 55000.00, 1);
INSERT INTO role(position, salary, departmentID) VALUES ("Chief Design Engineer", 234034, 2);
INSERT INTO role(position, salary, departmentID) VALUES ("Compensation Analyst", 40000, 4);
INSERT INTO role(position, salary, departmentID) VALUES ("Help Desk Operator", 25000, 5);
INSERT INTO role(position, salary, departmentID) VALUES ("Senior Sales Associate", 55000, 4);
INSERT INTO role(position, salary, departmentID) VALUES ("Business Systems Development Analyst", 70034, 3);

INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Chad", "Kmiec", 3, 8);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Nevsa", "Lawful", 18, 15);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Jere", "Blindt", 16, 7);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Beniamino", "Blankett", 14, 6);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Brittani", "Latehouse", 4, 6);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Layne", "Ranking", 3, 8);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Dianne", "Plackstone", 10, 7);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Zenia", "Sapshed", 5, 6);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Erminie", "Drennan", 11, 8);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Isaac", "Hedylstone", 3, 8);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Filippo", "Douthwaite", 12, 7);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Donielle", "Sawkin", 20, 15);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Rosalyn", "Rudinger", 20, 15);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Phil", "Wintle", 17, NULL);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Sada", "Albiston", 1, 15);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Meriel", "Hilary", 6, NULL);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Ellwood0", "Gudge", 16, 7);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Letizia", "Lebell", 9, 17);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Red", "Baistow", 9, 17);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Merell", "Lacoviello", 7, NULL);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Hugh", "Heiton", 21, 8);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Moshe", "Winpenny", 2, 17);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Blithe", "Gianuzzi", 10, 7);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Skipper", "Caslett", 11, 8);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Yancy", "Ybarra", 13, 8);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Akim", "Gedge", 14, 6);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Angie", "Lytle", 19, 6);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Regina", "Ortell", 4, 6);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Riane", "Ivashov", 8, NULL);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Martin", "Stevenston", 9, 17);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Leah", "Guillon", 18, 15);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Concettina", "Lickorish", 14, 6);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Melamie", "Reape", 16, 7);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Tobie", "Everley", 16, 7);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Alana", "Herkess", 10, 7);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Rosaline", "Mucklow", 3, 8);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Clemmy", "Arnaudet", 10, 7);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Codie", "Heinemann", 2, 17);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Quincey", "Pasticznyk", 9, 17);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Coleman", "O'Flaverty", 13, 8);
INSERT INTO employee(firstName, lastName, roleID, managerID) VALUES ("Alys", "Perkins", 8, NULL);