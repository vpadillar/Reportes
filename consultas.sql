CREATE TABLE "reporte_reporteproducto" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nombre" varchar(100) NULL, "inicio" date NOT NULL, "fin" date NOT NULL, "tipo" integer NOT NULL)
select  * from base_consultas
insert into mes (id,nombre) values (1,"Enero");
insert into mes (id,nombre) values (2,"Febrero");
insert into mes (id,nombre) values (3,"Marzo");
insert into mes (id,nombre) values (4,"Abril");
insert into mes (id,nombre) values (5,"Mayo");
insert into mes (id,nombre) values (6,"Junio");
insert into mes (id,nombre) values (7,"Julio");
insert into mes (id,nombre) values (8,"Agosto");
insert into mes (id,nombre) values (9,"Septiembre");
insert into mes (id,nombre) values (10,"Octubre");
insert into mes (id,nombre) values (11,"Noviembre");
insert into mes (id,nombre) values (12,"Diciembre");
select * from years
select * from mes
select * from base_consultas

select * from base_consultas as b 

select * from (select pro.id,pro.name,sum(case when b.producto_id is not null then 1 else 0 end)  as vendidos,sum(case when b.producto_precio is not null and b.cantidad is not null then (b.cantidad*b.producto_precio) else 0 end) as total from venta_product as pro 
	left join base_consultas as b on 
	(pro.id=b.producto_id and b.fecha is not null and b.cancelado=0 and b.pagado=1 and b.fecha_factura is not null)
	group by pro.id,pro.name) as venta order by venta.total desc

	select *  from venta_product as pro 
	left join base_consultas as b on 
	(pro.id=b.producto_id and b.fecha is not null and b.cancelado=0 and b.pagado=1 and b.fecha_factura is not null)
	group by pro.id,pro.name

	select cast(strftime('%m',fecha) as int) as mes  ,cast(strftime('%Y',fecha) as int) as year_  from base_consultas
/**********************************************************************/
create view informes_total as select * from (select * from years cross join mes order by year_ asc, id asc) as fecha 
                 cross join venta_product as pro 
		 left join base_consultas as b on 
	         (pro.id=b.producto_id and b.fecha is not null and b.cancelado=0 and b.pagado=1 and b.fecha_factura is not null
		     and cast(strftime('%m',b.fecha) as int)=fecha.id and cast(strftime('%Y',b.fecha) as int)=fecha.year_) 
		     

delete from mes where id=1
select * from mes
select strftime('%W', now())
SELECT strftime('%W','now');
create view years as select 2016+a from
(select 0 as a union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9);
(select 0 as b union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9),
(select 0 as c union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9),
(select 0 as d union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9),
(select 0 as e union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9);

select categoria.id as categoria_id,categoria.name as categoria_nombre,producto.id as producto_id,
		producto.name as producto_nombre, producto.price as producto_precio, item_orden.count as cantidad,
		orden."date" as fecha, orden.canceled as cancelado,orden.paid as pagado,factura."date" as fecha_factura		
		from venta_category as categoria 
	        left join venta_product as producto on (producto.category_id=categoria.id)
		left join venta_itemorder as item_orden on (item_orden.product_id=producto.id)
		left join venta_order_products as orden_producto on (orden_producto.itemorder_id=item_orden.id)
		left join venta_order as orden on(orden.id=orden_producto.order_id)
		left join venta_bill as factura on (factura.id = orden.bill_id)
		
select * from dia
insert into dia (id) values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31)


select * from years cross join (select mes.id as id_mes,mes.nombre as nom_mes,dia.id as dia_mes from mes cross join dia order by mes.id asc, dia.id asc) as fer order by years.year_ asc,fer.id_mes asc,fer.dia_mes asc
select fecha,cast(strftime('%d',fecha) as int) from base_consultas
select * from (select * from years cross join 
						(select mes.id as id_mes,mes.nombre as nom_mes,dia.id as dia_mes 
							       from mes cross join dia order by mes.id asc, dia.id asc) as fer 
										   order by years.year_ asc,fer.id_mes asc,fer.dia_mes asc) as fecha 
                 cross join venta_product as pro 
		 left join base_consultas as b on 
	         (pro.id=b.producto_id and b.fecha is not null and b.cancelado=0 and b.pagado=1 and b.fecha_factura is not null
		     and cast(strftime('%m',b.fecha) as int)=fecha.id_mes and cast(strftime('%Y',b.fecha) as int)=fecha.year_ and cast(strftime('%d',b.fecha) as int)=fecha.dia_mes)
