CREATE DATABASE liga1;
USE liga1;

CREATE TABLE echipa (
	id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    denumire VARCHAR(30) NOT NULL,
    an_infiintare YEAR,
    stadion VARCHAR(50) );
    
CREATE TABLE antrenor (
	id TINYINT NOT NULL,
    nume VARCHAR(20) NOT NULL,
    prenume VARCHAR(20) NOT NULL,
    data_nastere DATE NOT NULL,
    salariu INT(5),
    id_echipa TINYINT,
    FOREIGN KEY (id_echipa) REFERENCES echipa(id) );
    
CREATE TABLE jucator (
	id SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nume VARCHAR(20) NOT NULL,
    prenume VARCHAR(20) NOT NULL,
    data_nastere DATE NOT NULL,
    salariu INT(5),
    id_echipa TINYINT,
    FOREIGN KEY (id_echipa) REFERENCES echipa(id) );
    
CREATE TABLE post (
	id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    denumire VARCHAR(50) NOT NULL,
    abreviere VARCHAR(6),
    categorie VARCHAR(20) NOT NULL );
    
CREATE TABLE pozitie_jucator (
	id_jucator SMALLINT NOT NULL,
    id_post TINYINT NOT NULL,
    randament TINYINT NOT NULL,
    FOREIGN KEY (id_jucator) REFERENCES jucator(id),
    FOREIGN KEY (id_post) REFERENCES post(id),
    PRIMARY KEY (id_jucator ASC, id_post ASC) );
    
CREATE TABLE meci (
	id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_echipa1 TINYINT NOT NULL,
    id_echipa2 TINYINT NOT NULL,
    data DATE NOT NULL,
    stadion VARCHAR(50),
    scor VARCHAR(5) NULL,
    FOREIGN KEY (id_echipa1) REFERENCES echipa(id),
    FOREIGN KEY (id_echipa2) REFERENCES echipa(id) );
    
# 2. MODIFICAREA TABELELOR
# 1. adaugam constrangere de unique pe combinatia de id-uri de echipe din meci pentru a nu avea aceeasi echipa

ALTER TABLE meci
ADD CONSTRAINT idcheck CHECK (id_echipa1 != id_echipa2);
    

#2. adauga id din antrenor ca fiind cheie primara

ALTER TABLE antrenor ADD PRIMARY KEY (id); 

# 3. Adauga in tabela antrenor campul/atributul tip_antrenor

ALTER TABLE antrenor ADD tip_antrenor VARCHAR (30) NOT NULL AFTER salariu;   

# 4. Adauga coloanele inaltime si greutate in tabela jucator

ALTER TABLE jucator ADD inaltime SMALLINT NULL AFTER data_nastere;
ALTER TABLE jucator ADD greutate TINYINT NULL AFTER inaltime;

# 5. Schimba proprietatile atributului tip_antrenor

ALTER TABLE antrenor CHANGE tip_antrenor tip_antrenor VARCHAR(25) NOT NULL;

DESCRIBE antrenor;
DESCRIBE jucator;

# Aici am adaugat auto_increment cheii primare pt ca nu m-a lasat sa il pun la inceput, fara sa fie cheie primara
ALTER TABLE antrenor CHANGE id id TINYINT NOT NULL AUTO_INCREMENT;


# 3. ACTUALIZAREA DATELOR

INSERT INTO echipa VALUES
(null, 'CFR Cluj', 1907, 'Stadionul Constantin Radulescu'),
(null, 'FCSB', 1947, 'Arena Nationala'),
(null, 'Farul Constanta', 1920, 'Stadionul Gheorghe Hagi'),
(null, 'Sepsi OSK', 2011, 'Stadionul Varosi');
    
SELECT * FROM echipa; 

  

