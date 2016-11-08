CREATE VIEW base_consultas as select categoria.id as categoria_id,categoria.name as categoria_nombre,producto.id as producto_id,
		producto.name as producto_nombre, producto.price as producto_precio, item_orden.count as cantidad,
		orden."date" as fecha, orden.canceled as cancelado,orden.paid as pagado,factura."date" as fecha_factura
		from venta_category as categoria
	        left join venta_product as producto on (producto.category_id=categoria.id)
		left join venta_itemorder as item_orden on (item_orden.product_id=producto.id)
		left join venta_order_products as orden_producto on (orden_producto.itemorder_id=item_orden.id)
		left join venta_order as orden on(orden.id=orden_producto.order_id)
		left join venta_bill as factura on (factura.id = orden.bill_id)
