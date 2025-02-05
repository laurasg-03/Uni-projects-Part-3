--9
--Obtén un listado de los indicadores que tienen al menos una medición para todos los países. 
--Para este listado se desea mostrar código del indicador y su descripción. 
--(Importante hacer esta consulta utilizando NOT EXISTS).

--Indicadores para los que no hay país de los que no tengan ninguna medición
SELECT códigoI AS indicador, descripciónI AS descripción
FROM indicador
WHERE NOT EXISTS (SELECT * 
				  FROM país		--país, no región
	              WHERE NOT EXISTS(SELECT *
		                           FROM valor_anual
		                           WHERE país.códigoPa=valor_anual.códigoR 
								        AND indicador.códigoI=valor_anual.códigoI));