INSERT INTO antrenor VALUES
(null, 'Sumudica', 'Marius',19600223, 10000, 'Antrenor Principal' , 1),
(null, 'Todoran', 'Dinu', 19830130, 4000, 'Antrenor Principal', 2),
(null, 'Hagi', 'Gheorghe',19650523, 5000, 'Antrenor Principal', 3),
(null, 'Sepsi', 'Laszlo',19800713, 3000, 'Antrenor Principal',4),
(null, 'Constantinescu', 'Marius',19570522, 2000, 'Antrenor Secund', 1),
(null, 'Mihalache', 'Costin',19760325, 2500, 'Antrenor Secund', 2),
(null, 'Suciu', 'Mircea',19770820, 1500, 'Antrenor Secund', 3),
(null, 'Protopopescu', 'Marius',19710122, 1400, 'Antrenor Secund', 4),
(null, 'Stanciu', 'Aurel',19680304, 1200, 'Antrenor Portari', 2),
(null, 'Hogea' , 'Calistrat',19791127, 1150, 'Antrenor Portari', 4);

SELECT * FROM antrenor;


INSERT INTO jucator VALUES
(null, 'Ionescu', 'Mircea',19900223, 182 , 85, 20000, 1),
(null, 'Zahiu', 'Gabriel', 19950312, 171, 75, 30000, 1),
(null, 'Popescu', 'Pavel', 20030503, 165, 70, 21000, 1),
(null, 'Mihailescu', 'Gabriel', 20040427, 185, 77, 15000, 1),
(null, 'Zimniceanu', 'Marius', 19980513, 172, 63, 17000,1),
(null, 'Aleonte', 'Andrei', 19930227, 175, 75, 30000, 1),
(null, 'Sava', 'Cornel', 20000929, 190, 85, 18000, 1),
(null, 'Gadea', 'Vasile', 19940222, 173, 73, 20000, 2),
(null, 'Giurgiuveanu', 'Andrei', 19950222, 180, 80, 9000, 2),
(null, 'Frasinescu', 'Matei', 19960223, 175, 70, 25000, 2),
(null, 'Vara', 'Aurel', 19970321, 168, 68, 35000, 2),
(null, 'Pruteanu', 'Cosmin', 19980607, 170, 70, 27000, 2),
(null, 'Burlacu', 'Constantin',19990402, 167, 70, 13000, 2),
(null, 'Todoran', 'Alexandru', 20000212, 192, 80, 20000, 2),
(null, 'Bana', 'Adrian', 19990331, 182, 75, 23000, 3),
(null, 'Rosiu', 'Mihai', 19960708, 172, 73, 18000, 3),
(null, 'Patache', 'Aurel', 20010102, 165, 65, 9000, 3),
(null, 'Hanachiuc', 'Marius', 20000705, 183, 83, 30000, 3),
(null, 'Hanachiuc', 'Florin', 19950403, 180, 90, 30000, 3),
(null, 'Burlacu', 'Eugen', 20020129, 176, 67, 22000, 3),
(null, 'Vasilescu', 'Ciprian', 19971230, 195, 85, 15000, 3),
(null, 'Bonea', 'Adrian', 19980205, 173, 73, 19000, 4),
(null, 'Avramescu', 'Bogdan', 19980524, 175, 70, 25000, 4),
(null, 'Chelcea', 'Eduard', 19940914, 180, 74, 18000, 4),
(null, 'Fintescu', 'Marian', 20000623, 190, 80, 15000, 4),
(null, 'Lascu', 'George', 20001130, 170, 65, 22000, 4),
(null, 'Pantea', 'Cosmin', 20011214, 174, 74, 29000, 4),
(null, 'Gintea', 'Robert', 19990823, 180, 75, 8000, 4),
(null, 'Havertz', 'Kai', 19980104, 178, 78, 40000, 1),
(null, 'Vinju', 'George', 20000506, 176, 73, 13000, 1),
(null, 'Loca', 'Mihai', 20010715, 170, 63, 27000, 1),
(null, 'Pruteanu', 'Marcel', 19950212, 168, 60, 20000, 1),
(null, 'Ionescu', 'Mihai', 19950723, 179, 79, 25000, 2),
(null, 'Ionescu', 'Eduard', 19921130, 175, 80, 30000, 2),
(null, 'Popescu', 'Constantin', 19911203, 173, 73, 25000, 2),
(null, 'Popescu', 'Gheorghe', 19960201, 178, 73, 28000, 2),
(null, 'Belodedici', 'Miodrag', 19900527, 186, 78, 25000, 3),
(null, 'Petrescu', 'Marius', 19990726, 187, 80, 20000, 3),
(null, 'Mihaescu', 'Marian', 20000321, 178, 75, 10000, 3),
(null, 'Contea', 'George', 19990225, 180, 80, 15000, 3),
(null, 'Constantin', 'Petru', 20010606, 185, 78, 23000, 4),
(null, 'Selaru', 'Eugen', 20020202, 175, 75, 19000, 4),
(null, 'Cristescu', 'Pavel', 20000214, 178, 78, 18000, 4),
(null, 'Constantinescu', 'Mihai', 19980223, 182, 78, 24000, 4);

