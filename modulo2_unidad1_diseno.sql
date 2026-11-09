CREATE TABLE clientes (
  id_cliente INT,
  nombre NVARCHAR(100),
  perfil_bio NVARCHAR(500),
  fecha_registro DATE
  );
CREATE TABLE productos (
  id_producto INT,
  descripcion NVARCHAR(255),
  precio DECIMAL(10,2),
  esta_activo BIT
  );
