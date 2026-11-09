CREATE DATABASE NegocioVentas;
USE NegocioVentas;
CREATE TABLE Clientes (
ID_Cliente INT,
nombre_cliente NVARCHAR(50),
email NVARCHAR(100),
fecha_nacimiento DATE
);
CREATE TABLE Productos (
ID_Producto INT,
nombre_producto NVARCHAR(50),
precio DECIMAL(10,2),
stock NVARCHAR(20)
);
