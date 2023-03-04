CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE
); -- order cedveli yarat

ALTER TABLE orders ADD customer_id INT;
ALTER TABLE orders  ADD total_amount NUMBER; --sutun elave etmek

INSERT INTO orders VALUES(1, '2022-02-26', 123, 100.00);
INSERT INTO orders VALUES(2, '2022-02-27', 456, 200.00);
INSERT INTO orders VALUES(4, '2022-02-28', 234, 75.00);
INSERT INTO orders VALUES(5, '2022-02-28', 567, 300.00);
--Cedvelin doldurulmasi

SELECT * FROM orders WHERE order_date >= '2022-01-01';
SELECT * FROM orders WHERE order_date BETWEEN '2022-01-01' AND '2022-12-31';
