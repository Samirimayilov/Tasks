ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE TABLE customers (
  customer_id NUMBER(3) PRIMARY KEY,
  customer_name VARCHAR(50),
  customer_email VARCHAR(50)
); --cedvelin yaradilmasi

CREATE TABLE orders (
  order_id NUMBER(3) PRIMARY KEY,
  order_date NVARCHAR2(20),
  customer_id NUMBER(3),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);--cedvelin yaradilmasi

CREATE TABLE addresses (
  address_id NUMBER(3) PRIMARY KEY,
  customer_id NUMBER(3),
  street_address VARCHAR(100),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL
);--cedvelin yaradilmasi

--INSERT emri ile melumatlarin daxil edilmesi
INSERT INTO addresses VALUES(1, 1, '123 Main St');
INSERT INTO addresses VALUES(2, 1, '456 Oak Ave');
INSERT INTO addresses VALUES(3, 2, '789 Pine St' );

INSERT INTO customers VALUES(1, 'John Doe', 'johndoe@example.com');
INSERT INTO customers VALUES(2, 'Jane Doe', 'janedoe@example.com');
INSERT INTO customers VALUES(3, 'Bob Smith', 'bobsmith@example.com');

INSERT INTO orders VALUES(1, 2022-01-01, 1);
INSERT INTO orders VALUES(2, '2022-01-02', 2);
INSERT INTO orders VALUES(3, '2022-01-03', 1);

--SELECT emrileri
SELECT * FROM CUSTOMERS;

SELECT * FROM ORDERS;

SELECT * FROM ADDRESSES;


ALTER TABLE ORDERS SET UNUSED COLUMN order_date ; --Sutunun UNUSED kimi set olunmasi
ALTER TABLE ORDERS DROP UNUSED COLUMNS; --UNUSED sutunlarin silinmesi emri 

--SEQUENCE yaradilmasi
CREATE SEQUENCE my_seq
  START WITH 1
  INCREMENT BY 1;
--SEQUENCE ile cedvelin yaradilmasi
CREATE TABLE cedvel (
  id NUMBER DEFAULT my_seq.NEXTVAL PRIMARY KEY,
  name VARCHAR2(50)
);
--SEQUENCE ile cedvelin daxil edilmesi
INSERT INTO cedvel(name) VALUES ('John Doe');

--Eger spesifik bir deyer daxil etmek isteyirsinizse onda deyerle birlikde yazilir
INSERT INTO CEDVEL (ID,NAME) VALUES (2,'John doe');

--Sonraki deyerin göstərilməsi
SELECT my_seq.NEXTVAL FROM cedvel ;


--Evvelki deyerin göstərilməsi
SELECT my_sequence.CURRVAL FROM cedvel;
desc cedvel;

--DROP emri ile SEQUENCE siline biler
DROP SEQUENCE MY_SEQUENCE;

--DELETE emrinden istifade
DELETE FROM CEDVEL WHERE cedvel.id = 2;

--Cedvelin adinin deyisdirilmesi
ALTER TABLE CEDVEL RENAME TO Cedvel1;

--UPDATE emrinden istifade
UPDATE cedvel1 SET C_NAME = 'Samir' WHERE CEDVEL1.ID = 1;
