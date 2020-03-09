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
    position VARCHAR(30) NOT NULL,
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
    FOREIGN KEY (roleID) REFERENCES role (roleID),
    FOREIGN KEY (managerID) REFERENCES department (departmentID)
);

INSERT INTO department(name) VALUES ("Marketing");
INSERT INTO department(name) VALUES ("Operations");
INSERT INTO department(name) VALUES ("Finance");
INSERT INTO department(name) VALUES ("Sales");
INSERT INTO department(name) VALUES ("Human Resources");
INSERT INTO department(name) VALUES ("General Management");

INSERT INTO role(position, salary, departmentID) VALUES ("Account Executive", 244900, 4);
INSERT INTO role(position, salary, departmentID) VALUES ("Automation Specialist", 108376, 2);
INSERT INTO role(position, salary, departmentID) VALUES ("Tax Accountant", 287749, 3);
INSERT INTO role(position, salary, departmentID) VALUES ("Paralegal", 55000, 5);
INSERT INTO role(position, salary, departmentID) VALUES ("Administrative Officer", 40000, 5);
INSERT INTO role(position, salary, departmentID) VALUES ("Human Resources Manager", 200000, 6);
INSERT INTO role(position, salary, departmentID) VALUES ("Project Manager", 55000.00, 6);
INSERT INTO role(position, salary, departmentID) VALUES ("Facility Manager", 65000.00, 6);
INSERT INTO role(position, salary, departmentID) VALUES ("Staff Scientist", 20000.00, 2);
INSERT INTO role(position, salary, departmentID) VALUES ("Assistant Media Planner", 43000, 1);
INSERT INTO role(position, salary, departmentID) VALUES ("Junior Executive", 108376, 3);
INSERT INTO role(position, salary, departmentID) VALUES ("Web Developer", 287749, 1);
INSERT INTO role(position, salary, departmentID) VALUES ("Senior Cost Accountant", 108500, 3);
INSERT INTO role(position, salary, departmentID) VALUES ("Internal Auditor", 40000, 5);
INSERT INTO role(position, salary, departmentID) VALUES ("Director of Sales", 200000, 6);
INSERT INTO role(position, salary, departmentID) VALUES ("Research Associate", 55000.00, 1);
INSERT INTO role(position, salary, departmentID) VALUES ("Chief Design Engineer", 234034, 2);
INSERT INTO role(position, salary, departmentID) VALUES ("Compensation Analyst", 40000, 4);
INSERT INTO role(position, salary, departmentID) VALUES ("Help Desk Operator", 25000, 5);
INSERT INTO role(position, salary, departmentID) VALUES ("Senior Sales Associate", 55000, 4);
INSERT INTO role(position, salary, departmentID) VALUES ("Business Systems Development Analyst", 70034, 3);

INSERT INTO employee(firstName, lastName, roleID) VALUES ("Chad", "Kmiec", 3);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Nevsa", "Lawful", 18);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Jere", "Blindt", 16);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Beniamino", "Blankett", 8);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Brittani", "Latehouse", 4);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Layne", "Ranking", 3);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Dianne", "Plackstone", 10);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Zenia", "Sapshed", 5);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Erminie", "Drennan", 15);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Isaac", "Hedylstone", 3);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Filippo", "Douthwaite", 12);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Donielle", "Sawkin", 20);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Rosalyn", "Rudinger", 20);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Phil", "Wintle", 17);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Sada", "Albiston", 1);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Meriel", "Hilary", 6);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Ellwood0", "Gudge", 16);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Letizia", "Lebell", 9);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Red", "Baistow", 9);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Merell", "Lacoviello", 7);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Hugh", "Heiton", 21);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Moshe", "Winpenny", 2);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Blithe", "Gianuzzi", 10);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Skipper", "Caslett", 11);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Yancy", "Ybarra", 13);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Akim", "Gedge", 14);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Angie", "Lytle", 19);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Regina", "Ortell", 7);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Riane", "Ivashov", 8);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Martin", "Stevenston", 9);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Leah", "Guillon", 17);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Concettina", "Lickorish", 14);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Melamie", "Reape", 16);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Tobie", "Everley", 16);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Alana", "Herkess", 10);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Rosaline", "Mucklow", 3);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Clemmy", "Arnaudet", 8);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Codie", "Heinemann", 6);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Quincey", "Pasticznyk", 9);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Coleman", "O'Flaverty", 13);
INSERT INTO employee(firstName, lastName, roleID) VALUES ("Alys", "Perkins", 8);