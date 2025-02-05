--2
--Se desea obtener los datos para en el futuro poder realizar un gráfico donde se
--muestre el valor a lo largo de los años del indicador que expresa el número de
--hospitales por cada 100.000 habitantes (Hospitals per 100 000 population) en
--España.¿Estos valores nos indican si cada vez hay más o menos hospitales en
--España?

SELECT año, valor AS Hospitals_per_100000_population
FROM valor_anual
WHERE códigoI = (SELECT códigoI FROM indicador WHERE descripciónI='Hospitals, per 100 000 population') 
			AND (SELECT códigoPa FROM país WHERE nombre_completoP = 'Spain' ) = códigoR						 		