--RANK CEDVELIMIZDEKI UYGUN XANAYA RANKLAR VERIR
SELECT EMPLOYEEID , NAME, SALARY,RANK() 
OVER ( ORDER BY SALARY DESC) FROM EMPLOYEES FETCH FIRST 3 ROWS ONLY;

--PARTITION BY'LA CEDVELI HISSELERE BOLUR VE ONLARA RANK VERIR
SELECT EMPLOYEEID , NAME, SALARY,DEPARTMENTID,RANK() 
OVER (PARTITION BY DEPARTMENTID ORDER BY SALARY DESC) FROM EMPLOYEES;

--RANKDAN FERQLI OLARAQ DENSE_RANK EYNI DEYERLI XANALARA EYNI RANK VERIR
SELECT EMPLOYEEID , NAME, SALARY,DENSE_RANK() 
OVER ( ORDER BY SALARY DESC) FROM EMPLOYEES;

--PARTITION BY'LA CEDVELI HISSELERE BOLUR VE ONLARA RANK VERIR
SELECT EMPLOYEEID , NAME, SALARY,DEPARTMENTID,DENSE_RANK() 
OVER (PARTITION BY DEPARTMENTID ORDER BY SALARY DESC) FROM EMPLOYEES;

--FIRST_VALUE IL DEYERI QAYTARIR
SELECT NAME, SALARY , MAX_SALARY - SALARY AS FERQ 
FROM (SELECT FIRST_VALUE(SALARY) OVER (ORDER BY SALARY DESC) AS MAX_SALARY , E.* FROM EMPLOYEES E);

--PARTITION BY'LA ISLENIR VE BU ZAMAN BIR NECE ILK DEYER QAYTARIR
SELECT NAME, SALARY , MAX_SALARY - SALARY AS FERQ 
FROM (SELECT FIRST_VALUE(SALARY) 
OVER (PARTITION BY DEPARTMENTID ORDER BY SALARY DESC) AS MAX_SALARY , E.* FROM EMPLOYEES E);

--LIST YARADIR
SELECT DISTINCT LISTAGG(NAME,',' ) WITHIN GROUP (ORDER BY DEPARTMENTID)
OVER (PARTITION BY DEPARTMENTID) AS ISCILER, DEPARTMENTID FROM EMPLOYEES;

--CEDVELIN BIR SONRAKI ROW'UNUN DEYERINI QAYTARIR
SELECT SALARY, LAG(SALARY,1) OVER (ORDER BY SALARY) ,SALARY - LAG(SALARY,1) 
OVER (ORDER BY SALARY ASC) FROM EMPLOYEES;

--CEDVELIN BIR EVVELKI ROW'UNUN DEYERINI QAYTARIR
SELECT SALARY, LEAD(SALARY,1) OVER (ORDER BY SALARY) ,SALARY - LEAD(SALARY,1) 
OVER (ORDER BY SALARY ASC) FROM EMPLOYEES;