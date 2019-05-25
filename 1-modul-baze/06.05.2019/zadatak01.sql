--16
SELECT w.worker_name AS "Ime",
	w.worker_lastname AS "Prezime"
FROM workers AS w 
WHERE w.worker_lastname LIKE '%at%'

--17
INSERT INTO `workers`(`worker_name`, `worker_lastname`, `salary`, `worker_since_datetime`, `id_department`, `id_city`) 
VALUES ("Ime", "Prezime", 1000, "2019-06-05 09:00:00", 1, 2)

--18
UPDATE `workers` 
SET worker_name = 'Darko'  WHERE id_worker = 2 AND id_city = (SELECT c.id_city FROM cities AS c WHERE c.city_name LIKE 'Mostar')


--19
UPDATE `workers` 
SET worker_name = 'Darko'  WHERE id_worker = 2 AND id_city = (SELECT c.id_city FROM cities AS c WHERE c.city_name LIKE 'Mostar')

UPDATE workers AS w 
	INNER JOIN departments AS d 
    	ON w.id_department = d.id_department
SET salary = 2000
WHERE d.department_name LIKE 'P%'

--20
SELECT ROUND(w.salary / 12, 2)
FROM workers AS w

--22
SELECT w.salary
FROM workers AS w
ORDER BY w.salary DESC
LIMIT 3

--23
SELECT *
FROM workers AS w
WHERE w.id_worker = (SELECT MAX(w.id_worker) FROM workers AS w)

--24
SELECT w.id_worker, w.worker_name
FROM workers AS w
WHERE MOD(w.id_worker, 2) != 0

--21
SELECT *
FROM student AS s 
WHERE s.id_student NOT IN (SELECT i.id_student FROM ispit AS i WHERE i.id_ispit = 2)

