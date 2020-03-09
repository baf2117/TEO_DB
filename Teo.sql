CREATE DATABASE IF NOT EXISTS `Teo` 
USE `Teo`;

CREATE TABLE IF NOT EXISTS `Curso` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) DEFAULT NULL,
  `Area` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=963 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Matricular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Carnet` int(11) NOT NULL,
  `CUI` bigint(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `jefe` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2932 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Catalogo_Actividad` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Clase` (
  `id_clase` int(11) NOT NULL AUTO_INCREMENT,
  `seccion` varchar(2) DEFAULT NULL,
  `Edificio` varchar(10) DEFAULT NULL,
  `salon` varchar(10) DEFAULT NULL,
  `horario` varchar(20) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `id_curso` int(11) NOT NULL,
  `id_catedratico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_clase`),
  KEY `Clase_Curso_FK` (`id_curso`),
  KEY `Clase_users_FK` (`id`),
  KEY `Clase_cat_FK` (`id_catedratico`),
  CONSTRAINT `Clase_Curso_FK` FOREIGN KEY (`id_curso`) REFERENCES `Curso` (`id_curso`),
  CONSTRAINT `Clase_cat_FK` FOREIGN KEY (`id_catedratico`) REFERENCES `users` (`id`),
  CONSTRAINT `Clase_users_FK` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Dialogo` (
  `id_dialogo` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime DEFAULT NULL,
  `Contenido` varchar(1000) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `id_noticia` int(11) NOT NULL,
  PRIMARY KEY (`id_dialogo`),
  KEY `Dialogo_Noticia_FK` (`id_noticia`),
  KEY `Dialogo_users_FK` (`id`),
  CONSTRAINT `Dialogo_Noticia_FK` FOREIGN KEY (`id_noticia`) REFERENCES `Noticia` (`id_noticia`),
  CONSTRAINT `Dialogo_users_FK` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=latin1;

    CREATE TABLE IF NOT EXISTS `Privilegio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_clase` int(11) NOT NULL DEFAULT '0',
  `Lectura` tinyint(1) NOT NULL DEFAULT '0',
  `Escritura` tinyint(1) NOT NULL DEFAULT '0',
  `Eliminacion` tinyint(1) NOT NULL DEFAULT '0',
  `Creacion` tinyint(1) NOT NULL DEFAULT '0',
  `Actividad` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_idclase_privilegio` (`id_clase`),
  KEY `FK_Actividad` (`Actividad`),
  CONSTRAINT `FK_Actividad` FOREIGN KEY (`Actividad`) REFERENCES `Catalogo_Actividad` (`id`),
  CONSTRAINT `FK_idclase_privilegio` FOREIGN KEY (`id_clase`) REFERENCES `Clase` (`id_clase`)
) ENGINE=InnoDB AUTO_INCREMENT=820 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Actividad` (
  `id_actividad` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Ponderada` int(1) DEFAULT NULL,
  `Ponderacion` decimal(5,2) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo` varchar(20) DEFAULT NULL,
  `id_clase` int(11) NOT NULL,
  `id_actividad_padre` int(11) DEFAULT NULL,
  `Catalogo_Actividad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_actividad`),
  KEY `Actividad_AcividadPadre_FK` (`id_actividad_padre`),
  KEY `Actividad_Clase_FK` (`id_clase`),
  KEY `Catalogo_Actividad_FK` (`Catalogo_Actividad`),
  CONSTRAINT `Actividad_AcividadPadre_FK` FOREIGN KEY (`id_actividad_padre`) REFERENCES `Actividad` (`id_actividad`) ON DELETE CASCADE,
  CONSTRAINT `Actividad_Clase_FK` FOREIGN KEY (`id_clase`) REFERENCES `Clase` (`id_clase`) ON DELETE CASCADE,
  CONSTRAINT `Catalogo_Actividad_FK` FOREIGN KEY (`Catalogo_Actividad`) REFERENCES `Catalogo_Actividad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=LATIN1;

    CREATE TABLE IF NOT EXISTS `Alumno_Actividad` (
  `Nota` decimal(5,2) DEFAULT '0.00',
  `id` int(11) NOT NULL,
  `id_act_alumno` int(11) NOT NULL AUTO_INCREMENT,
  `id_actividad` int(11) NOT NULL,
  PRIMARY KEY (`id_act_alumno`),
  KEY `Alumno_Actividad_Actividad_FK` (`id_actividad`),
  KEY `Alumno_Actividad_users_FK` (`id`),
  CONSTRAINT `Alumno_Actividad_Actividad_FK` FOREIGN KEY (`id_actividad`) REFERENCES `Actividad` (`id_actividad`) ON DELETE CASCADE,
  CONSTRAINT `Alumno_Actividad_users_FK` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3494 DEFAULT CHARSET=latin1;

    CREATE TABLE IF NOT EXISTS `Alumno_Clase` (
  `Asignado` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL,
  `Aprobado` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`id_clase`),
  KEY `Alumno_Clase_Clase_FK` (`id_clase`),
  CONSTRAINT `Alumno_Clase_Clase_FK` FOREIGN KEY (`id_clase`) REFERENCES `Clase` (`id_clase`),
  CONSTRAINT `Alumno_Clase_users_FK` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

    CREATE TABLE IF NOT EXISTS `Recursos` (
  `id_recurso` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) DEFAULT NULL,
  `NombreArchivo` varchar(500) NOT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `Tipo` int(11) DEFAULT NULL,
  `id_clase` int(11) DEFAULT NULL,
  `id_actividad` int(11) DEFAULT NULL,
  `publico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_recurso`),
  KEY `Recursos_Actividad_FK` (`id_actividad`),
  KEY `Recursos_Clase_FK` (`id_clase`),
  CONSTRAINT `Recursos_Actividad_FK` FOREIGN KEY (`id_actividad`) REFERENCES `Actividad` (`id_actividad`),
  CONSTRAINT `Recursos_Clase_FK` FOREIGN KEY (`id_clase`) REFERENCES `Clase` (`id_clase`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=latin1;

