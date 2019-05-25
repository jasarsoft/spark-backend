/* 	
	Edin Jašarević
	SPARK Web programiranje (Backend)
	04.05.2019.
*/
/*1.	 Prikaži “name”, “lastname” i “mail” svih usera*/
SELECT 	u.name AS "Ime",
		u.lastname AS "Prezime",
        u.mail AS "e-Mail"
FROM users AS u

/*2.	Prikaži “name”, “lastname” i “town_name” svih usera poredanih abecedno */
SELECT 	u.name AS "Ime",
		u.lastname AS "Prezime",
        z.town_name AS "Ime grada"
FROM users AS u LEFT JOIN zip_code AS z 
	ON u.zip_code = z.zip_code
ORDER BY u.name, u.lastname

/*3.	Prikaži “name”, “lastname”, “town_name” svih usera kojima ime ili prezime počinje slovom “M” */
SELECT 	u.name AS "Ime",
		u.lastname AS "Prezime",
        z.town_name AS "Ime grada"
FROM users AS u LEFT JOIN zip_code AS z 
	ON u.zip_code = z.zip_code
WHERE u.name LIKE 'M%' AND u.lastname LIKE 'M%'

/*4.	Prikaži sve informacije o filmovima koji su duži od 115 minuta. */
SELECT 	m.name AS "Naziv filma",
		m.duration AS "Trajanje (min)"
FROM movie AS m
WHERE m.duration > 115;

/*5.	Prikaži “name”, “duration” i “date” svih filmova čija je projekcija bila prije 2017-05-09 */
SELECT 	m.name AS "Naziv filma",
		m.duration AS "Trajanje (min)",
        p.date AS "Datum prikazivanja"
FROM 	projection AS p LEFT JOIN movie AS m
			ON p.id_movie = m.id_movie
    	LEFT JOIN cinema AS c
        	ON p.id_cinema = c.id_cinema
WHERE p.date < '2017-05-09'

/*6.	Prikaži sva prezimena koja završavaju na “ic” bez ponavljanja istih. */
SELECT DISTINCT(u.lastname) AS "Prezime"
FROM users AS u
WHERE u.lastname LIKE '%ic'

/*7.	Prikaži “name”, “lastname” svih usera koji su bili na više od 3 projekcije */
SELECT u.name AS "Ime",
	   u.lastname AS "Prezime",
       m.name AS "Naziv filma",
       p.date AS "Datum projekcije",
       COUNT(up.id_user) AS "Broj prokjekcija"
FROM users AS u JOIN user_projection AS up
		ON u.id_user = up.id_user
     JOIN projection AS p
     	ON up.id_projection = p.id_projection
     JOIN movie AS m
     	ON p.id_movie = m.id_movie
GROUP BY up.id_user
HAVING COUNT(up.id_user) > 3

/*8.	Prikaži ime filma, ime kina, date i zip code svih projekcija koje su prikazivale film 'Guardians of the Galaxy Vol. 2'  */
SELECT m.name AS "Ime filma",
	c.cinema_name AS "Ime kina",
    p.date AS "Datum",
    c.zip_code AS "Zip code"
FROM projection AS p LEFT JOIN cinema AS c
		ON p.id_cinema = c.id_cinema
    LEFT JOIN movie AS m
    	ON p.id_movie = m.id_movie
WHERE m.name LIKE 'Guardians of the Galaxy Vol. 2'

/*9.	Prikaži “name”, “lastname”, “mail”, “cinema_name” i “birthday” za sve usere koji su bili u na projekciji koja se održala ‘2017-05-11’ i useri koji su stariji od '1993-05-08'  */
SELECT u.name AS "Ime",
	u.lastname AS "Prezime",
    u.mail AS "e-Mail",
    c.cinema_name AS "Naziv kina",
    u.birthday AS "Datum rodjenja"
