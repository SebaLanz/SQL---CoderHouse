-- Hago select para ver los usuarios sobre la bdd
use mysql;
select * from user;
/* N = No tiene permiso
   Y = Tiene permiso. */
-- Creo un usuario 'prueba', con 'identified by' le asigno una clave.
create user 'prueba@localhost' identified by '';

-- Cambiar clave
alter user 'prueba@localhost' identified by '123';

-- Renombrar usuario.
Rename user 'prueba@localhost' to 'prueba';

-- Eliminar usuario.
drop user 'prueba';

-- Selecciono un usuario en particular 
SELECT * FROM mysql.user WHERE user LIKE 'prueba%'; -- no se bien el nombre de usr
SELECT * FROM mysql.user WHERE user = 'prueba'; -- se el nombre del usuario.alter

-- Asignación de permisos. Sentencia GRANT.
-- Podemos asignar permisos DML (data manipulation language) select, update, insert, delete.alter

-- Visualizamos permisos.
show grants for 'prueba';

-- Otorgamos todos los permisos.
grant all on *.* to 'prueba';

-- Otorgar todos los permisos a un usuario sobre una tabla en especifica de una bdd especifica.alter

GRANT ALL ON baseDeDatos.tabla TO ‘usuario’;

-- Otorgar permisos selectivos a un usuario sobre una tabla y bdd especificas.
GRANT SELECT, UPDATE ON baseDeDatos.tabla TO 'usuario';
/*Otorgo a prueba permiso de select y update sobre todas las bdd*/
GRANT SELECT, UPDATE ON *.* TO 'prueba'; 

-- Otorgar permiso sobre una columna (el ppt no es muy claro).

GRANT UPDATE, SELECT (columna) 
	ON baseDeDatos.tabla 
	TO 'prueba';

-- Sentencia REVOKE (sacar-revocar permisos).
-- en esta sentencia 'muestra error el from' pero funciona.
revoke all on *.* from 'prueba';
-- Revoco el permiso update sobre todas las bdd.
revoke update on *.* from 'prueba';
-- Si quisiera revocar un permiso 'update' sobre una bdd y tabla en especifica sobre un usuario.
revoke update on baseDeDatos.tabla TO 'usuario';


