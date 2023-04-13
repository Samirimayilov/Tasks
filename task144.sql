SELECT A.* FROM ACTORS A 
JOIN MOVIE_CAST M ON A.ACT_ID = M.ACT_ID 
JOIN MOVIE MO ON M.MOV_ID = MO.MOV_ID
WHERE INITCAP( MO.M_TITLE) = 'Annie Hall';

SELECT *  FROM MOVIE WHERE UPPER(MOV_REL_COUNTRY) = 'UK';

SELECT M.* FROM MOVIE M 
JOIN MOVIE_DIRECTION MD ON M.MV_ID = MD.MV_ID
JOIN DIRECTOR D ON D.DIR_ID = MD.DIR_ID 
WHERE INITCAP(D.DIR_FNAME)='Woddy' AND INITCAP(D.DIR_LNAME) = 'Allen';

SELECT MOV_YEAR FROM MOVIE M
JOIN RATING R ON R.MOV_ID = M.MOV_ID
WHERE R.RAY_STARS > 3 AND 
(SELECT COUNT (*) FROM MOVIE GROUP BY M.MOV_YEAR)> 0 ORDER BY M.MOV_YEAR ASC;

SELECT REV_NAME , MOV_TITLE, REV_STARS FROM RATING R 
JOIN REVIEWER REV ON REV.REV_ID = R.REV_ID
JOIN MOVIE M ON M.MOV_ID = R.MOV_ID 
WHERE R.REV_STARS IS NOT NULL AND NUM_O_RATINGS IS NOT NULL
ORDER BY REV_NAME ASC, MOV_TITLE ASC, REV_STARS ASC;

SELECT MOV_TITLE , MAX (REV_STARS) FROM RATINGS R
JOIN MOVIE M ON R.MOV_ID = M.MOV_ID 
GROUP BY MOV_TITLE ORDER BY MOV_TITLE ASC; 