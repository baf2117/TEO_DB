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