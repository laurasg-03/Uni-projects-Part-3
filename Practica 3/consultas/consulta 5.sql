--5
--Obtén un listado de qué indicadores fueron medidos en todas las regiones en un
--mismo año. Además, indica para esos indicadores el número de años en los que
--fueron medidos en todas las regiones (por ejemplo, si el indicador HLTHRES_1
--fue medido en todas las regiones en 1990, 1992, 1999 y 2004, en el listado debería
--aparecer HLTHRES_1 y un 4 en el campo de años.
DROP VIEW IF EXISTS indicadores_año;

CREATE VIEW indicadores_año AS		--saca la lista de los indicadores y los años en los que
SELECT códigoI,año					--fueron medidos en todas las regiones (having)
FROM valor_anual
GROUP BY códigoI,año
HAVING count(distinct códigoR)=(SELECT count(códigoR)
								FROM región);

SELECT códigoI AS indicador, count(año) AS años
FROM indicadores_año				--Cuenta los años
GROUP BY códigoI;