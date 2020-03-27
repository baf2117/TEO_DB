DELIMITER $$
CREATE PROCEDURE sp_consultaClases1 (ID INT(11), SEMESTRE INT(11), ANIO INT(11))
	BEGIN
		SELECT 
			B.id_clase AS IdClase,
			C.Nombre AS NombreClase, 
			B.seccion AS Seccion, 
			B.Edificio AS Edificio, 
			B.salon AS Salon, 
			B.horario AS horario, 
			D.Nombre as Catedratico,
			E.Nombre as auxiliar 
				FROM
				Alumno_Clase A INNER JOIN Clase B ON A.id_clase = B.id_clase 
				INNER JOIN Curso C ON C.id_curso = B.id_curso 
				LEFT JOIN users D ON D.id = B.id_catedratico
				LEFT JOIN users E ON E.id = B.id
		      WHERE A.id=ID AND B.semestre=SEMESTRE AND B.anio=ANIO;
	END $$

DELIMITER $$
CREATE PROCEDURE sp_consultaNoticias1 (ID INT(11), SEMESTRE INT(11), ANIO INT(11))
	BEGIN
		SELECT C.id_noticia as IdNoticia, D.Nombre as Clase,
		B.seccion as Seccion, C.Titulo as Titulo, C.Fecha, E.Nombre as Nombre
		   FROM Alumno_Clase A
		   INNER JOIN Clase B ON A.id_clase = B.id_clase
		   INNER JOIN Noticia C ON C.id_clase = B.id_clase
		   INNER JOIN Curso D ON D.id_curso = B.id_curso
		   INNER JOIN users E ON E.id = C.id
		   WHERE A.id=ID AND B.semestre=SEMESTRE AND B.anio=ANIO
		   ORDER BY C.Fecha Desc LIMIT 5;
	END $$
	
/*MODIFICAR*/
/*DELIMITER $$
CREATE PROCEDURE sp_consultaActividad1 (ID INT(11))
	BEGIN
		SELECT *, CASE
		        WHEN Mes = 1 THEN \"Ene\"
		        WHEN Mes = 2 THEN \"Feb\"
		        WHEN Mes = 3 THEN \"Mar\"
		        WHEN Mes = 4 THEN \"Abr\"
		        WHEN Mes = 5 THEN \"May\"
		        WHEN Mes = 6 THEN \"Jun\"
		        WHEN Mes = 7 THEN \"Jul\"
		        WHEN Mes = 8 THEN \"Ago\"
		        WHEN Mes = 9 THEN \"Sep\"
		        WHEN Mes = 10 THEN \"Oct\"
		        WHEN Mes = 11 THEN \"Nov\"
		        WHEN Mes = 12 THEN \"Dic\"
		    END as Mesfin
		FROM(SELECT D.Nombre as Clase, B.seccion as Seccion, C.Nombre as Actividad,
		C.Fecha as Fecha, DAY(C.Fecha) as Dia,
		MONTH(C.Fecha) as Mes FROM Alumno_Clase A
		INNER JOIN Clase B ON A.id_clase = B.id_clase
		INNER JOIN Curso D ON D.id_curso = B.id_curso
		INNER JOIN Actividad C ON B.id_clase = C.id_clase
		WHERE Fecha >= DATE_ADD(NOW(), INTERVAL -1 DAY) AND A.id=ID ORDER BY C.Fecha ASC) q;
	END $$*/
	