select date('2016-07-27') from base_consultas where cast(fecha as date) <= (cast('2016-07-27' as date))
select fecha from base_consultas where date(fecha) < date('2016-07-27' )
CREATE VIEW informes_total as select * from (select years.year_,fer.id_mes,fer.dia_mes,fer.nom_mes, date(years.year_||'-'||case when fer.id_mes<10 then '0'||fer.id_mes else fer.id_mes end||'-'||case when fer.dia_mes<10 then '0'||fer.dia_mes else fer.dia_mes end)  as fecha_ from years cross join 
						(select mes.id as id_mes,mes.nombre as nom_mes,dia.id as dia_mes
							       from mes cross join dia order by mes.id asc, dia.id asc) as fer  
										   order by years.year_ asc,fer.id_mes asc,fer.dia_mes asc) as fecha 
                 cross join venta_product as pro 
		 inner join base_consultas as b on 
	         (pro.id=b.producto_id and b.fecha is not null and b.cancelado=0 and b.pagado=1 and b.fecha_factura is not null
		     and cast(strftime('%m',b.fecha) as int)=fecha.id_mes and cast(strftime('%Y',b.fecha) as int)=fecha.year_ and cast(strftime('%d',b.fecha) as int)=fecha.dia_mes)
		     select 1
select * from informes_total
/*******************************************************************/
		     select * from (select year_,id_mes,nom_mes,name,count(name)  as total,
		     sum(case when cantidad is null then 0 else cantidad end) as articulos,
		     sum(case when cantidad is not null and producto_precio is not null then producto_precio*cantidad else 0 end) as venta 
		     from informes_total   group by year_,id_mes,nom_mes,name) as t 
		       select * from informes_total   group by year_,id_mes,nom_mes,name
select * from reporte_reporteproducto
		       /*************MES*****************************/
		select * from (select year_,id_mes,nom_mes,name,count(name)  as total,
		     sum(case when cantidad is null then 0 else cantidad end) as articulos,
		     sum(case when cantidad is not null and producto_precio is not null then producto_precio*cantidad else 0 end) as venta 
		     from informes_total   where date(fecha)>= date('2016-06-01')  and date(fecha)<= date('2016-11-01')   group by year_,id_mes,nom_mes,name) as t
		     /**************Año**********************************/
		     select * from (select year_,id_mes,nom_mes,name,count(name)  as total,
		     sum(case when cantidad is null then 0 else cantidad end) as articulos,
		     sum(case when cantidad is not null and producto_precio is not null then producto_precio*cantidad else 0 end) as venta 
		     from informes_total   where date(fecha)>= date('2016-06-01')  and date(fecha)<= date('2016-11-01')   group by year_) as t
		     /******* SEMANA ****************************/
		      select * from (select  year_,id_mes,nom_mes,name,count(name)  as total,
		     sum(case when cantidad is null then 0 else cantidad end) as articulos,
		     sum(case when cantidad is not null and producto_precio is not null then producto_precio*cantidad else 0 end) as venta,producto_precio,strftime('%W',fecha) as semana,date(fecha)
		     from informes_total   where date(fecha)>= date('2016-06-01')  and date(fecha)<= date('2016-11-01')   group by year_,id_mes,nom_mes,fecha  ,name) as t
		    select * from  informes_total
		     
		     /***************Del dia ******************/
		     select * from (select  year_,id_mes,nom_mes,name,count(name)  as total,
		     sum(case when cantidad is null then 0 else cantidad end) as articulos,
		     sum(case when cantidad is not null and producto_precio is not null then producto_precio*cantidad else 0 end) as venta,producto_precio,strftime('%W',fecha) as semana,date(fecha)
		     from informes_total   where date(fecha)>= date('2016-07-01')  and date(fecha)<= date('2016-11-01')   group by year_,id_mes,nom_mes,fecha  ,name) as t
		     
		     select * from (select year_,id_mes,nom_mes,name,count(name)  as total,sum(case when cantidad is null then 0 else cantidad end) as articulos,sum(case when cantidad is not null and producto_precio is not null then producto_precio*cantidad else 0 end) as venta from informes_total   where date(fecha)>= date('2016-06-01')  and date(fecha)<= date('2016-11-01')   group by year_,id_mes,nom_mes,name) as t
		     
		     
		     select * from venta_order