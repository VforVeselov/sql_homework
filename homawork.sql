
CREATE TABLE department (id SERIAL PRIMARY KEY, name VARCHAR(100), isProfit BOOLEAN);

INSERT INTO department (name, isProfit) VALUES ('Бухгалтерия', FALSE);
INSERT INTO department (name, isProfit) VALUES ('Кредитный одел', TRUE);
INSERT INTO department (name, isProfit) VALUES ('Отдел продаж', TRUE);
INSERT INTO department (name, isProfit) VALUES ('Правление', FALSE);

SELECT * FROM department;

CREATE TABLE employee (id SERIAL PRIMARY KEY, fullname VARCHAR(100), salary INTEGER, departmet_id INTEGER REFERENCES department (id));
INSERT INTO employee (fullname, salary, departmet_id) VALUES ('Петров Иван', 30000, 3);
INSERT INTO employee (fullname, salary, departmet_id) VALUES ('Иванова Наталья', 50000, 1);
INSERT INTO employee (fullname, salary, departmet_id) VALUES ('Мирских Петр', 100000, 4);
INSERT INTO employee (fullname, salary, departmet_id) VALUES ('Улюкаев Владимир', 200000, 4);
INSERT INTO employee (fullname, salary, departmet_id) VALUES ('Заморский Виктор', 70000, 2);

SELECT * FROM employee WHERE departmet_id=4;

SELECT SUM(salary) as SUM_SALARY FROM employee;

SELECT employee.fullname AS FullName, department.isProfit AS isprofit FROM employee LEFT JOIN department on employee.departmet_id = department.id;

SELECT fullname FROM employee WHERE salary > 10000 AND salary < 100000;

DELETE FROM employee WHERE id=3;

UPDATE department SET name='депозитный отдел', isprofit=false WHERE id=2;

SELECT * FROM employee WHERE LOWER(fullname) LIKE '%иван%';

SELECT d.name as department, AVG(e.salary) as average_salary FROM department as d INNER JOIN employee as e ON e.departmet_id=d.id GROUP BY d.name;

DROP TABLE department;
DROP TABLE employee;
