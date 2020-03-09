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