DELIMITER $$
CREATE PROCEDURE sp_ConsultaClases2 (ID INT(11), SEMESTRE INT(11), ANIO INT(11))
	BEGIN
		SELECT 
		A.id_clase AS IdClase, 
		C.Nombre AS NombreClase, 
		A.seccion AS Seccion, 
		COUNT(E.id_clase) AS CantAlumnos, 
		A.Edificio AS Edificio, 
		A.salon AS Salon, 
		A.horario AS horario, 
		D.Nombre as Catedratico 
		   FROM Clase A 
		   INNER JOIN users B ON A.id = B.id 
		   INNER JOIN Curso C ON C.id_curso = A.id_curso 
		   LEFT JOIN users D ON D.id = A.id_catedratico
		   LEFT JOIN Alumno_Clase E ON E.id_clase = A.id_clase
		   WHERE A.id=ID AND A.semestre=SEMESTRE AND A.anio=ANIO
		   GROUP BY A.id_clase, C.Nombre, A.seccion, A.Edificio, A.salon, A.horario, D.Nombre;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_consultaNoticias2 (ID INT(11), SEMESTRE INT(11), ANIO INT(11))
	BEGIN
		SELECT C.id_noticia as IdNoticia, D.Nombre as Clase, B.seccion as Seccion,
		C.Titulo as Titulo, C.Fecha, A.Nombre as Nombre
	   	FROM users A
	      INNER JOIN Clase B ON A.id = B.id
	      INNER JOIN Noticia C ON C.id_clase = B.id_clase
	      INNER JOIN Curso D ON D.id_curso = B.id_curso
			WHERE A.id=ID AND B.semestre=SEMESTRE AND B.anio=ANIO
			ORDER BY C.Fecha Desc LIMIT 5;
	END $$

/*MODIFICAR*/
/*DELIMITER $$
CREATE PROCEDURE sp_consultaActividad2 (ID INT(11))
	BEGIN
		SELECT *, CASE
					WHEN Mes = 1 THEN \"Ene\"
					WHEN Mes = 2 THEN \"Feb\"
					WHEN Mes = 3 THEN \"Mar\"
					WHEN Mes = 4 THEN \"Abr\"
					WHEN Mes = 5 THEN \"May\"
					WHEN Mes = 6 THEN \"Jun\"
					WHEN Mes = 7 THEN \"Jul\"
					WHEN Mes = 8 THEN \"Ago\"
					WHEN Mes = 9 THEN \"Sep\"
					WHEN Mes = 10 THEN \"Oct\"
					WHEN Mes = 11 THEN \"Nov\"
					WHEN Mes = 12 THEN \"Dic\"
					END as Mesfin
		FROM(SELECT D.Nombre as Clase, B.seccion as Seccion, C.Nombre as Actividad, C.Fecha as Fecha,
		DAY(C.Fecha) as Dia, MONTH(C.Fecha) as Mes FROM users A
		INNER JOIN Clase B ON A.id = B.id
		INNER JOIN Curso D ON D.id_curso = B.id_curso
		INNER JOIN Actividad C ON B.id_clase = C.id_clase
		WHERE Fecha >= DATE_ADD(NOW(), INTERVAL -1 DAY) AND A.id=ID ORDER BY C.Fecha ASC) q;
	END $$*/
	
DELIMITER $$
CREATE PROCEDURE sp_consultaClases3 (ID INT(11), SEMESTRE INT(11), ANIO INT(11))
	BEGIN
		SELECT
		A.id_clase AS IdClase, 
		C.Nombre AS NombreClase, 
		A.seccion AS Seccion, 
		COUNT(E.id_clase) AS CantAlumnos, 
		A.Edificio AS Edificio, 
		A.salon AS Salon, 
		A.horario AS horario, 
		D.Nombre as Catedratico 
			FROM Clase A 
			INNER JOIN users B ON A.id_catedratico = B.id 
			INNER JOIN Curso C ON C.id_curso = A.id_curso 
			LEFT JOIN users D ON D.id = A.id_catedratico
			LEFT JOIN Alumno_Clase E ON E.id_clase = A.id_clase
			WHERE A.id_catedratico=ID AND A.semestre=SEMESTRE AND A.anio=ANIO
			GROUP BY A.id_clase, C.Nombre, A.seccion, A.Edificio, A.salon, A.horario, D.Nombre;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_consultaNoticias3 (ID INT(11), SEMESTRE INT(11), ANIO INT(11))
	BEGIN
		SELECT C.id_noticia as IdNoticia, D.Nombre as Clase, B.seccion as Seccion,
		C.Titulo as Titulo, C.Fecha, A.Nombre as Nombre
         FROM users A
         INNER JOIN Clase B ON A.id = B.id_catedratico
         INNER JOIN Noticia C ON C.id_clase = B.id_clase
         INNER JOIN Curso D ON D.id_curso = B.id_curso
         WHERE A.id=ID AND B.semestre=SEMESTRE AND B.anio=ANIO
         ORDER BY C.Fecha Desc LIMIT 5;
	END $$
	
