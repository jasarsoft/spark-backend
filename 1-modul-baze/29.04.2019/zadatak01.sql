--zdatak 1
SELECT worker_name AS "Ime",
		worker_lastname AS "Prezime"
FROM workers
WHERE worker_name LIKE "%a" AND salary > 600

--Zadatak 3
SELECT COUNT(w.id_worker) AS "Broj djelatnika",
	d.department_name AS "Naziv"
FROM workers AS w JOIN departments AS d
	ON w.id_department = d.id_department
GROUP BY d.id_department
ORDER BY 1 DESC

--zadatak 4
SELECT COUNT(w.id_worker) AS "Broj djelatnika",
 	IFNULL(d.department_name, "N/A") AS "Naziv"
FROM workers AS w 
LEFT JOIN departments AS d
	ON w.id_department = d.id_department
GROUP BY d.id_department
ORDER BY 1 DESC

--zadatak 5
SELECT COUNT(w.id_worker) AS "Broj djelatnika",
 	IFNULL(d.department_name, "N/A") AS "Naziv"
FROM workers AS w 
LEFT JOIN departments AS d
	ON w.id_department = d.id_department
GROUP BY d.id_department
HAVING COUNT(w.id_worker) > 2
ORDER BY 1 DESC

--zadatak 6
SELECT COUNT(w.id_worker) AS "Broj djelatnika",
 	IFNULL(d.department_name, "N/A") AS "Naziv",
    MIN(salary) AS "Minimalna plata",
    MAX(salary) AS "Maksimalna plata"
FROM workers AS w 
LEFT JOIN departments AS d
	ON w.id_department = d.id_department
GROUP BY d.id_department
ORDER BY 1 DESC

SELECT CONCAT(w.worker_name, ' ', w.worker_lastname) AS "Ime prezime"
FROM workers AS w 
LEFT JOIN departments AS d
	ON w.id_department = d.id_department
WHERE d.department_name IN("Prodaja", "Support")

SELECT CONCAT(w.worker_name, ' ', w.worker_lastname) AS "Ime prezime",
	YEAR(w.worker_since_datetime) AS "Godina"
FROM workers AS w 
LEFT JOIN departments AS d
	ON w.id_department = d.id_department
WHERE YEAR(w.worker_since_datetime) = 2014


--zadatak 10
SELECT d.department_name
FROM workers AS w RIGHT JOIN departments AS d
	ON w.id_department = d.id_department
WHERE w.id_worker IS NULL
GROUP BY d.department_name


SELECT 	d.department_name AS "Naziv odjeljenja",
		AVG(w.salary) AS "Prosjecna plata"
FROM workers AS w LEFT JOIN departments AS d
	ON w.id_department = d.id_department
GROUP BY d.id_department
HAVING AVG(w.salary) > 660


SELECT COUNT(DISTINCT(w.worker_name)) AS "Broj radnika"			
FROM workers AS w LEFT JOIN departments AS d
	ON w.id_department = d.id_department
ORDER BY w.worker_name


SELECT 	d.department_name AS "Odjel",
        c.city_name AS "Grad",
        AVG(w.salary) AS "Prosjecna plata"
FROM workers AS w JOIN cities AS c
		ON w.id_city = c.id_city
    JOIN departments AS d
    	ON w.id_department = d.id_department
GROUP BY c.id_city, d.id_department


SELECT 	d.department_name AS "Odjel",
        c.city_name AS "Grad",
        AVG(w.salary) AS "Prosjecna plata"
FROM workers AS w JOIN cities AS c
		ON w.id_city = c.id_city
    JOIN departments AS d
ON w.id_department = d.id_department
WHERE c.city_name LIKE "Mostar"
GROUP BY c.id_city, d.id_department



