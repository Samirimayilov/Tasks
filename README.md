# Tasks
Big data taskları
CREATE USER USER4 IDENTIFIED BY "1234";
GRANT CREATE SESSION TO USER4;
GRANT UNLIMITED TABLESPACE TO USER4;
ALTER USER USER4 QUOTA UNLIMITED ON USERS;
GRANT SELECT, INSERT , UPDATE, DELETE ON WEBSITEUSER TO USER4;
GRANT ALL ON WEBSITEUSER TO USER4;
GRANT ALL PRIVILEGES TO USER4;

CREATE TABLE WEBSITEUSER(
USER_ID NUMBER(3) CONSTRAINT W_I_PK PRIMARY KEY,
USER_NAME NVARCHAR2(40) CONSTRAINT W_N_NN NOT NULL UNIQUE,
USER_EMAIL NVARCHAR2(40) CONSTRAINT W_E_NN NOT NULL UNIQUE,
USER_PASSWORD NVARCHAR2(40) CONSTRAINT W_P_NN NOT NULL
);


INSERT INTO WEBSITEUSER VALUES (1,'SAMIR','samir@gmail.com','123456');
INSERT INTO WEBSITEUSER VALUES (2,'ANAR','anar@gmail.com','123456');
INSERT INTO WEBSITEUSER VALUES (3,'TOFIQ','tofiq@gmail.com','123456');

ALTER TABLE WEBSITEUSER RENAME TO WEBSITEDATA;
ALTER TABLE WEBSITEUSER RENAME COLUMN USER_NAME TO USER_ADI;
ALTER TABLE WEBSITEUSER ADD GENDER NVARCHAR2(10);
ALTER TABLE WEBSITEUSER MODIFY GENDER NVARCHAR2(8);
ALTER TABLE WEBSITEUSER DROP COLUMN GENDER;
ALTER TABLE WEBSITEUSER ADD PHONE NUMBER(20);
UPDATE WEBSITEUSER SET WEBSITEUSER.USER_PASSWORD='1234567' WHERE USER_NAME ='SAMIR';
ALTER TABLE WEBSITEUSER RENAME CONSTRAINT SYS_C008320 TO W_P_NN;
ALTER TABLE WEBSITEUSER MODIFY USER_ID PRIMARY KEY;

DELETE FROM WEBSITEUSER WHERE websiteuser.user_id= 1;
DROP TABLE WEBSITEUSER;

SELECT * FROM user_constraints WHERE TABLE_NAME= 'WEBSITEUSER';
SELECT * FROM WEBSITEUSER;
SELECT websiteuser.user_name,websiteuser.user_email FROM websiteuser;
SELECT * FROM WEBSITEUSER WHERE websiteuser.user_name ='SAMIR';
SELECT * FROM WEBSITEUSER WHERE websiteuser.user_name LIKE 'S%';
SELECT * FROM WEBSITEUSER WHERE websiteuser.user_name ='SAMIR' AND websiteuser.user_email = 'samir@gmail.com';
SELECT * FROM WEBSITEUSER WHERE websiteuser.user_name IS NOT NULL;










CREATE TABLE KITAB(
KITAB_ID NUMBER(3),
KITAB_AD NVARCHAR2(25) CONSTRAINT K_A_NN NOT NULL,
KITAB_YAZICI NVARCHAR2(25) CONSTRAINT K_Y_NN NOT NULL,
KITAB_SAYI NUMBER(3) CONSTRAINT K_S_NN NOT NULL,
CONSTRAINT KITAB_PK PRIMARY KEY (KITAB_ID),--OUTLINE PRIMARY KEY
CONSTRAINT KT_UNI UNIQUE (KITAB_AD,KITAB_YAZICI)--OUTLINE UNIQUE
);
INSERT INTO KITAB VALUES (1,'3 YOLDASH','A.DUMA',4);
INSERT INTO KITAB VALUES (2,'FIZIKA','S.KERIMOV',10);
INSERT INTO KITAB VALUES (3,'SEFILLER','V.HUGO',3);

SELECT* FROM KITAB;

CREATE TABLE TELEBE(
TELEBE_ID NUMBER(3),
TELEBE_AD NVARCHAR2(25) CONSTRAINT T_A_NN NOT NULL,--NOT NULL OUTLINE YAZILA BILMIR
TELEBE_SOYAD NVARCHAR2(25) CONSTRAINT T_SA_NN NOT NULL,
CONSTRAINT TELEBE_PK PRIMARY KEY (TELEBE_ID)--OUTLINE PRIMARY KEY
);

INSERT INTO TELEBE VALUES (1,'ADNAN','PASHAYEV');
INSERT INTO TELEBE VALUES (2,'MURAD','HACIYEV');
INSERT INTO TELEBE VALUES (3,'QENIRE','HUSEYINOVA');
INSERT INTO TELEBE VALUES (4,'SEDEF','TALIBZADE');

SELECT * FROM TELEBE;

CREATE TABLE TELEBE_KITAB(
TK_ID NUMBER(4) CONSTRAINT TK_PK PRIMARY KEY,--INLINE PRIMARY KEY
KT_TELEBE_ID  NUMBER(3),
TK_KITAB_ID NUMBER(3),
CONSTRAINT T_ID_FK FOREIGN KEY (KT_TELEBE_ID) REFERENCES TELEBE(TELEBE_ID),--FOREIGN KEY
CONSTRAINT K_ID_FK FOREIGN KEY (TK_KITAB_ID) REFERENCES KITAB(KITAB_ID)--FOREIGN KEY
);
INSERT INTO TELEBE_KITAB VALUES (5,1,3);
