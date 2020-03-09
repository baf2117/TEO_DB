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