DROP DATABASE IF EXISTS estadisticas;
CREATE DATABASE estadisticas;
USE estadisticas;

CREATE TABLE productos(
id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_producto VARCHAR(100) NOT NULL, 
precio_producto FLOAT(2)
);
SELECT * FROM productos;
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto 1", 1.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto 2", 1.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto 3", 10.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto 4", 10.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto 5", 10.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto 6", 5.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto 7", 5.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto 8", 7.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto 9", 7.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto 10", 1.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto 11", 0.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto 12", 0.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto 13", 5.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto 14", 5.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto Max", 50.99);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto Min", 0.25);
INSERT INTO productos(nombre_producto, precio_producto) VALUES("Producto Min2", 0.25);

CREATE TABLE compras(
cliente VARCHAR(50), 
total FLOAT(2), 
id_producto INT, 
CONSTRAINT FK_productos 
FOREIGN KEY (id_producto)
REFERENCES productos(id_producto)
);


INSERT INTO compras VALUES ("Wilfredo", 10, 1);
INSERT INTO compras VALUES ("Wilfredo", 10, 1);
INSERT INTO compras VALUES ("Wilfredo", 10, 1);
INSERT INTO compras VALUES ("Wilfredo", 10, 1);
INSERT INTO compras VALUES ("Wilfredo", 10, 1);

INSERT INTO compras VALUES ("Daniel", 50, 4);
INSERT INTO compras VALUES ("Daniel", 5, 3);
INSERT INTO compras VALUES ("Daniel", 5, 2);

##Ejemplo de count
##Si deseamos obtener la cantidad de 
##productos que hay segun un precio

SELECT * FROM productos;

SELECT COUNT(id_producto) AS "Cantidad Producto", 
precio_producto FROM productos
GROUP BY precio_producto;


## Ejemplo de AVG
##si deseamos obtener el precio promedio de los productos
SELECT AVG(precio_producto) AS "Precio Promedio" 
FROM productos;

CREATE TABLE alumnos(
nombre VARCHAR(25),
nota FLOAT(2)
);

INSERT INTO alumnos VALUES ("Adriana", 4);
INSERT INTO alumnos VALUES ("Eduardo", 6);
INSERT INTO alumnos VALUES ("Carlos", 5);
INSERT INTO alumnos VALUES ("Dylan", 1);
SELECT * FROM alumnos;

SELECT AVG(nota), nombre FROM alumnos 
GROUP BY nombre;


SELECT * FROM compras;

INSERT INTO compras VALUES ("Sosa", 15, 5);
INSERT INTO compras VALUES ("Sosa", 15, 5);
INSERT INTO compras VALUES ("Carlos", 5, 5);
INSERT INTO compras VALUES ("Carlos", 1, 5);
##Ejemplo de sum
##si deseamos sumar el total de todos los productos en compras
SELECT SUM(total) AS "Total gastado" , 
cliente  FROM compras GROUP BY cliente;

##Ejemplo de Min y MAX
## mostramos el precio maximo y el precio minimo
SELECT MIN(precio_producto) AS "Precio Minimo" , nombre_producto
 FROM productos;
 
SELECT MAX(precio_producto) AS "Producto mas Caro" ,
 nombre_producto FROM productos;

SELECT * FROM productos;



SELECT * FROM compras;
SELECT * FROM productos;

SELECT cliente AS "Cliente prueba",
nombre_producto AS "Nombre del producto"
FROM compras AS c
INNER JOIN productos AS p ON
p.id_producto = c.id_producto; 