SELECT * FROM jucator;


INSERT INTO post VALUES
(null, 'Portar', 'P', 'Portar'),
(null, 'Aparator Central', 'AC', 'Aparator'),
(null, 'Aparator Lateral Stanga', 'ALS', 'Aparator'),
(null, 'Aparator Lateral Dreapta', 'ALD', 'Aparator'),
(null, 'Mijlocas Defensiv', 'MD', 'Mijlocas'),
(null, 'Mijlocas Central', 'MC', 'Mijlocas'),
(null, 'Mijlocas Ofensiv', 'MO', 'Mijlocas'),
(null, 'Mijlocas Lateral Stanga', 'MLS', 'Mijlocas'),
(null, 'Mijlocas Lateral Dreapta', 'MLD', 'Mijlocas'),
(null, 'Atacant Central', 'AC', 'Atacant'),
(null, 'Atacant Lateral', 'AL', 'Atacant');

SELECT * FROM post; 
  
# In randament am integrat pana la urma si valoarea pe care o are, ca sa pot face chestia aia cu predictia
 INSERT INTO pozitie_jucator VALUES
 (1, 6, 98), (1, 7, 94),
 (7, 1, 95),
 (2, 2, 90), (2, 3, 85),
 (3, 2, 88),
 (4, 2, 80), (4, 4, 88),
 (5, 6, 85), (5, 5, 83),
 (6, 6, 87),
 (14, 1, 90),
 (8, 2, 90),
 (9, 2, 85),
 (10, 3, 85),
 (11, 4, 90),
 (12, 5, 95),
 (13, 6, 88),
 (21, 1, 85),
 (15, 2, 90), (15, 4, 88),
 (16, 2, 86),
 (17, 5, 92), (17, 6, 90),
 (18, 3, 85),
 (19, 4, 86), (19, 2, 86),
 (20, 6, 92), (20, 5, 90),
 (25, 1, 88), 
 (22, 3, 88), (22, 2, 86),
 (23, 2, 90),
 (24, 2, 91),
 (26, 6, 88), (26, 7, 87),
 (27, 4, 86), (27, 9, 84),
 (28, 6, 87), (28, 5, 86),
 (29, 9, 90),
 (30, 3, 87),
 (31, 8, 86),
 (32, 10, 90), (32, 11, 88),
 (33, 6, 94),
 (34, 11, 90),
 (35, 10, 92),
 (36, 11, 98),
 (37, 6, 94),
 (38, 11, 92), (38, 10, 88),
 (39, 11, 88),
 (40, 10, 96),
 (41, 8, 88),
 (42, 9, 90),
 (43, 10, 92),
 (44, 10, 89);
 
 SELECT * FROM pozitie_jucator;
 
 
 INSERT INTO meci(id_echipa1, id_echipa2, data) VALUES
 (1, 2, 20210601),
 (3, 4, 20210602),
 (1, 3, 20210701),
 (2, 4, 20210702),
 (1, 4, 20210801),
 (2, 3, 20210802),
 (2, 1, 20210901),
 (4, 3, 20210902),
 (3, 1, 20211001),
 (4, 2, 20211002),
 (4, 1, 20211201),
 (3, 2, 20211201);
 
 SELECT * FROM meci;
 
 # UPDATE
 
 # 1. sa se seteze ca NULL salariile jucatorilor mai mici de 20 de ani(nascuti in 2002 sau mai tarziu), pentru renegociere
 
 SET sql_safe_updates = 0;
 UPDATE jucator SET salariu = NULL WHERE YEAR(data_nastere) > 2001;
 SELECT * FROM jucator;