/*MODIFICAR*/
/*DELIMITER $$
CREATE PROCEDURE sp_consultaActividad3 (ID INT(11))
	BEGIN
		SELECT *, CASE
					WHEN Mes = 1 THEN \"Ene\"
					WHEN Mes = 2 THEN \"Feb\"
					WHEN Mes = 3 THEN \"Mar\"
					WHEN Mes = 4 THEN \"Abr\"
					WHEN Mes = 5 THEN \"May\"
					WHEN Mes = 6 THEN \"Jun\"
					WHEN Mes = 7 THEN \"Jul\"
					WHEN Mes = 8 THEN \"Ago\"
					WHEN Mes = 9 THEN \"Sep\"
					WHEN Mes = 10 THEN \"Oct\"
					WHEN Mes = 11 THEN \"Nov\"
					WHEN Mes = 12 THEN \"Dic\"
					END as Mesfin
		FROM(
			SELECT 
			D.Nombre as Clase, 
			B.seccion as Seccion, 
			C.Nombre as Actividad, 
			C.Fecha as Fecha, 
			DAY(C.Fecha) as Dia, 
			MONTH(C.Fecha) as Mes 
				FROM users A
				INNER JOIN Clase B ON A.id = B.id_catedratico
				INNER JOIN Curso D ON D.id_curso = B.id_curso
				INNER JOIN Actividad C ON B.id_clase = C.id_clase
				WHERE Fecha >= DATE_ADD(NOW(), INTERVAL -1 DAY)
				AND A.id=ID ORDER BY C.Fecha ASC) q;
	END $$*/
	
DELIMITER $$
CREATE PROCEDURE sp_busqueda1 (SEMESTRE INT(11), ANIO INT(11))
	BEGIN
		SELECT a.id_clase as id, a.semestre, a.anio, a.seccion, a.Edificio, a.salon, a.horario,
		b.Nombre as Catedratico,c.Nombre as auxiliar, d.Nombre as curso, d.id_curso  
		   FROM Clase a
		   LEFT JOIN users b ON a.id_catedratico = b.id
		   LEFT JOIN users c ON c.id = a.id
		   INNER JOIN Curso d ON d.id_curso = a.id_curso
		   WHERE a.semestre=SEMESTRE AND a.anio=ANIO
		   ORDER BY d.id_curso, a.seccion ASC;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_busqueda8 (SECCION VARCHAR(2), IDCURSO INT(11), SEMESTRE INT(11), ANIO INT(11))
	BEGIN
		SELECT * FROM Clase  WHERE seccion=SECCION AND id_curso=IDCURSO AND semestre=SEMESTRE
		AND anio=ANIO;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_insertClase (SECCION VARCHAR(2), EDIFICIO VARCHAR(10), SALON VARCHAR(10), HORARIO VARCHAR(20),
	SEMESTRE INT(11), ANIO INT(11), ID INT(11), IDCURSO INT(11), IDCATEDRATICO INT(11))
	BEGIN
		INSERT INTO Clase (seccion,Edificio,salon,horario,semestre,anio,id,id_curso,id_catedratico) 
		VALUES (SECCION, EDIFICIO, SALON, HORARIO, SEMESTRE, ANIO, ID, IDCURSO, IDCATEDRATICO);
	END $$

