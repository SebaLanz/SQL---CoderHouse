-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.25-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coderecommerce.compras_vehiculos
CREATE TABLE IF NOT EXISTS `compras_vehiculos` (
  `usuario` char(50) NOT NULL,
  `valor` float NOT NULL,
  `fecha` date NOT NULL,
  `cagetoria` char(50) NOT NULL,
  `marca` char(50) NOT NULL,
  `tipo` char(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para función coderecommerce.fun_permisos
DELIMITER //
CREATE FUNCTION `fun_permisos`(id_permiso INT(50)) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
    DECLARE permiso text;
    SELECT pp.permiso INTO permiso FROM perfil_permiso pp WHERE pp.id_perfil_permiso = id_permiso;
    RETURN permiso;
END//
DELIMITER ;

-- Volcando estructura para función coderecommerce.get_id_usuario
DELIMITER //
CREATE FUNCTION `get_id_usuario`(usuario VARCHAR(50)) RETURNS int(11)
    DETERMINISTIC
BEGIN 
    DECLARE id_usuario INT;
    SELECT u.id_usuario INTO id_usuario FROM usuario u WHERE u.usuario = usuario;
    RETURN id_usuario;
END//
DELIMITER ;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coderecommerce.marca
CREATE TABLE IF NOT EXISTS `marca` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` char(50) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coderecommerce.moneda
CREATE TABLE IF NOT EXISTS `moneda` (
  `id_moneda` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_moneda` char(50) NOT NULL,
  PRIMARY KEY (`id_moneda`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coderecommerce.pais
CREATE TABLE IF NOT EXISTS `pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `pais` char(50) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coderecommerce.perfil_permiso
CREATE TABLE IF NOT EXISTS `perfil_permiso` (
  `id_perfil_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `permiso` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_perfil_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='INVITADO - ADM - USER - etc';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coderecommerce.registro_usuario
CREATE TABLE IF NOT EXISTS `registro_usuario` (
  `id_registro_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_registro_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='Es una tabla de logs, en la cual se insertan datos cuando se crea un usuario';

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coderecommerce.tarjeta_nombre
CREATE TABLE IF NOT EXISTS `tarjeta_nombre` (
  `id_tarjeta_nom` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) NOT NULL,
  PRIMARY KEY (`id_tarjeta_nom`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Visa-Mastercard-etc';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coderecommerce.tipo_inmueble
CREATE TABLE IF NOT EXISTS `tipo_inmueble` (
  `id_tipo_inmueble` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(50) NOT NULL,
  PRIMARY KEY (`id_tipo_inmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coderecommerce.tipo_tarjeta
CREATE TABLE IF NOT EXISTS `tipo_tarjeta` (
  `id_tipo_tarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(50) NOT NULL,
  PRIMARY KEY (`id_tipo_tarjeta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Débito, crédito, etc.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla coderecommerce.tipo_transaccion
CREATE TABLE IF NOT EXISTS `tipo_transaccion` (
  `id_tipo_transaccion` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(50) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_transaccion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='Genera el estado de vendido, comprado.';

-- La exportación de datos fue deseleccionada.

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para vista coderecommerce.usuario_info
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `usuario_info` (
	`Usuario` CHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Nombre Usuario` CHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`apellido` CHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`dni` CHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
	`permiso` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='Información del perfil de usuario.';

-- La exportación de datos fue deseleccionada.

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento coderecommerce.vehiculo_letra
DELIMITER //
CREATE PROCEDURE `vehiculo_letra`(IN letra CHAR, OUT cantidad int)
BEGIN
		SELECT COUNT(*) INTO cantidad
		FROM vehiculo v
		WHERE v.patente LIKE concat(letra,'%');
	END//
DELIMITER ;

-- Volcando estructura para tabla coderecommerce.vehiculo_valor_anterior
CREATE TABLE IF NOT EXISTS `vehiculo_valor_anterior` (
  `id_vv_anterior` int(11) NOT NULL AUTO_INCREMENT,
  `id_vehiculo` int(11) NOT NULL,
  `valor` decimal(20,6) DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_vv_anterior`),
  KEY `FK_vehiculo_valor_anterior_transaccion_vehiculo` (`id_vehiculo`),
  CONSTRAINT `FK_vehiculo_valor_anterior_transaccion_vehiculo` FOREIGN KEY (`id_vehiculo`) REFERENCES `transaccion_vehiculo` (`id_vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='Se almacenan los valores anteriores de los vehículos en caso de un update.';

-- La exportación de datos fue deseleccionada.

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
-- if NEW.id_tipo_transaccion = 3 {
FOR EACH ROW BEGIN 
	INSERT INTO vehiculo_valor_anterior (id_vehiculo, valor)
			 VALUE (old.id_vehiculo, OLD.valor);			 
-- }
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
