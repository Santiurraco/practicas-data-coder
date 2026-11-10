CREATE TABLE inventario (
  id_producto INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
  nombre_producto NVARCHAR(100), -- elegido NVARCHAR porque permite describir el nombre del producto
  categoria NVARCHAR(50),
  precio_unitario DECIMAL(10,2), -- elegido DECIMAL porque necesitamos precision de dinero con su precio exacto en dolares
  stock_actual INT,
  stock_minimo INT,
  fecha_ingreso DATE, -- elegido DATE porque es el ideal utilizado para registrar una fecha con dia, mes y año
  activo TINYINT, 1=disponible, 0=discontinuado
  );

SELECT * FROM inventario

INSERT INTO inventario
(nombre_producto, categoria, precio_unitario, stock_actual, stock_minimo, fecha_ingreso, activo, descripcion)
VALUES
('Laptop Pro15', 'Computacion', 1200.00, 15, 3, 2024-01-10, 1),
('Mouse inalambrico', 'Accesorios', 28.00, 80, 10, 2024-01-10, 1),
('Monitor 4K 27"', 'Computacion', 450.00, 12, 2, 2024-01-15, 1),
('Teclado mecanico', 'Accesorios', 95.00, 40, 5, 2024-01-15),
('Laptop basic 14', 'Computacion', 650.00, 20.00, 3, 2024-02-01, 1),
('Auriculares BT Pro', 'Audio', 120.00, 35, 5, 2024-02-01, 1),
('Hub USB-C7 puertos', 'Accesorios', 45.00, 60, 10, 2024-02-10, 1),
('Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, 2024-02-10, 1);

UPDATE inventario
SET stock_actual = stock_actual - 3
WHERE id_producto = 1;
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;
SET stock_actual = stock_actual - 5
WHERE id_producto = 6;

UPDATE inventario
SET activo = 0
WHERE id_producto = 8;

SELECT * FROM inventario

  
  
