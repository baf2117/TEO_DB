CREATE TABLE IF NOT EXISTS `Noticia` (
  `id_noticia` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(30) DEFAULT NULL,
  `Descripcion` varchar(1000) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `id_clase` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id_noticia`),
  KEY `Noticia_Clase_FK` (`id_clase`),
  KEY `Noticia_users_FK` (`id`),
  CONSTRAINT `Noticia_Clase_FK` FOREIGN KEY (`id_clase`) REFERENCES `Clase` (`id_clase`),
  CONSTRAINT `Noticia_users_FK` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;