DELIMITER $$
CREATE PROCEDURE sp_busqueda9 (SECCION VARCHAR(2), SEMESTRE INT(11), ANIO INT(11), IDCURSO INT(11))
	BEGIN
		SELECT id_clase FROM Clase WHERE seccion=SECCION AND semestre=SEMESTRE AND anio=ANIO AND id_curso=IDCURSO;
	END $$

DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegio1 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,1);
	END $$

DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegio2 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,2);
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegio3 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,3);
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegio4 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,4);
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegio5 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,5);
	END $$
	
	DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegio6 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,6);
	END $$
	
	DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegio7 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,7);
	END $$
	
	DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegio8 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,8);
	END $$
	
	DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegio9 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,9);
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_busqueda10 (CARNET INT(11), EMAIL VARCHAR(50), CUIUNICO BIGINT(20))
	BEGIN
		SELECT * FROM users WHERE Carnet=CARNET OR email=EMAIL OR CUI=CUIUNICO;
	END $$

DELIMITER $$
CREATE PROCEDURE sp_insertUser (CARNET INT(11), NOMBRE VARCHAR(50), EMAIL VARCHAR(50), CONTRA VARCHAR(64),
CUIUNICO BIGINT(20))
	BEGIN
		INSERT INTO users (Carnet,Nombre,email,password,Tipo,CUI)
		VALUES (CARNET,NOMBRE,EMAIL,CONTRA,2,CUIUNICO);
	END $$

DELIMITER $$
CREATE PROCEDURE sp_busqueda11 (CURSO VARCHAR(50))
	BEGIN
		SELECT * FROM Catedratico WHERE Area=CURSO;
	END $$

DELIMITER $$
CREATE PROCEDURE sp_busqueda12 (NOMBRE VARCHAR(50))
	BEGIN
		SELECT * FROM Catedratico WHERE Nombre=NOMBRE;
	END $$

DELIMITER $$
CREATE PROCEDURE sp_busqueda13 (ID INT(11))
	BEGIN
		SELECT a.id_clase as id, a.semestre, a.anio, a.seccion, a.Edificio,
		a.salon, a.horario, b.Nombre as Catedratico,b.id as id_catedratico,c.Nombre as auxiliar,
		d.Nombre as curso, d.id_curso  
            FROM Clase a
            LEFT JOIN users b ON a.id_catedratico = b.id
            LEFT JOIN users c ON c.id = a.id
            INNER JOIN Curso d ON d.id_curso = a.id_curso 
            WHERE a.id_clase=ID
            ORDER BY  c.Nombre,d.id_curso ASC;
	END $$

