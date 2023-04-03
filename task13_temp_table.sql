CREATE GLOBAL TEMPORARY TABLE temp_enrollmentt(
  student_id INT,
  course_id INT,
  semester VARCHAR2(20),
  grade CHAR(1)
) ON COMMIT DELETE ROWS;

SELECT * FROM TEMP_ENROLLMENTT;

INSERT INTO temp_enrollmentt (student_id, course_id, semester, grade)
VALUES (123456, 7890, 'Fall 2022', 'A');

COMMIT;

CREATE GLOBAL TEMPORARY TABLE temp_enrollment (
  student_id INT,
  course_id INT,
  semester VARCHAR2(20),
  grade CHAR(1)
) ON COMMIT PRESERVE ROWS;

SELECT * FROM TEMP_ENROLLMENT;

INSERT INTO temp_enrollment (student_id, course_id, semester, grade)
VALUES (123456, 7890, 'Fall 2022', 'A');

COMMIT;