# 2. sa i se mareasca cu 10% salariul antrenorului cu portarii Calistrat Hogea

UPDATE antrenor SET salariu = salariu * 1.10 WHERE nume = 'Hogea' AND prenume = 'Calistrat'; 
SELECT * FROM antrenor;

# 3. sa se corecteze anul de nastere al jucatorului Giurgiuveanu Andrei in anul 2000
UPDATE jucator SET data_nastere = 20000222 WHERE nume = 'Giurgiuveanu' AND prenume = 'Andrei';

# am vrut sa las stadionul necompletat si sa il introduc cu o procedura sau cursor, care sa il ia dupa id-ul echipei care joaca acasa, 
# si sa il completeze, dar am renuntat la idee, ca sa il am mai de la inceput, asa ca am facut update aici

UPDATE meci SET stadion = 'Stadionul Constantin Radulescu' WHERE id_echipa1 = 1;
UPDATE meci SET stadion = 'Arena Nationala' WHERE id_echipa1 = 2;
UPDATE meci SET stadion = 'Stadionul Gheorghe Hagi' WHERE id_echipa1 = 3;
UPDATE meci SET stadion = 'Stadionul Varosi' WHERE id_echipa1 = 4;


# DELETE

# 1. sa se stearga antrenorii secunzi cu salariul mai mic de 2000

DELETE FROM antrenor WHERE tip_antrenor = 'Antrenor Secund' AND salariu < 2000;

# 2. sa se stearga antrenorul cu portarii  cu cel mai mic salariu

DELETE FROM antrenor WHERE tip_antrenor = 'Antrenor Portari' AND salariu = (SELECT MIN(salariu) FROM antrenor WHERE tip_antrenor = 'Antrenor Portari');

# 3. Sa se stearga toti antrenorii care nu sunt antrenori principali
DELETE FROM antrenor WHERE tip_antrenor != 'Antrenor Principal';


# ACUM II PUN LA LOC:

INSERT INTO antrenor VALUES
(null, 'Constantinescu', 'Marius',19570522, 2000, 'Antrenor Secund', 1),
(null, 'Mihalache', 'Costin',19760325, 2500, 'Antrenor Secund', 2),
(null, 'Suciu', 'Mircea',19770820, 1500, 'Antrenor Secund', 3),
(null, 'Protopopescu', 'Marius',19710122, 1400, 'Antrenor Secund', 4),
(null, 'Stanciu', 'Aurel',19680304, 1200, 'Antrenor Portari', 2),
(null, 'Hogea' , 'Calistrat',19791127, 1150, 'Antrenor Portari', 4);


# 4. INTEROGARI VARIATE CU SELECT

# SUBINTEROGARI

# 1. sa se afle la ce echipa este antrenor Mircea Suciu

SELECT denumire 
FROM echipa 
WHERE id = (SELECT id_echipa FROM antrenor WHERE nume = 'Suciu' and prenume = 'Mircea');

# 2. prenumele si numele mijlocasilor de la toate echipele
SELECT prenume, nume
FROM jucator
WHERE id IN (SELECT id_jucator FROM pozitie_jucator WHERE id_post IN (SELECT id from post WHERE categorie = 'Mijlocas' ) );

# 3. la ce echipa joaca cel mai inalt jucator
SELECT denumire
FROM echipa
WHERE id = (SELECT id_echipa FROM jucator WHERE inaltime = (SELECT MAX(inaltime) from jucator));

# JOIN INNER/OUTER

# 1. Sa se afiseze programul campionatului (numele echipelor, data desfasurarii, stadionul pe care se joaca)
SELECT e1.denumire AS echipa1, e2.denumire AS echipa2, data AS data_desfasurarii, m.stadion
 FROM meci AS m
 JOIN echipa e1 ON e1.id = m.id_echipa1
 JOIN echipa e2 ON e2.id = m.id_echipa2
 ORDER BY data;

