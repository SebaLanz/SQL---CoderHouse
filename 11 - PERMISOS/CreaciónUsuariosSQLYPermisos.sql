
-- Creo usuarios pruebaSIU (SELECT, INSERT Y UPDATE) y pruebaSelect (Select).
-- Les asigno una clave '' vacía.
create user 'pruebaSIU' identified BY '';
create user 'pruebaSelect' identified BY '';

-- Puedo visualizar todos los permisos de los dos usuarios.
SELECT * FROM mysql.user WHERE user = 'pruebaSelect'; -- se el nombre del usuario.alter
SELECT * FROM mysql.user WHERE user = 'pruebaSIU'; -- se el nombre del usuario.alter

-- Asigno permiso de Select, Insert y Update a 'pruebaSIU'
GRANT SELECT, UPDATE, INSERT ON *.* TO 'pruebaSIU'; 
-- Asigno permiso de Select a 'pruebaSelect'
GRANT SELECT ON *.* TO 'pruebaSelect';

-- Hago select para ver los usuarios sobre la bdd y verificar permisos.
-- Y = tiene permiso, N = no tiene permiso
use mysql;
select * from user;