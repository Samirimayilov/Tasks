
CREATE TABLE customers (
  customer_id NUMBER(3) PRIMARY KEY,
  customer_name VARCHAR(50),
  customer_email VARCHAR(50)
);

CREATE TABLE orders (
  order_id NUMBER(3) PRIMARY KEY,
  order_date NVARCHAR2(20),
  customer_id NUMBER(3),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE addresses (
  address_id NUMBER(3) PRIMARY KEY,
  customer_id NUMBER(3),
  street_address VARCHAR(100),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL
);

INSERT INTO addresses VALUES(1, 1, '123 Main St');
INSERT INTO addresses VALUES(2, 1, '456 Oak Ave');
INSERT INTO addresses VALUES(3, 2, '789 Pine St' );

INSERT INTO customers VALUES(1, 'John Doe', 'johndoe@example.com');
INSERT INTO customers VALUES(2, 'Jane Doe', 'janedoe@example.com');
INSERT INTO customers VALUES(3, 'Bob Smith', 'bobsmith@example.com');

INSERT INTO orders VALUES(1, 2022-01-01, 1);
INSERT INTO orders VALUES(2, '2022-01-02', 2);
INSERT INTO orders VALUES(3, '2022-01-03', 1);

SELECT * FROM CUSTOMERS;

SELECT * FROM ORDERS;

SELECT * FROM ADDRESSES;

SELECT orders.order_id, orders.order_date, customers.customer_name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id WHERE customers.customer_name='John Doe';


SELECT * 
FROM addresses
INNER JOIN customers
ON addresses.customer_id = customers.customer_id 
WHERE customers.customer_name = 'John Doe';
