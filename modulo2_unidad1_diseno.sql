CREATE TABLE clientes (
  id_cliente INT, -- se elige INT porque el id_cliente representa un numero entero
  nombre NVARCHAR(100), -- NVARCHAR porque permite describir los nombres de clientes almacenarlos en ese tipo
  perfil_bio NVARCHAR(MAX), -- MAX porque solicita longitud para una biografia o notas
  fecha_registro DATE -- las fechas las registramos con DATE
  );
CREATE TABLE productos (
  id_producto INT, -- se elige INT porque el id_cliente representa un numero entero
  descripcion NVARCHAR(255), -- NVARCHAR(255) porque indica un texto hasta esa longitud
  precio DECIMAL(10,2), -- la eleccion DECIMAL(10,2) es la que utilizamos para dinero ya que permite la precision monetaria
  esta_activo BIT -- porque representa mejor si hay stock o no
  );
