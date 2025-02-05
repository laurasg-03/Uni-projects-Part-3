--3
--Obtén listado que muestre cuántos indicadores se aplican a cada nivel profesional--
SELECT códigoP AS nivel_profesional, count(distinct códigoI) AS numero_indicadores
FROM valor_anual
GROUP BY códigoP							 		