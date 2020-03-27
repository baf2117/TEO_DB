CREATE VIEW view_enviarCorreos1 AS
	SELECT A.Fecha Fecha, A.Nombre as Nombreactividad, A.Ponderacion as Ponderacion, 
		E.Nombre as Nombrecurso, C.Nombre as Nombrealumno, C.email as Email
	   	FROM Actividad A 
		   INNER JOIN Alumno_Actividad B ON A.id_actividad = B.id_actividad
		   INNER JOIN users C ON B.id = C.id
		   INNER JOIN Clase D ON D.id_clase = A.id_clase
		   INNER JOIN Curso E ON E.id_curso = D.id_curso
		   WHERE ADDDATE(CURDATE(), 1) = Fecha AND id_actividad_padre IS NULL;
	   
CREATE VIEW view_enviarCorreos2 AS
	SELECT A.Fecha Fecha, A.Nombre as Nombreactividad, E.Nombre as Nombrecurso,
		D.seccion as Seccion, C.Nombre as Nombrealumno, C.email as Email
	      FROM Actividad A 
	      INNER JOIN Clase D ON D.id_clase = A.id_clase
	      INNER JOIN users C ON D.id = C.id                        
	      INNER JOIN Curso E ON E.id_curso = D.id_curso
	      WHERE ADDDATE(CURDATE(), 1) = Fecha AND id_actividad_padre IS NULL;

CREATE VIEW view_busqueda2 AS
	SELECT * FROM users WHERE tipo = 2;
	
CREATE VIEW view_busqueda3 AS
	SELECT id_curso as id, Nombre FROM Curso;

CREATE VIEW view_busqueta4 AS
	SELECT id, Nombre FROM users WHERE tipo > 3;
	
CREATE VIEW view_busqueda5 AS
	SELECT DISTINCT c.Nombre as aux, c.id, c.email as correo,
		c.Carnet as carne, c.CUI  FROM users c WHERE  c.tipo  =  3 order by c.Nombre ASC;
	
CREATE VIEW view_busqueda6 AS
	SELECT Nombre, id FROM users WHERE tipo = 2;

CREATE VIEW view_busqueda7 AS
	SELECT c.Nombre as cat, c.id, c.email as correo, c.jefe as jefe FROM users c WHERE tipo > 3;
	
CREATE VIEW view_busqueda14 AS
	SELECT a.id, a.seccion, a.Edificio, a.salon, a.horario, b.Nombre AS Catedratico,c.Nombre AS auxiliar, d.Nombre AS curso, d.id_curso  
	   FROM Clase a, users b, users c , Curso d 
	   WHERE a.id_catedratico = b.id AND c.id = a.id AND d.id_curso = a.id_curso  
	   ORDER BY c.Nombre,d.id_curso ASC;
	   
CREATE VIEW view_matricular1 AS
	SELECT * FROM Matricular;
	










