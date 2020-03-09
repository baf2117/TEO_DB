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