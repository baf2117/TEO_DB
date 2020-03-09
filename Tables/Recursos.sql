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