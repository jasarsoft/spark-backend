/* 1.	Prikaži “ime” i “prezime” svih studenata.  */
SELECT s.ime AS "Ime",
	s.prezime AS "Prezime"
FROM student AS s

/*2.	Prikaži “ime”, “prezime” i “naziv_grada” svih studenata.*/
SELECT s.ime AS "Ime",
	s.prezime AS "Prezime",
    g.naziv_grada AS "Naziv grada"
FROM student AS s LEFT JOIN grad AS g
	ON s.id_grad = g.id_grad
	
/*3.	Prikaži “ime”, “prezime”, “naziv_grada” svih studenata koji dolaze iz grada čiji “naziv_grada” počinje slovom “S”.*/
SELECT s.ime AS "Ime",
	s.prezime AS "Prezime",
    g.naziv_grada AS "Naziv grada"
FROM student AS s 
	LEFT JOIN grad AS g
   	ON s.id_grad = g.id_grad
WHERE g.naziv_grada LIKE 'S%'

/*4. Prikaži sve informacije o ispitima koji imaju ocjenu vecu od 3.*/
SELECT s.ime AS "Ime",
	s.prezime AS "Prezime",
    p.naziv_predmeta AS "Predmet",
    i.datum_ispita AS "Datum ispita",
    i.ocjena AS "Ocjena"
FROM ispit AS i 
	LEFT JOIN student AS s 
    ON i.id_student = s.id_student
    LEFT JOIN predmet AS p
    ON i.id_predmet = p.id_predmet
WHERE i.ocjena > 3

/*5.Prikaži sve informacije o ispitima koji imaju ocjenu vecu od 2 i čiji naziv predmeta sadrži “emi”.*/
SELECT s.ime AS "Ime",
	s.prezime AS "Prezime",
    p.naziv_predmeta AS "Naziv predemata",
    i.datum_ispita AS "Datum ispita",
    i.ocjena AS "Ocjena"
FROM ispit AS i
	LEFT JOIN student AS s
    ON i.id_student = s.id_student
    LEFT JOIN predmet AS p
    ON i.id_predmet = p.id_predmet
WHERE i.ocjena > 2 AND p.naziv_predmeta LIKE '%emi%'

/* 6.	Prikaži “id_student”, “ime”, “prezime” studenata koji su na barem jednom ispitu imali ocjenu 4 ili 5. (isti student se ne smije prikazivati u vise redova) */
SELECT s.ime AS "Ime",
	s.prezime AS "Prezime",
    s.id_student,
    i.ocjena AS "Ocjena"
FROM student AS s
	LEFT JOIN ispit AS i
    ON s.id_student = i.id_student
WHERE i.ocjena IN (4, 5)
GROUP BY i.id_student

/* 7.	Prikazi sve informacije o ispitima koji su rađeni na datum “2015-12-15”. */
SELECT s.ime AS "Ime",
	s.prezime AS "Prezime",
    p.naziv_predmeta AS "Predmet",
    i.datum_ispita AS "Datum ispita",
    i.ocjena AS "Ocjena"
FROM ispit AS i 
	LEFT JOIN student AS s
    ON i.id_student = s.id_student
    LEFT JOIN predmet AS p
    ON i.id_predmet = p.id_predmet
WHERE DATE(i.datum_ispita) = '2015-12-15'

/*8.	Prikazi sva moguća imena studenta. Imena se ne smiju ponavljati.*/
SELECT s.ime AS "Ime",
	s.prezime AS "Prezime"
FROM student AS s
GROUP BY s.ime, s.prezime

SELECT DISTINCT s.ime AS "Ime",
	s.prezime AS "Prezime"
FROM student AS s

/*9.Prikazi “ime”, “prezime”, “naziv_grada”, “id_ispit”, “ocjena” i “naziv_predmeta” za sve studente koji su radili ispit.*/
SELECT  i.id_ispit,
	s.ime AS "Ime",
	s.prezime AS "Prezime",
    i.ocjena AS "Ocjena",
    p.naziv_predmeta AS "Predmet"
FROM ispit AS i
	LEFT JOIN student AS s
    ON i.id_student = s.id_student
    LEFT JOIN predmet AS p
    ON i.id_predmet = p.id_predmet
	
/*10. Prikaži informacije o studentu i broj ispita koliko su radili. Neka na vrhu bude student sa najmanjim broj urađenih ispita. (uzimati samo one studente koji su radili ispite).*/
SELECT 
	s.ime AS "Ime",
    s.prezime AS "Prezime",
    COUNT(i.id_student) AS "Broj ispita"
FROM student AS s
	LEFT JOIN ispit AS i
    ON s.id_student = i.id_student
GROUP BY i.id_student
HAVING COUNT(i.id_student) > 0
ORDER BY COUNT(i.id_student) ASC

SELECT 
	s.ime AS "Ime",
    s.prezime AS "Prezime",
    COUNT(i.id_student) AS "Broj ispita"
FROM student AS s
	INNER JOIN ispit AS i
    ON s.id_student = i.id_student
GROUP BY s.id_student
ORDER BY COUNT(s.id_student) ASC

/*11. Prikaži “naziv_predmeta”  za predmete koji imaju vise od 2 ispita. Gledati samo ispite koji imaju ocjenu veću od 2.*/
SELECT p.naziv_predmeta AS "Naziv predemeta",
	COUNT(i.id_ispit) AS "Broj ispita" 
FROM ispit AS i
 	LEFT JOIN predmet AS p
	ON i.id_predmet = p.id_predmet
WHERE i.ocjena > 2
GROUP BY i.id_predmet
HAVING COUNT(i.id_ispit) > 2

/*12. Prikaži “naziv_predmeta” i “prosječnu_ocjenu”, “max_ocjenu”, “min_ocjenu” za predmet.  */
SELECT p.naziv_predmeta AS "Naziv predmeta",
	IFNULL(ROUND(AVG(i.ocjena), 2), 'N/A') AS "Prosjecna ocjena",
    IFNULL(MAX(i.ocjena), 'N/A') AS "Max ocjena",
    IFNULL(MIN(i.ocjena), 'N/A') AS "Min ocjena"
FROM predmet AS p 
	LEFT JOIN ispit AS i
    ON p.id_predmet = i.id_predmet
GROUP BY i.id_predmet

/* 13.	Prikaži “naziv_predmeta” koji nema ni jedan ispit.  */
SELECT p.naziv_predmeta
FROM predmet AS p
	LEFT JOIN ispit AS i
    ON p.id_predmet = i.id_predmet
GROUP BY i.id_predmet
HAVING COUNT(i.id_ispit) = 0 /* greska */

SELECT * 
FROM `predmet` AS d
LEFT OUTER JOIN ispit AS w ON w.id_predmet = d.id_predmet 
WHERE id_ispit IS NULL

/* 14.	Prikazi naziv_grada i zbir svih ocjenu studenata toga grada. (prikazivati samo gradove koji imaju studente)  */
SELECT g.naziv_grada,
    SUM(i.ocjena) AS "Suma ocjena"
FROM ispit AS i
	RIGHT JOIN student AS s
    ON i.id_student = s.id_student
    RIGHT JOIN grad AS g
    ON s.id_grad = g.id_grad
GROUP BY g.id_grad