# 2. Sa se afiseze echipa ce are jucatorul cu cel mai mare salariu si numele jucatorului si salariul

SELECT denumire, nume, prenume, salariu
FROM echipa JOIN jucator
ON echipa.id = jucator.id_echipa
WHERE salariu = (SELECT MAX(salariu) FROM jucator);



# 3. echipele ce au jucatori care nu au salariul stabilit

SELECT denumire, prenume, nume, salariu 
FROM jucator LEFT JOIN echipa
ON jucator.id_echipa = echipa.id
WHERE salariu IS NULL;

# GROUP BY/HAVING

# 1. numele echipei si inaltimea celui mai inalt jucator al echipei

SELECT  denumire, MAX(inaltime) 
FROM echipa JOIN jucator
ON echipa.id = jucator.id_echipa
GROUP BY denumire; 

SELECT * FROM jucator;

#2. salariul mediu al fiecarei echipe

SELECT denumire, AVG(salariu)
FROM echipa JOIN jucator 
ON echipa.id = jucator.id_echipa
GROUP BY denumire;

#3. echipele care au salariul mediu > 22000

SELECT denumire, AVG(salariu)
FROM echipa JOIN jucator 
ON echipa.id = jucator.id_echipa
GROUP BY denumire
HAVING AVG(salariu) > 22000;

# VIEW-URI

# 1. Sa se creeze un view cu programul campionatului

CREATE VIEW program_campionat AS
SELECT e1.denumire AS echipa1, e2.denumire AS echipa2, data AS data_desfasurarii, m.stadion
 FROM meci AS m
 JOIN echipa e1 ON e1.id = m.id_echipa1
 JOIN echipa e2 ON e2.id = m.id_echipa2
 ORDER BY data;
 
 SELECT * FROM program_campionat;

# 2. Sa se creeze un view cu numele jucatorilor si randamentul acestora pe pozitia cea mai buna

CREATE VIEW randament_jucatori AS
SELECT CONCAT(nume, ' ', prenume) AS nume_jucator, MAX(randament), id_echipa
FROM jucator JOIN pozitie_jucator
ON jucator.id = pozitie_jucator.id_jucator
GROUP BY nume_jucator
ORDER BY id_echipa;

SELECT * FROM randament_jucatori;

# FUNCTII

# 1. sa se creeze o functie care primeste numele jucatorului si returneaza pozitiile pe care poate juca 

DELIMITER //
CREATE FUNCTION afiseazaPozitii (nume VARCHAR(20), prenume VARCHAR(20)) RETURNS VARCHAR(100)
BEGIN
	DECLARE pozitiiJucator VARCHAR(100);
    SELECT GROUP_CONCAT(post.denumire) INTO pozitiiJucator
    FROM post JOIN pozitie_jucator 
    ON post.id = pozitie_jucator.id_post
    JOIN jucator
    ON pozitie_jucator.id_jucator = jucator.id
    WHERE jucator.nume = nume AND jucator.prenume = prenume
    GROUP BY jucator.id;
    RETURN pozitiiJucator;
END;
//
DELIMITER ;

SELECT afiseazaPozitii('Ionescu', 'Mircea');
SELECT afiseazaPozitii('Burlacu', 'Constantin');
SELECT afiseazaPozitii('Bana', 'Adrian');

# 2. Functie care returneaza daca un jucator poate juca pe pozitia de Portar

DELIMITER //
CREATE FUNCTION ppp (id SMALLINT(6)) RETURNS VARCHAR(30)
BEGIN
	IF 'Portar' IN (SELECT post.denumire 
		FROM post JOIN pozitie_jucator
        ON post.id = pozitie_jucator.id_post
        WHERE id_jucator = id) 
        THEN RETURN 'Jucatorul poate juca portar';
	ELSE
		RETURN 'Jucatorul nu poate juca portar';
	END IF;
END;
//
DELIMITER ;

SELECT ppp(1);
SELECT ppp(7);

# 3. Functie care returneaza numarul total de jucatori

DELIMITER //
CREATE FUNCTION nrJucatori() RETURNS SMALLINT(6) 
BEGIN
	DECLARE nr SMALLINT(6);
    SELECT COUNT(*) INTO nr FROM jucator;
	RETURN nr;