FROM users AS u LEFT JOIN user_projection AS up
		ON u.id_user = up.id_user
 	LEFT JOIN projection AS p
    	ON up.id_projection = p.id_projection
    LEFT JOIN cinema AS c
    	ON p.id_cinema = c.id_cinema
WHERE p.date = '2017-05-11' AND u.birthday > '1993-05-08'

/* 10.	Prikaži ime i ukupan broj projekcija svakog filma. Neka na vrhu bude film s najmanjim broj projekcija. (Uzeti u obzir samo prikazane filmove) */
SELECT m.name AS "Naziv filma",
	COUNT(p.id_projection) AS "Broj projekcija"
FROM projection AS p LEFT JOIN movie AS m
		ON p.id_movie = m.id_movie
GROUP BY p.id_movie
ORDER BY COUNT(p.id_projection)

/* 11.	 Prikaži “name”, “lastname”, “mail”, “birthday”, “town_name” i ukupan broj projekcija na kojima je bio svaki korisnik više od 3 puta */
SELECT u.name AS "Ime",
	u.lastname AS "Prezime",
    u.mail AS "e-Mail",
    u.birthday AS "Datum rodjenja",
    z.town_name AS "Grad",
    COUNT(up.id_user_projection) AS "Broj projekcija"
FROM user_projection AS up LEFT JOIN users AS u
		ON up.id_user = u.id_user
	LEFT JOIN zip_code AS z 
    	ON u.zip_code = z.zip_code
GROUP BY up.id_user
HAVING COUNT(up.id_user_projection) > 3

/* 12.	 Prikaži ime grada, ime kina, minimalan, maksimalan i prosječan broj sjedala po kinu */
SELECT z.town_name AS "Ime grada",
	c.cinema_name AS "Ime kina",
    MIN(ch.seats_number) AS "Minimalna broj sjedista",
    MAX(ch.seats_number) AS "Maksimalan broj sjedista",
    ROUND(AVG(ch.seats_number)) AS "Prosjecan broj sjedista"
FROM cinema_hall AS ch 
	LEFT JOIN cinema AS c
		ON ch.id_cinema = c.id_cinema
    LEFT JOIN zip_code AS z
    	ON c.zip_code = z.zip_code
GROUP BY ch.id_cinema

/* 13.	 Prikaži ime i trajanje filma koji se nikad nije prikazao */
SELECT m.name AS "Naziv filma",
	m.duration AS "Trajanje filma",
    COUNT(p.id_movie) AS "Broj prikaza"
FROM movie AS m 
	LEFT JOIN projection AS p
    	ON m.id_movie = p.id_movie
GROUP BY p.id_movie
HAVING COUNT(p.id_movie) = 0

/* 14.	 Prikaži ime kina i ukupan broj sjedala po kinu */
SELECT c.cinema_name AS "Ime kina",
	SUM(ch.seats_number) AS "Broj sjedista"
FROM cinema AS c
	LEFT JOIN cinema_hall AS ch
    	ON c.id_cinema = ch.id_cinema
GROUP BY ch.id_cinema

/* 15.	 Prikaži ime grada, ime kina, datum, broj sjedala, ime filma i trajanje filma koji se prikazao u dvorani koja ima preko 115 sjedala i koji se prikazao poslije '2017-05-03' */
SELECT z.town_name AS "Ime grada",
	c.cinema_name AS "Ime kina",
    p.date AS "Datum",
    ch.seats_number AS "Broj sjedista",
    m.name AS "Naziv filma",
    m.duration AS "Trajanje (min)"
FROM projection AS p
	LEFT JOIN cinema AS c
    	ON p.id_cinema = c.id_cinema
	LEFT JOIN zip_code AS z
    	ON c.zip_code = z.zip_code
    LEFT JOIN cinema_hall AS ch
    	ON p.id_hall = ch.id_hall
    LEFT JOIN movie AS m
    	ON p.id_movie = m.id_movie
WHERE ch.seats_number > 115 AND p.date > '2017-05-03'
		
		