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