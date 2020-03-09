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