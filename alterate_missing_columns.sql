SELECT CONCAT('ALTER TABLE ', t2.TABLE_NAME, ' ADD COLUMN ', t2.COLUMN_NAME, ' ' , t2.COLUMN_TYPE, ',')
FROM
(SELECT * FROM COLUMNS WHERE TABLE_SCHEMA='temp_temp') AS t2
LEFT JOIN
(SELECT * FROM COLUMNS WHERE TABLE_SCHEMA='temp_def') AS t1
ON t1.TABLE_NAME = t2.TABLE_NAME AND t1.COLUMN_NAME = t2.COLUMN_NAME
WHERE t1.COLUMN_NAME IS NULL