END;
//
DELIMITER ;

SELECT nrJucatori();

# PROCEDURI
# 1. 
DELIMITER //
CREATE PROCEDURE predictieRezultat (IN idechipa1 TINYINT, IN idechipa2 TINYINT, OUT rezultat VARCHAR(50) )
BEGIN
	DECLARE evaluare_echipa1 DECIMAL(5, 2);
    DECLARE evaluare_echipa2 DECIMAL(5, 2);
    DECLARE bonus_meci_acasa FLOAT DEFAULT 1.05;
    SET evaluare_echipa1 = ((SELECT AVG(randament) FROM pozitie_jucator WHERE id_jucator IN (SELECT jucator.id FROM jucator WHERE id_echipa = idechipa1)) * bonus_meci_acasa);
    SET evaluare_echipa2 = (SELECT AVG(randament) FROM pozitie_jucator WHERE id_jucator IN (SELECT jucator.id FROM jucator WHERE id_echipa = idechipa2));
    IF evaluare_echipa1 - evaluare_echipa2 > 3.00
		THEN SET rezultat = CONCAT(evaluare_echipa1, ' - ', evaluare_echipa2, ' Meci castigat de Echipa ', idechipa1);
	ELSEIF evaluare_echipa2 - evaluare_echipa1 > 3.00
		THEN SET rezultat = CONCAT(evaluare_echipa1, ' - ', evaluare_echipa2, ' Meci castigat de Echipa ', idechipa2);
    ELSE SET rezultat = CONCAT(evaluare_echipa1, ' - ', evaluare_echipa2, ' Meciul se termina egal');
    END IF;
END;  
//
DELIMITER ;  

CALL predictieRezultat(4, 2, @rezultat);
SELECT @rezultat;

# 2. procedura ce primeste numele unui jucator si ii calculeaza varsta

DELIMITER //
CREATE PROCEDURE varstaJucator (IN nume VARCHAR(20), IN prenume VARCHAR(20), OUT varsta DECIMAL(3, 0))
BEGIN
	SET varsta = (SELECT FLOOR(DATEDIFF(CURDATE(), data_nastere) / 365.25) FROM jucator WHERE jucator.nume = nume AND jucator.prenume = prenume);
END;
//
DELIMITER ;

CALL varstaJucator ('Lascu', 'George', @varsta);
SELECT @varsta;

# 3. procedura care afiseaza cati jucatori sunt nascuti intr-un an trimis ca parametru

DELIMITER //
CREATE PROCEDURE jucatorAn (IN an YEAR, OUT nr_jucatori SMALLINT)
BEGIN
	SET nr_jucatori = (SELECT COUNT(*) FROM jucator WHERE YEAR(data_nastere) = an);
END;
//
DELIMITER ;

CALL jucatorAn (2000, @nr_jucatori);
SELECT @nr_jucatori;

# CURSORI

# 1. Cursor care completeaza scorul in tabela meci , doar daca meciul s-a disputat

