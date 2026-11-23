-- PRE_ENTREGA 4 Proyecto RetailPro
-- Consultas SQL de Negocio
-- Titulo: Extrayendo métricas clave con SQL
-- Autor: Santiago Urraco

USE Ventas_Tech_DB
GO

-- Consulta 1: Resumen ejecutivo mensual
SELECT 
COUNT(*) AS cantidad_pedidos,
SUM(cantidad * precio_unitario) AS total_facturado,
AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);

-- Consulta 2: Ranking de productos
SELECT TOP 5
id_producto,
SUM(cantidad) AS unidades_vendidas,
SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;

-- Consulta 3: Clientes recurrentes
SELECT
id_cliente,
COUNT(*) AS cantidad_pedidos,
SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;

-- Consulta 4: Productos por encima/debajo del promedio
WITH FacturacionPorProducto AS (
SELECT 
id_producto,
SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
)
SELECT 
id_producto,
total_facturado,
CASE 
WHEN total_facturado > (SELECT AVG(total_facturado) FROM FacturacionPorProducto) THEN 'Por encima'
ELSE 'Por debajo'
END AS rendimiento_vs_promedio
FROM FacturacionPorProducto
ORDER BY total_facturado DESC;

-- SECCION COMENTARIOS - Bloque de cierre
-- El primer hallazgo fue en la consulta 1, en donde todas las operaciones se realizaron en un mismo mes del 2024, que si bien tiene relación con los datos cargados en M3 es un punto a tener en cuenta cuando miramos el análisis final.
-- Otro hallazgo surge de la consulta 3, en donde queda reflejado que los clientes id_1 y id_5 concentran el 74% de los ingresos por ventas/total_facturado.
-- A partir de la última consulta queda marcado que la mayoría de los productos se encuentran por debajo del promedio facturado, y ello se refleja en que el producto 1 concentra la mayor parte del importe facturado por su precio unitario más alto. 
