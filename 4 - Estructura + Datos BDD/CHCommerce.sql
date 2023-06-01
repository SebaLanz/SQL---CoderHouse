-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para coderecommerce
CREATE DATABASE IF NOT EXISTS `coderecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `coderecommerce`;

-- Volcando estructura para tabla coderecommerce.categoria_vehiculo
CREATE TABLE IF NOT EXISTS `categoria_vehiculo` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `cagetoria` char(50) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla coderecommerce.categoria_vehiculo: ~8 rows (aproximadamente)
DELETE FROM `categoria_vehiculo`;
INSERT INTO `categoria_vehiculo` (`id_categoria`, `cagetoria`) VALUES
	(1, 'automovil'),
	(2, 'motovehículo'),
	(18, '"Automovil"'),
	(19, '"motovehículo"'),
	(20, '"bicicleta"'),
	(21, '"Camioneta"'),
	(22, '"pick up"'),
	(23, '"camion"');

-- Volcando estructura para vista coderecommerce.compras_vehiculos
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `compras_vehiculos` (
	`usuario` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`valor` FLOAT NOT NULL,
	`fecha` DATE NOT NULL,
	`cagetoria` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`marca` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`tipo` CHAR(50) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para tabla coderecommerce.inmueble
CREATE TABLE IF NOT EXISTS `inmueble` (
  `id_inmueble` int(11) NOT NULL AUTO_INCREMENT,
  `calle` char(50) NOT NULL,
  `altura` smallint(50) NOT NULL,
  `localidad` char(50) NOT NULL,
  `cantidad_banio` smallint(50) NOT NULL,
  `cantidad_dormitorio` smallint(50) NOT NULL,
  `metros_cuadrados` smallint(50) NOT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `id_tipo_inmueble` int(11) NOT NULL,
  `id_pais` int(11) NOT NULL,
  PRIMARY KEY (`id_inmueble`),
  KEY `id_tipo_inmueble` (`id_tipo_inmueble`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `FK_inmueble_pais` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_inmueble_tipo_inmueble` FOREIGN KEY (`id_tipo_inmueble`) REFERENCES `tipo_inmueble` (`id_tipo_inmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla coderecommerce.inmueble: ~3 rows (aproximadamente)
DELETE FROM `inmueble`;
INSERT INTO `inmueble` (`id_inmueble`, `calle`, `altura`, `localidad`, `cantidad_banio`, `cantidad_dormitorio`, `metros_cuadrados`, `observaciones`, `id_tipo_inmueble`, `id_pais`) VALUES
	(1, 'Tab', 234, 'Lanús   \r\n', 3, 2, 50, NULL, 1, 1),
	(3, '2 de mayo', 100, 'lanus', 3, 5, 80, '', 1, 1),
	(4, 'pavo', 4500, 'avellaneda', 1, 2, 40, 'depto', 5, 1);

-- Volcando estructura para tabla coderecommerce.marca
CREATE TABLE IF NOT EXISTS `marca` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` char(50) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla coderecommerce.marca: ~15 rows (aproximadamente)
DELETE FROM `marca`;
INSERT INTO `marca` (`id_marca`, `marca`) VALUES
	(1, 'FIAT'),
	(2, 'FIAT'),
	(3, 'FORD'),
	(4, 'CHEVROLET'),
	(5, 'HYUNDAI'),
	(6, 'CITROEN'),
	(7, 'HONDA'),
	(8, 'NISSAN'),
	(9, 'LEXUS'),
	(10, 'LAND ROVER'),
	(11, 'RENAULT'),
	(12, 'SUBARU'),
	(13, 'SEAT'),
	(14, 'SUSUKI'),
	(15, 'TOYOTA');

-- Volcando estructura para tabla coderecommerce.moneda
CREATE TABLE IF NOT EXISTS `moneda` (
  `id_moneda` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_moneda` char(50) NOT NULL,
  PRIMARY KEY (`id_moneda`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla coderecommerce.moneda: ~8 rows (aproximadamente)
DELETE FROM `moneda`;
INSERT INTO `moneda` (`id_moneda`, `tipo_moneda`) VALUES
	(2, 'Dolar'),
	(10, 'Peso'),
	(11, 'Dólar'),
	(12, 'Euro'),
	(13, 'Libra esterlina'),
	(14, 'franco suizo'),
	(15, 'Yuan'),
	(16, 'Dólar Canadiense');

-- Volcando estructura para tabla coderecommerce.pais
CREATE TABLE IF NOT EXISTS `pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `pais` char(50) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla coderecommerce.pais: ~11 rows (aproximadamente)
DELETE FROM `pais`;
INSERT INTO `pais` (`id_pais`, `pais`) VALUES
	(1, 'Argentina'),
	(62, 'Bolivia\''),
	(63, 'Paraguay\''),
	(64, 'Brasil\''),
	(65, 'Venezuela\''),
	(66, 'Chile\''),
	(67, 'Uruguay\''),
	(68, '"Per?"'),
	(69, 'Australia\''),
	(70, '"Espa?a"'),
	(71, 'Canada\'');

-- Volcando estructura para tabla coderecommerce.perfil_permiso
CREATE TABLE IF NOT EXISTS `perfil_permiso` (
  `id_perfil_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `permiso` char(50) NOT NULL,
  PRIMARY KEY (`id_perfil_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='INVITADO - ADM - USER - etc';

-- Volcando datos para la tabla coderecommerce.perfil_permiso: ~2 rows (aproximadamente)
DELETE FROM `perfil_permiso`;
INSERT INTO `perfil_permiso` (`id_perfil_permiso`, `permiso`) VALUES
	(1, 'ADMINISTRADOR'),
	(2, 'INVITADO'),
	(3, 'USUARIO');

-- Volcando estructura para procedimiento coderecommerce.SP_order
DELIMITER //
CREATE PROCEDURE `SP_order`(IN asc_desc VARCHAR(200), columna VARCHAR(200))
BEGIN
   SET @sql_consulta = CONCAT('SELECT ', columna, ' FROM usuario ORDER BY ', columna, ' ', asc_desc);
   PREPARE stmt FROM @sql_consulta;
   EXECUTE stmt;
   DEALLOCATE PREPARE stmt;
END//
DELIMITER ;

-- Volcando estructura para tabla coderecommerce.tarjeta
CREATE TABLE IF NOT EXISTS `tarjeta` (
  `id_tarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `nro_tarjeta` char(50) NOT NULL DEFAULT '',
  `nombre_titular` char(50) NOT NULL,
  `apellido_titular` char(50) NOT NULL,
  `dni_titular` int(11) DEFAULT NULL,
  `nro_codigo` smallint(6) NOT NULL,
  `id_tipo_tarjeta` int(11) NOT NULL,
  `id_usuario_perfil` int(11) NOT NULL,
  `id_tarjeta_nombre` int(11) NOT NULL,
  PRIMARY KEY (`id_tarjeta`),
  UNIQUE KEY `nro_tarjeta` (`nro_tarjeta`),
  KEY `id_usuario_perfil` (`id_usuario_perfil`),
  KEY `id_tarjeta_nombre` (`id_tarjeta_nombre`),
  KEY `tipo_tarjeta` (`id_tipo_tarjeta`) USING BTREE,
  CONSTRAINT `FK_tarjeta_tarjeta_nombre` FOREIGN KEY (`id_tarjeta_nombre`) REFERENCES `tarjeta_nombre` (`id_tarjeta_nom`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tarjeta_tipo_tarjeta` FOREIGN KEY (`id_tipo_tarjeta`) REFERENCES `tipo_tarjeta` (`id_tipo_tarjeta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tarjeta_usuario_perfil` FOREIGN KEY (`id_usuario_perfil`) REFERENCES `usuario_perfil` (`id_usuario_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Datos de la tarjeta.';

-- Volcando datos para la tabla coderecommerce.tarjeta: ~0 rows (aproximadamente)
DELETE FROM `tarjeta`;
INSERT INTO `tarjeta` (`id_tarjeta`, `nro_tarjeta`, `nombre_titular`, `apellido_titular`, `dni_titular`, `nro_codigo`, `id_tipo_tarjeta`, `id_usuario_perfil`, `id_tarjeta_nombre`) VALUES
	(3, '111 222 333', 'Sebastian', 'lanzetti', 37361177, 123, 2, 1, 1);

-- Volcando estructura para tabla coderecommerce.tarjeta_nombre
CREATE TABLE IF NOT EXISTS `tarjeta_nombre` (
  `id_tarjeta_nom` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) NOT NULL,
  PRIMARY KEY (`id_tarjeta_nom`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Visa-Mastercard-etc';

-- Volcando datos para la tabla coderecommerce.tarjeta_nombre: ~2 rows (aproximadamente)
DELETE FROM `tarjeta_nombre`;
INSERT INTO `tarjeta_nombre` (`id_tarjeta_nom`, `nombre`) VALUES
	(1, 'VISA'),
	(2, 'MASTER CARD'),
	(3, 'NACIÓN');

-- Volcando estructura para tabla coderecommerce.tipo_inmueble
CREATE TABLE IF NOT EXISTS `tipo_inmueble` (
  `id_tipo_inmueble` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(50) NOT NULL,
  PRIMARY KEY (`id_tipo_inmueble`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla coderecommerce.tipo_inmueble: ~5 rows (aproximadamente)
DELETE FROM `tipo_inmueble`;
INSERT INTO `tipo_inmueble` (`id_tipo_inmueble`, `tipo`) VALUES
	(1, 'Casa'),
	(2, 'Edificio'),
	(3, 'PH'),
	(4, 'Local'),
	(5, 'Departamento');

-- Volcando estructura para tabla coderecommerce.tipo_tarjeta
CREATE TABLE IF NOT EXISTS `tipo_tarjeta` (
  `id_tipo_tarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(50) NOT NULL,
  PRIMARY KEY (`id_tipo_tarjeta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Débito, crédito, etc.';

-- Volcando datos para la tabla coderecommerce.tipo_tarjeta: ~2 rows (aproximadamente)
DELETE FROM `tipo_tarjeta`;
INSERT INTO `tipo_tarjeta` (`id_tipo_tarjeta`, `tipo`) VALUES
	(1, 'Crédito'),
	(2, 'Débito');

-- Volcando estructura para tabla coderecommerce.tipo_transaccion
CREATE TABLE IF NOT EXISTS `tipo_transaccion` (
  `id_tipo_transaccion` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(50) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_transaccion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla coderecommerce.tipo_transaccion: ~2 rows (aproximadamente)
DELETE FROM `tipo_transaccion`;
INSERT INTO `tipo_transaccion` (`id_tipo_transaccion`, `tipo`) VALUES
	(1, 'Compra\r\n'),
	(2, 'Venta');

-- Volcando estructura para tabla coderecommerce.transaccion_inmueble
CREATE TABLE IF NOT EXISTS `transaccion_inmueble` (
  `id_transaccion_inmueble` int(11) NOT NULL AUTO_INCREMENT,
  `valor` float NOT NULL,
  `fecha` datetime NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_tipo_transaccion` int(11) NOT NULL,
  `id_inmueble` int(11) NOT NULL,
  `id_moneda` int(11) NOT NULL,
  PRIMARY KEY (`id_transaccion_inmueble`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_inmueble` (`id_inmueble`),
  KEY `id_tipo_transaccion` (`id_tipo_transaccion`),
  KEY `id_moneda` (`id_moneda`),
  CONSTRAINT `FK_transaccion_inmueble_inmueble` FOREIGN KEY (`id_inmueble`) REFERENCES `inmueble` (`id_inmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_transaccion_inmueble_moneda` FOREIGN KEY (`id_moneda`) REFERENCES `moneda` (`id_moneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_transaccion_inmueble_tipo_transaccion` FOREIGN KEY (`id_tipo_transaccion`) REFERENCES `tipo_transaccion` (`id_tipo_transaccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_transaccion_inmueble_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla coderecommerce.transaccion_inmueble: ~0 rows (aproximadamente)
DELETE FROM `transaccion_inmueble`;

-- Volcando estructura para tabla coderecommerce.transaccion_vehiculo
CREATE TABLE IF NOT EXISTS `transaccion_vehiculo` (
  `id_transaccion_vehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_transaccion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_moneda` int(11) NOT NULL,
  `valor` float NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_transaccion_vehiculo`) USING BTREE,
  KEY `id_tipo_transaccion` (`id_tipo_transaccion`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_moneda` (`id_moneda`),
  KEY `id_categoria` (`id_vehiculo`) USING BTREE,
  CONSTRAINT `FK_transaccion_moneda` FOREIGN KEY (`id_moneda`) REFERENCES `moneda` (`id_moneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_transaccion_tipo_transaccion` FOREIGN KEY (`id_tipo_transaccion`) REFERENCES `tipo_transaccion` (`id_tipo_transaccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_transaccion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_transaccion_vehiculo` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='Genera el estado de vendido, comprado.';

-- Volcando datos para la tabla coderecommerce.transaccion_vehiculo: ~2 rows (aproximadamente)
DELETE FROM `transaccion_vehiculo`;
INSERT INTO `transaccion_vehiculo` (`id_transaccion_vehiculo`, `id_tipo_transaccion`, `id_usuario`, `id_vehiculo`, `id_moneda`, `valor`, `fecha`) VALUES
	(3, 2, 2, 3, 2, 50000, '2023-03-25'),
	(5, 1, 4, 4, 11, 180000, '2023-05-08');

-- Volcando estructura para procedimiento coderecommerce.uPerfil_letra
DELIMITER //
CREATE PROCEDURE `uPerfil_letra`(IN letra char)
BEGIN
		SELECT u.usuario, up.nombre
		FROM usuario_perfil up
		INNER JOIN usuario u ON up.id_usuario = u.id_usuario
		WHERE up.nombre LIKE concat(letra,'%');
	END//
DELIMITER ;

-- Volcando estructura para tabla coderecommerce.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` char(50) NOT NULL,
  `clave` char(50) NOT NULL,
  `email` char(50) NOT NULL,
  `estado` bit(1) NOT NULL,
  `img_usuario` char(50) NOT NULL,
  `id_perfil_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `id_perfil_permiso` (`id_perfil_permiso`),
  CONSTRAINT `FK_usuario_perfil_permiso` FOREIGN KEY (`id_perfil_permiso`) REFERENCES `perfil_permiso` (`id_perfil_permiso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla coderecommerce.usuario: ~14 rows (aproximadamente)
DELETE FROM `usuario`;
INSERT INTO `usuario` (`id_usuario`, `usuario`, `clave`, `email`, `estado`, `img_usuario`, `id_perfil_permiso`) VALUES
	(2, 'admin', '123', 'admin@gmail.com', b'1', '', 1),
	(3, '\'usr1\'', '\'3212351\'', '\'8299@email.com\'', b'1', '\'a\'', 2),
	(4, '\'usr2\'', '\'231234\'', '\'8299@email.com\'', b'1', '\'a\'', 3),
	(5, '\'usr3\'', '\'-3212351\'', '\'8299@email.com\'', b'1', '\'a\'', 3),
	(6, '\'usr4\'', '\'-6424702\'', '\'8299@email.com\'', b'1', '\'a\'', 1),
	(7, '\'usr5\'', '\'-9637053\'', '\'8299@email.com\'', b'1', '\'a\'', 2),
	(8, '\'usr6\'', '\'-12849404\'', '\'8299@email.com\'', b'1', '\'a\'', 3),
	(9, '\'usr7\'', '\'-16061755\'', '\'8299@email.com\'', b'1', '\'a\'', 1),
	(10, '\'usr8\'', '\'-19274106\'', '\'8299@email.com\'', b'1', '\'a\'', 2),
	(11, '\'usr9\'', '\'-22486457\'', '\'8299@email.com\'', b'1', '\'a\'', 3),
	(12, '\'usr0\'', '\'-25698808\'', '\'8299@email.com\'', b'1', '\'a\'', 1),
	(13, '\'usr\'\'', '\'-28911159\'', '\'8299@email.com\'', b'1', '\'a\'', 2),
	(14, '\'usr10\'', '\'-32123510\'', '\'8299@email.com\'', b'1', '\'a\'', 3),
	(15, '\'usr11\'', '\'-35335861\'', '\'8299@email.com\'', b'1', '\'a\'', 1);

-- Volcando estructura para vista coderecommerce.usuarios_administradores
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `usuarios_administradores` (
	`usuario` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`permiso` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombre` CHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`apellido` CHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista coderecommerce.usuarios_invitados
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `usuarios_invitados` (
	`usuario` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`permiso` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombre` CHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`apellido` CHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista coderecommerce.usuarios_usuarios
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `usuarios_usuarios` (
	`usuario` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`permiso` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombre` CHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`apellido` CHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista coderecommerce.usuario_info
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `usuario_info` (
	`Usuario` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Nombre Usuario` CHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`apellido` CHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`dni` CHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
	`permiso` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`pais` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nro_tarjeta` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Nom titular` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Ape titular` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`tipo` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombre` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para tabla coderecommerce.usuario_perfil
CREATE TABLE IF NOT EXISTS `usuario_perfil` (
  `id_usuario_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(100) NOT NULL,
  `apellido` char(100) NOT NULL,
  `dni` char(10) NOT NULL,
  `calle` char(50) NOT NULL,
  `numero_calle` char(10) NOT NULL,
  `localidad` char(50) NOT NULL,
  `telefono` char(20) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_pais` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario_perfil`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `FK_usuario_perfil_pais` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuario_perfil_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='Información del perfil de usuario.';

-- Volcando datos para la tabla coderecommerce.usuario_perfil: ~4 rows (aproximadamente)
DELETE FROM `usuario_perfil`;
INSERT INTO `usuario_perfil` (`id_usuario_perfil`, `nombre`, `apellido`, `dni`, `calle`, `numero_calle`, `localidad`, `telefono`, `id_usuario`, `id_pais`) VALUES
	(1, 'Sebastián', 'Lanzetti', '37361177', 'tab', '3823', 'lanús', '123123123', 2, 1),
	(2, 'NombreInvitado', 'invitado', '23232323', '', '', '', '', 3, 62),
	(3, 'NombreUsuario', 'Usuario', '121112332', 'inv', '2233', 'Lanús', '123232', 4, 64),
	(4, 'us4', 'su4', '1232313', '', '', '', '', 5, 1);

-- Volcando estructura para tabla coderecommerce.vehiculo
CREATE TABLE IF NOT EXISTS `vehiculo` (
  `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `patente` char(50) NOT NULL,
  `id_categoria_vehiculo` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  PRIMARY KEY (`id_vehiculo`) USING BTREE,
  KEY `id_categoria` (`id_categoria_vehiculo`) USING BTREE,
  KEY `id_marca` (`id_marca`),
  CONSTRAINT `FK_vehiculo_categoria_vehículo` FOREIGN KEY (`id_categoria_vehiculo`) REFERENCES `categoria_vehiculo` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_vehiculo_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla coderecommerce.vehiculo: ~9 rows (aproximadamente)
DELETE FROM `vehiculo`;
INSERT INTO `vehiculo` (`id_vehiculo`, `patente`, `id_categoria_vehiculo`, `id_marca`) VALUES
	(3, 'clg-235', 1, 1),
	(4, 'aaa-111', 2, 1),
	(5, 'bbb-222', 1, 2),
	(6, 'ddd-444', 2, 1),
	(7, 'eee-555', 1, 1),
	(8, 'fff-666', 2, 3),
	(9, 'ggg-777', 1, 7),
	(10, 'zzz-231', 2, 2),
	(11, 'gds-235', 1, 6);

-- Volcando estructura para procedimiento coderecommerce.vehiculo_letra
DELIMITER //
CREATE PROCEDURE `vehiculo_letra`(IN letra CHAR, OUT cantidad int)
BEGIN
		SELECT COUNT(*) INTO cantidad
		FROM vehiculo v
		WHERE v.patente LIKE concat(letra,'%');
	END//
DELIMITER ;

-- Volcando estructura para vista coderecommerce.ventas_vehiculos
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `ventas_vehiculos` (
	`usuario` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`valor` FLOAT NOT NULL,
	`fecha` DATE NOT NULL,
	`cagetoria` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`marca` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`tipo` CHAR(50) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para disparador coderecommerce.log_usuario
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER log_usuario AFTER INSERT ON usuario
-- if NEW.id_tipo_transaccion = 3 {
FOR EACH ROW BEGIN 
	INSERT INTO registro_usuario (usuario)
			 VALUE (NEW.usuario);			 
-- }
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador coderecommerce.valor_ant_veh
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER valor_ant_veh before update ON transaccion_vehiculo
FOR EACH ROW BEGIN 
	INSERT INTO vehiculo_valor_anterior (id_vehiculo, valor)
			 VALUE (old.id_vehiculo, OLD.valor);			 
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para vista coderecommerce.compras_vehiculos
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `compras_vehiculos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `compras_vehiculos` AS SELECT u.usuario,
		 tv.valor, tv.fecha,
		 cv.cagetoria,
		 m.marca,
		 tt.tipo
FROM usuario u 
INNER JOIN transaccion_vehiculo tv ON u.id_usuario = tv.id_usuario
INNER JOIN vehiculo v ON tv.id_vehiculo = v.id_vehiculo
INNER JOIN marca m ON v.id_marca = m.id_marca
INNER JOIN categoria_vehiculo cv ON v.id_categoria_vehiculo = cv.id_categoria 
INNER JOIN tipo_transaccion tt ON tv.id_tipo_transaccion = tt.id_tipo_transaccion
WHERE tt.id_tipo_transaccion = 1 ;

-- Volcando estructura para vista coderecommerce.usuarios_administradores
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `usuarios_administradores`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `usuarios_administradores` AS SELECT u.usuario,
		 pp.permiso,
		 up.nombre,
		 up.apellido
FROM usuario u
INNER JOIN perfil_permiso pp ON u.id_perfil_permiso = pp.id_perfil_permiso
INNER JOIN usuario_perfil up ON u.id_usuario = up.id_usuario
WHERE pp.id_perfil_permiso = 1 ;

-- Volcando estructura para vista coderecommerce.usuarios_invitados
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `usuarios_invitados`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `usuarios_invitados` AS SELECT u.usuario,
		 pp.permiso,
		 up.nombre,
		 up.apellido
FROM usuario u
INNER JOIN perfil_permiso pp ON u.id_perfil_permiso = pp.id_perfil_permiso
INNER JOIN usuario_perfil up ON u.id_usuario = up.id_usuario
WHERE pp.id_perfil_permiso = 2 ;

-- Volcando estructura para vista coderecommerce.usuarios_usuarios
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `usuarios_usuarios`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `usuarios_usuarios` AS SELECT u.usuario,
		 pp.permiso,
		 up.nombre,
		 up.apellido
FROM usuario u
INNER JOIN perfil_permiso pp ON u.id_perfil_permiso = pp.id_perfil_permiso
INNER JOIN usuario_perfil up ON u.id_usuario = up.id_usuario
WHERE pp.id_perfil_permiso = 3 ;

-- Volcando estructura para vista coderecommerce.usuario_info
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `usuario_info`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `usuario_info` AS SELECT u.usuario AS 'Usuario',
		 up.nombre AS 'Nombre Usuario', up.apellido, up.dni,
		 pp.permiso,
		 p.pais,
		 t.nro_tarjeta, t.nombre_titular AS 'Nom titular', t.apellido_titular AS 'Ape titular',
		 tt.tipo,
		 tn.nombre
FROM usuario u
INNER JOIN perfil_permiso pp ON u.id_perfil_permiso = pp.id_perfil_permiso
INNER JOIN usuario_perfil up ON u.id_usuario = up.id_usuario
INNER JOIN pais p ON up.id_pais = p.id_pais
INNER JOIN tarjeta t ON up.id_usuario_perfil = t.id_usuario_perfil
INNER JOIN tipo_tarjeta tt ON t.id_tipo_tarjeta = tt.id_tipo_tarjeta
INNER JOIN tarjeta_nombre tn ON t.id_tarjeta_nombre = tn.id_tarjeta_nom ;

-- Volcando estructura para vista coderecommerce.ventas_vehiculos
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `ventas_vehiculos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ventas_vehiculos` AS SELECT u.usuario,
		 tv.valor, tv.fecha,
		 cv.cagetoria,
		 m.marca,
		 tt.tipo
FROM usuario u 
INNER JOIN transaccion_vehiculo tv ON u.id_usuario = tv.id_usuario
INNER JOIN vehiculo v ON tv.id_vehiculo = v.id_vehiculo
INNER JOIN marca m ON v.id_marca = m.id_marca
INNER JOIN categoria_vehiculo cv ON v.id_categoria_vehiculo = cv.id_categoria 
INNER JOIN tipo_transaccion tt ON tv.id_tipo_transaccion = tt.id_tipo_transaccion
WHERE tt.id_tipo_transaccion = 2 ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