DELIMITER //
CREATE PROCEDURE completeazaScorul()
BEGIN
	DECLARE id_meci TINYINT;
    DECLARE data_desf DATE;
    DECLARE exista_inregistrari TINYINT DEFAULT 1;
    DECLARE c1 CURSOR FOR
    SELECT meci.id, meci.data
    FROM meci;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET exista_inregistrari = 0;
    OPEN c1;
    scorl : LOOP
		FETCH c1 into id_meci, data_desf;
		IF exista_inregistrari = 0 THEN 
			LEAVE scorl;
			ELSE 
            IF data_desf < CURDATE() THEN
				CASE
				WHEN id_meci = 1 THEN UPDATE meci SET scor = ('2-1') WHERE meci.id = id_meci;
				WHEN id_meci = 2 THEN UPDATE meci SET scor = ('1-1') WHERE meci.id = id_meci;
				WHEN id_meci = 3 THEN UPDATE meci SET scor = ('2-0') WHERE meci.id = id_meci;
				WHEN id_meci = 4 THEN UPDATE meci SET scor = ('3-0') WHERE meci.id = id_meci;
				WHEN id_meci = 5 THEN UPDATE meci SET scor = ('3-2') WHERE meci.id = id_meci;
				WHEN id_meci = 6 THEN UPDATE meci SET scor = ('1-1') WHERE meci.id = id_meci;
				WHEN id_meci = 7 THEN UPDATE meci SET scor = ('2-0') WHERE meci.id = id_meci;
				WHEN id_meci = 8 THEN UPDATE meci SET scor = ('0-0') WHERE meci.id = id_meci;
				WHEN id_meci = 9 THEN UPDATE meci SET scor = ('2-2') WHERE meci.id = id_meci;
				WHEN id_meci = 10 THEN UPDATE meci SET scor = ('1-1') WHERE meci.id = id_meci;
				WHEN id_meci = 11 THEN UPDATE meci SET scor = ('2-2') WHERE meci.id = id_meci;
				WHEN id_meci = 12 THEN UPDATE meci SET scor = ('2-4') WHERE meci.id = id_meci;
				END CASE;
			END IF;
		END IF;
	END LOOP scorl;
    CLOSE c1;
END;
//
DELIMITER ;


SET sql_safe_updates = 0;
CALL completeazaScorul();
SELECT * FROM meci;

# 2. Sa se creeze o procedura cu cursor care pentru fiecare meci adauga si predictia meciului in tabela meci

ALTER TABLE meci ADD predictie VARCHAR(50);

DELIMITER //
CREATE PROCEDURE adaugaPredictie()
BEGIN
	DECLARE idechipa1 TINYINT;
    DECLARE idechipa2 TINYINT;
    DECLARE id_meci TINYINT;
    DECLARE exista_inregistrari TINYINT DEFAULT 1;
    DECLARE c2 CURSOR FOR
    SELECT id, id_echipa1, id_echipa2
    FROM meci;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET exista_inregistrari = 0;
    OPEN c2;
    predm : LOOP
		FETCH c2 INTO id_meci, idechipa1, idechipa2;
		IF exista_inregistrari = 0 THEN 
			LEAVE predm;
		ELSE 
        CALL predictieRezultat (idechipa1, idechipa2, @result);
        UPDATE meci SET predictie =  @result WHERE meci.id = id_meci; 
        END IF;
	END LOOP predm;
    CLOSE c2;
END;
//
DELIMITER ;

CALL adaugaPredictie();
SELECT * FROM meci;


# TRIGGERI

# 1. Inainte de insert in tabela antrenor, scriem numele antrenorului cu litere mari

DELIMITER //
CREATE TRIGGER bi_antrenor BEFORE INSERT
ON antrenor FOR EACH ROW
BEGIN 
	SET NEW.nume = UPPER(NEW.nume);
    SET NEW.prenume = UPPER(NEW.prenume);
END;
//
DELIMITER ;

INSERT INTO antrenor VALUES
(null, 'Popescu' , 'Mircea', 19891127, 1400, 'Antrenor Portari', 1);

SELECT * FROM antrenor;

# 2. Sa ne dea eroare daca inseram un antrenor cu salariul < 1000 Euro

DROP TRIGGER bi_antrenor;

DELIMITER //
CREATE TRIGGER bi_antrenor BEFORE INSERT
ON antrenor FOR EACH ROW
BEGIN
	IF NEW.salariu < 1000 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salariul minim este de 1000 Euro';
    END IF;
END;
//
DELIMITER ;

INSERT INTO antrenor VALUES
(null, 'Mihai' , 'Mircea', 19791125, 850, 'Antrenor Portari', 3);   

# 3. Sa ne dea eroare daca vrem sa marim salariul unui antrenor peste 50000

DELIMITER //
CREATE TRIGGER bu_antrenor BEFORE UPDATE
ON antrenor FOR EACH ROW
BEGIN
	IF NEW.salariu > 50000 THEN  
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salariul nu poate depasi 50000 Euro pe luna';
    END IF;
END;
//
DELIMITER ;

UPDATE antrenor SET salariu = 51000 WHERE id = 1;

















 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 DROP DATABASE liga1;
    
    