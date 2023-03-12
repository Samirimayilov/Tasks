CREATE TABLE sales (
   id INT PRIMARY KEY,
   product VARCHAR(50),
   region VARCHAR(50),
   sales_amount DECIMAL(10,2)
);

INSERT INTO sales (id, product, region, sales_amount) VALUES(1, 'Widget', 'East', 5000.00);
INSERT INTO sales (id, product, region, sales_amount) VALUES(2, 'Widget', 'West', 7000.00);
INSERT INTO sales (id, product, region, sales_amount) VALUES(3, 'Gizmo', 'East', 3000.00);
INSERT INTO sales (id, product, region, sales_amount) VALUES(4, 'Gizmo', 'West', 4000.00);
INSERT INTO sales (id, product, region, sales_amount) VALUES(5, 'Widget', 'North', 6000.00);
INSERT INTO sales (id, product, region, sales_amount) VALUES(6, 'Gizmo', 'North', 2000.00);

SELECT product, region, SUM(sales_amount)
FROM sales
GROUP BY CUBE (product, region);

SELECT NAME,EMAIL,SUM(SALARY) 
FROM EMPLOYEES 
GROUP BY CUBE (NAME,EMAIL) 
ORDER BY NAME NULLS LAST, EMAIL NULLS LAST;

SELECT product, region, SUM(sales_amount)
FROM sales
GROUP BY ROLLUP (product, region);

SELECT NAME,EMAIL,SUM(SALARY) 
FROM EMPLOYEES 
GROUP BY ROLLUP (NAME,EMAIL) ;