DELIMITER $$
CREATE PROCEDURE sp_busqueda15 (SECCION VARCHAR(2), IDCURSO INT(11), SEMESTRE INT(11), ANIO INT(11), IDCLASE INT(11))
	BEGIN
		SELECT * FROM Clase  WHERE seccion=SECCION AND id_curso=IDCURSO AND semestre=SEMESTRE AND anio=ANIO
		AND id_clase!=IDCLASE;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_updateClase1 (SECCION VARCHAR(2), EDIFICIO VARCHAR(10), SALON VARCHAR(10), HORARIO VARCHAR(10),
SEMESTRE INT(11), ANIO INT(11), ID INT(11), IDCURSO INT(11), IDCATEDRATICO INT(11), IDCLASE INT(11))
	BEGIN
		UPDATE  Clase SET seccion=SECCION, Edificio=EDIFICIO, salon=SALON, horario=HORARIO, semestre=SEMESTRE,
		anio=ANIO, id=ID, id_curso=IDCURSO, id_catedratico=IDCATEDRATICO WHERE id_clase=IDCLASE;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_updateClase2 (SECCION VARCHAR(2), EDIFICIO VARCHAR(10), SALON VARCHAR(10), HORARIO VARCHAR(10),
SEMESTRE INT(11), ANIO INT(11), IDCURSO INT(11), IDCATEDRATICO INT(11), IDCLASE INT(11))
	BEGIN
		UPDATE  Clase SET seccion=SECCION, Edificio=EDIFICIO, salon=SALON, horario=HORARIO, semestre=SEMESTRE,
		anio=ANIO, id_curso=IDCURSO, id_catedratico=IDCATEDRATICO WHERE id_clase=IDCLASE;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_busqueda16 (ID INT(11))
	BEGIN
		SELECT *  FROM  users  where id=ID;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_busqueda17 (CORREO VARCHAR(50), CUIUNICO BIGINT(64), CARNET INT(11), ID INT(11))
	BEGIN
		SELECT * FROM users WHERE (email=CORREO OR cui=CUIUNICO OR Carnet=CARNET) AND id!=ID;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_updateUser1 (CUIUNICO BIGINT(64), NOMBRE VARCHAR(50), CARNET VARCHAR(50), CORREO VARCHAR(50),
ID INT(11))
	BEGIN
		UPDATE users SET CUI=CUIUNICO, Nombre=NOMBRE,Carnet=CARNET, email=CORREO WHERE id=ID;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_updateUser2 (ID INT(11))
	BEGIN
		UPDATE users SET tipo=3 WHERE id=ID;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_busqueda18 (ID INT(11))
	BEGIN
		SELECT *  FROM  users  where id=ID;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_busqueda19 (ID INT(11))
	BEGIN
		UPDATE users SET tipo=0 WHERE id=ID;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_updateUser3 (ID INT(11))
	BEGIN
		UPDATE users SET tipo=2 WHERE id=ID;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_busqueda20 (JEFE VARCHAR(15), ID INT(11))
	BEGIN
		SELECT * FROM users WHERE jefe=JEFE AND id!=ID;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_updateUser4 (NOMBRE VARCHAR(50), JEFE VARCHAR(15), CORREO VARCHAR(50), ID INT(11))
	BEGIN
		UPDATE users SET Nombre=NOMBRE, jefe=JEFE, email=CORREO WHERE id=ID;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_busqueda21 (ID INT(11))
	BEGIN
		SELECT id FROM users WHERE Carnet=ID;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_insertClase2 (SECCION VARCHAR(2), EDIFICIO VARCHAR(10), SALON VARCHAR(10), HORARIO VARCHAR(20),
SEMESTRE INT(11), ANIO INT(11), IDCURSO INT(11), IDCATEDRATICO INT(11))
	BEGIN
		INSERT INTO Clase (seccion,Edificio,salon,horario,semestre,anio,id_curso,id_catedratico)
		VALUES (SECCION,EDIFICIO,SALON,HORARIO,SEMESTRE,ANIO,IDCURSO,IDCATEDRATICO);
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_busqueda22 (SECCION VARCHAR(2), SEMESTRE INT(11), ANIO INT(11), IDCURSO INT(11))
	BEGIN
		SELECT id_clase FROM Clase WHERE seccion=SECCION AND semestre=SEMESTRE AND anio=ANIO
		AND id_curso=IDCURSO;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegioClase1 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,1);
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegioClase2 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,2);
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegioClase3 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,3);
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegioClase4 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,4);
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegioClase5 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,5);
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegioClase6 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,6);
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegioClase7 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,7);
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegioClase8 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,8);
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_insertPrivilegioClase9 (ID INT(11))
	BEGIN
		INSERT INTO Privilegio VALUES(NULL,ID,1,1,1,1,9);
	END $$

DELIMITER $$
CREATE PROCEDURE sp_matricular2 ()
	BEGIN
		UPDATE Matricular SET activo = '0' WHERE id = 1;
	END $$
	
DELIMITER $$
CREATE PROCEDURE sp_matricular3 ()
	BEGIN
		UPDATE Matricular SET activo = '1' WHERE id = 1;
	END $$
	
