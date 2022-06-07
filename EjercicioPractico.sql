DROP DATABASE if EXISTS ejercicioResuelto;
CREATE DATABASE ejercicioResuelto;

USE ejercicioResuelto;

##la sucursales

CREATE TABLE sucursales(
id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
nombre_sucursal VARCHAR(50) NOT NULL,
direccion_sucursal VARCHAR(150) NOT NULL);

## tabla proveedores

CREATE TABLE proveedores(
id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
nombre_proveedor VARCHAR(50) NOT NULL
);

CREATE TABLE clientes(
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre_cliente VARCHAR(50) NOT NULL,
edad_cliente INT NOT NULL
);

CREATE TABLE productos(
id_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre_producto VARCHAR(50) NOT NULL,
precio_producto FLOAT(2) NOT NULL,
id_sucursal INT,
CONSTRAINT fk_sucursal 
FOREIGN KEY (id_sucursal)
REFERENCES sucursales(id_sucursal),
id_proveedor INT,
CONSTRAINT fk_proveedores
FOREIGN KEY (id_proveedor)
REFERENCES proveedores(id_proveedor)
);

CREATE TABLE compras (
id_compra INT AUTO_INCREMENT PRIMARY KEY,
id_producto INT,
CONSTRAINT fk_productos 
FOREIGN KEY (id_producto)
REFERENCES productos(id_producto),
id_cliente INT, 
CONSTRAINT fk_clientes
FOREIGN KEY (id_cliente)
REFERENCES clientes(id_cliente)
);

ALTER TABLE compras ADD COLUMN fecha_compra DATE;

##ponderacion del 50%

##insert en clientes

SELECT * FROM clientes;

INSERT INTO clientes(nombre_cliente, edad_cliente) VALUES ("Wilfredo", 31);
INSERT INTO clientes(nombre_cliente, edad_cliente) VALUES ("Ricardo", 32);
INSERT INTO clientes(nombre_cliente, edad_cliente) VALUES ("Dylan", 25);
INSERT INTO clientes(nombre_cliente, edad_cliente) VALUES ("Eduardo", 37);
INSERT INTO clientes(nombre_cliente, edad_cliente) VALUES ("Daniel", 40);

##para la tabla proveedores
SELECT * FROM proveedores;

INSERT INTO proveedores(nombre_proveedor) VALUES ("Proveedor 1");
INSERT INTO proveedores(nombre_proveedor) VALUES ("Proveedor 2");
INSERT INTO proveedores(nombre_proveedor) VALUES ("Proveedor 3");
INSERT INTO proveedores(nombre_proveedor) VALUES ("Proveedor 4");
INSERT INTO proveedores(nombre_proveedor) VALUES ("Proveedor 5");
INSERT INTO proveedores(nombre_proveedor) VALUES ("Proveedor 6");

DELETE FROM proveedores WHERE id_proveedor =4;

SELECT * FROM sucursales;

INSERT INTO sucursales(nombre_sucursal, direccion_sucursal) VALUES ("Sucursal 1", "Direccion 1");
INSERT INTO sucursales(nombre_sucursal, direccion_sucursal) VALUES ("Sucursal 2", "Direccion 2");
INSERT INTO sucursales(nombre_sucursal, direccion_sucursal) VALUES ("Sucursal 3", "Direccion 3");
INSERT INTO sucursales(nombre_sucursal, direccion_sucursal) VALUES ("Sucursal 4", "Direccion 4");
INSERT INTO sucursales(nombre_sucursal, direccion_sucursal) VALUES ("Sucursal 5", "Direccion 5");
INSERT INTO sucursales(nombre_sucursal, direccion_sucursal) VALUES ("Sucursal 6", "Direccion 6");

UPDATE sucursales 
SET direccion_sucursal ="Avenida Aguilares 218 San Salvador CP" 
WHERE id_sucursal <=2;


SELECT * FROM productos;

INSERT INTO productos(nombre_producto, precio_producto, id_sucursal, id_proveedor)
VALUES("Producto 1", 10, 1,1);
INSERT INTO productos(nombre_producto, precio_producto, id_sucursal, id_proveedor)
VALUES("Producto 2", 20, 2,2);
INSERT INTO productos(nombre_producto, precio_producto, id_sucursal, id_proveedor)
VALUES("Producto 3", 122, 3,5);
INSERT INTO productos(nombre_producto, precio_producto, id_sucursal, id_proveedor)
VALUES("Producto 4", 14, 3,5);
INSERT INTO productos(nombre_producto, precio_producto, id_sucursal, id_proveedor)
VALUES("Producto 5", 15, 2,1);

SELECT * FROM compras;
SELECT * FROM productos;

INSERT INTO compras(id_producto, id_cliente, fecha_compra)
VALUES (1,1, "2022/12/01");

INSERT INTO compras(id_producto, id_cliente, fecha_compra)
VALUES (2,2, "2022/12/20");

INSERT INTO compras(id_producto, id_cliente, fecha_compra)
VALUES (1,1, "2022/12/08");

INSERT INTO compras(id_producto, id_cliente, fecha_compra)
VALUES (1,1, "2022/11/01");

INSERT INTO compras(id_producto, id_cliente, fecha_compra)
VALUES (4,1, "2022/10/01");

INSERT INTO compras(id_producto, id_cliente, fecha_compra)
VALUES (1,3, "2022/12/25");


SELECT * FROM compras 
WHERE fecha_compra BETWEEN "2022/12/01" AND "2022/12/20"
ORDER BY fecha_compra;


SELECT nombre_producto, nombre_proveedor, nombre_sucursal
FROM productos 
INNER JOIN sucursales ON sucursales.id_sucursal = productos.id_sucursal
INNER JOIN proveedores ON proveedores.id_proveedor= productos.id_proveedor;


SELECT * FROM clientes 
WHERE edad_cliente >30;

SELECT * FROM clientes 
WHERE edad_cliente <=30;




