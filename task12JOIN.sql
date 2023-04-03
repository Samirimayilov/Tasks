CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_cost NUMBER(10,2),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR2(50),
  email VARCHAR2(50),
  address VARCHAR2(100)
);

INSERT INTO Customers (customer_id, name, email, address)
VALUES (1, 'John Smith', 'john.smith@example.com', '123 Main St.');
INSERT INTO Customers (customer_id, name, email, address)
VALUES (2, 'Jane Doe', 'jane.doe@example.com', NULL);
INSERT INTO Customers (customer_id, name, email, address)
VALUES (3, 'Bob Johnson', NULL, '456 Oak Ave.');
INSERT INTO Customers (customer_id, name, email, address)
VALUES (4, 'Mary Lee', NULL, NULL);
INSERT INTO Customers (customer_id, name, email, address)
VALUES (5, NULL, 'joe.black@example.com', '789 Maple Blvd.');
INSERT INTO Orders (order_id, customer_id, order_date, total_cost)
VALUES (1, 1, '2022-01-01', 100.00);
INSERT INTO Orders (order_id, customer_id, order_date, total_cost)
VALUES (2, 2, '2022-01-02', NULL);
INSERT INTO Orders (order_id, customer_id, order_date, total_cost)
VALUES (3, 3, '2022-01-03', 50.00);
INSERT INTO Orders (order_id, customer_id, order_date, total_cost)
VALUES (4, NULL, '2022-01-04', NULL);
INSERT INTO Orders (order_id, customer_id, order_date, total_cost)
VALUES (5, 5, NULL, 75.00);

SELECT * FROM CUSTOMERS;

SELECT * FROM ORDERS;

SELECT * FROM CUSTOMERS S JOIN ORDERS O
ON S.CUSTOMER_ID = O.CUSTOMER_ID;

SELECT * FROM CUSTOMERS S, ORDERS O
WHERE S.CUSTOMER_ID = O.CUSTOMER_ID;

SELECT * FROM CUSTOMERS S LEFT JOIN ORDERS O
ON S.CUSTOMER_ID = O.CUSTOMER_ID;

SELECT * FROM CUSTOMERS S, ORDERS O
WHERE S.CUSTOMER_ID = O.CUSTOMER_ID(+);

SELECT * FROM CUSTOMERS S RIGHT JOIN ORDERS O
ON S.CUSTOMER_ID = O.CUSTOMER_ID;

SELECT * FROM CUSTOMERS S, ORDERS O
WHERE S.CUSTOMER_ID(+) = O.CUSTOMER_ID;

SELECT * FROM CUSTOMERS S CROSS JOIN ORDERS O;

