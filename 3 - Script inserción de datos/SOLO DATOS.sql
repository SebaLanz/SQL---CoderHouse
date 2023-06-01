/*SE GENERÓ UN BACKUP DE LOS DATOS EXISTENTES EN LA BDD.
TABLAS-> categoria_vehiculo 
	 inmueble
	 marca	
	 moneda
	 pais
	 perfil_permiso
	 registro_usuario
	 tarjeta
	 tarjeta_nombre
	 tipo_tarjeta
	 tipo_transaccion
	 transaccion_vehiculo
	 id_perfil_permiso       
	 usuario_perfil
	 vehiculo
	 vehiculo_valor_anterior
*/

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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

-- Volcando datos para la tabla coderecommerce.compras_vehiculos: 0 rows
DELETE FROM `compras_vehiculos`;
/*!40000 ALTER TABLE `compras_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras_vehiculos` ENABLE KEYS */;

-- Volcando datos para la tabla coderecommerce.inmueble: ~3 rows (aproximadamente)
DELETE FROM `inmueble`;
INSERT INTO `inmueble` (`id_inmueble`, `calle`, `altura`, `localidad`, `cantidad_banio`, `cantidad_dormitorio`, `metros_cuadrados`, `observaciones`, `id_tipo_inmueble`, `id_pais`) VALUES
	(1, 'Tab', 234, 'Lanús   \r\n', 3, 2, 50, NULL, 1, 1),
	(3, '2 de mayo', 100, 'lanus', 3, 5, 80, '', 1, 1),
	(4, 'pavo', 4500, 'avellaneda', 1, 2, 40, 'depto', 5, 1);

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

-- Volcando datos para la tabla coderecommerce.moneda: ~8 rows (aproximadamente)
DELETE FROM `moneda`;
INSERT INTO `moneda` (`id_moneda`, `tipo_moneda`) VALUES
	(2, 'tipo_moneda'),
	(10, 'Peso'),
	(11, 'Dólar'),
	(12, 'Euro'),
	(13, 'Libra esterlina'),
	(14, 'franco suizo'),
	(15, 'Yuan'),
	(16, 'Dólar Canadiense');

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

-- Volcando datos para la tabla coderecommerce.perfil_permiso: ~3 rows (aproximadamente)
DELETE FROM `perfil_permiso`;
INSERT INTO `perfil_permiso` (`id_perfil_permiso`, `permiso`) VALUES
	(1, 'ADMINISTRADOR'),
	(2, 'INVITADO'),
	(3, 'USUARIO');

-- Volcando datos para la tabla coderecommerce.registro_usuario: ~0 rows (aproximadamente)
DELETE FROM `registro_usuario`;
INSERT INTO `registro_usuario` (`id_registro_usuario`, `usuario`, `fecha`) VALUES
	(1, 'usr2', '2023-05-16 12:17:24');

-- Volcando datos para la tabla coderecommerce.tarjeta: ~0 rows (aproximadamente)
DELETE FROM `tarjeta`;
INSERT INTO `tarjeta` (`id_tarjeta`, `nro_tarjeta`, `nombre_titular`, `apellido_titular`, `dni_titular`, `nro_codigo`, `id_tipo_tarjeta`, `id_usuario_perfil`, `id_tarjeta_nombre`) VALUES
	(3, '111 222 333', 'Sebastian', 'lanzetti', 37361177, 123, 2, 1, 1);

-- Volcando datos para la tabla coderecommerce.tarjeta_nombre: ~3 rows (aproximadamente)
DELETE FROM `tarjeta_nombre`;
INSERT INTO `tarjeta_nombre` (`id_tarjeta_nom`, `nombre`) VALUES
	(1, 'VISA'),
	(2, 'MASTER CARD'),
	(3, 'NACIÓN');

-- Volcando datos para la tabla coderecommerce.tipo_inmueble: ~0 rows (aproximadamente)
DELETE FROM `tipo_inmueble`;

-- Volcando datos para la tabla coderecommerce.tipo_tarjeta: ~2 rows (aproximadamente)
DELETE FROM `tipo_tarjeta`;
INSERT INTO `tipo_tarjeta` (`id_tipo_tarjeta`, `tipo`) VALUES
	(1, 'Crédito'),
	(2, 'Débito');

-- Volcando datos para la tabla coderecommerce.tipo_transaccion: ~3 rows (aproximadamente)
DELETE FROM `tipo_transaccion`;
INSERT INTO `tipo_transaccion` (`id_tipo_transaccion`, `tipo`) VALUES
	(1, 'Comprado\r\n'),
	(2, 'En Venta'),
	(3, 'Vendido');

-- Volcando datos para la tabla coderecommerce.transaccion_inmueble: ~0 rows (aproximadamente)
DELETE FROM `transaccion_inmueble`;

-- Volcando datos para la tabla coderecommerce.transaccion_vehiculo: ~3 rows (aproximadamente)
DELETE FROM `transaccion_vehiculo`;
INSERT INTO `transaccion_vehiculo` (`id_transaccion_vehiculo`, `id_tipo_transaccion`, `id_usuario`, `id_vehiculo`, `id_moneda`, `valor`, `fecha`) VALUES
	(3, 2, 2, 3, 2, 58000, '2023-03-25'),
	(6, 3, 2, 3, 1, 57000, '2023-05-16'),
	(11, 3, 2, 3, 2, 150000, '2023-05-16');

-- Volcando datos para la tabla coderecommerce.usuario: ~3 rows (aproximadamente)
DELETE FROM `usuario`;
INSERT INTO `usuario` (`id_usuario`, `usuario`, `clave`, `email`, `estado`, `img_usuario`, `id_perfil_permiso`) VALUES
	(2, 'admin', '123', 'admin@gmail.com', b'1', '', 1),
	(9, 'usuario', '123', 'usuario@usr.com', b'1', '', 3),
	(20, 'usr2', '123', 'asdsa@asdsad.com', b'1', '', 2);

-- Volcando datos para la tabla coderecommerce.usuario_perfil: ~0 rows (aproximadamente)
DELETE FROM `usuario_perfil`;
INSERT INTO `usuario_perfil` (`id_usuario_perfil`, `nombre`, `apellido`, `dni`, `calle`, `numero_calle`, `localidad`, `telefono`, `id_usuario`, `id_pais`) VALUES
	(1, 'Sebastián', 'Lanzetti', '37361177', 'tab', '3823', 'lanús', '123123123', 2, 1);

-- Volcando datos para la tabla coderecommerce.vehiculo: ~0 rows (aproximadamente)
DELETE FROM `vehiculo`;
INSERT INTO `vehiculo` (`id_vehiculo`, `patente`, `id_categoria_vehiculo`, `id_marca`) VALUES
	(3, 'clg-235', 1, 1);

-- Volcando datos para la tabla coderecommerce.vehiculo_valor_anterior: ~6 rows (aproximadamente)
DELETE FROM `vehiculo_valor_anterior`;
INSERT INTO `vehiculo_valor_anterior` (`id_vv_anterior`, `id_vehiculo`, `valor`, `fecha`) VALUES
	(1, 3, 150000.000000, '2023-05-16 13:10:04'),
	(2, 3, 145000.000000, '2023-05-16 13:12:10'),
	(3, 3, 50000.000000, '2023-05-30 14:25:50'),
	(4, 3, 50000.000000, '2023-05-30 14:26:58'),
	(5, 3, 55000.000000, '2023-05-30 14:28:19'),
	(6, 3, 145000.000000, '2023-05-30 14:29:47');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
