CREATE TABLE IF NOT EXISTS `Matricular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;