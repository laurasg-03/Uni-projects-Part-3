--6
--Indica en qué país se han realizado el mayor número de mediciones desde el 2000
--(inclusive). ¿Y en qué agrupación de países?
DROP VIEW IF EXISTS medicion_region;
CREATE VIEW medicion_region AS

SELECT códigoR, count(valor) AS num_mediciones
FROM valor_anual 
WHERE año>='2000'  --quitar los que no tengan mediciones y a partir del 2000
GROUP BY códigoR;

SELECT códigoR, num_mediciones		--para países
FROM medicion_region
WHERE num_mediciones=(SELECT MAX(num_mediciones)
					 FROM medicion_region NATURAL JOIN país
					 WHERE códigoPa=códigoR);
					  
SELECT códigoR, num_mediciones			--para agrupación de países
FROM medicion_region
WHERE num_mediciones=(SELECT MAX(num_mediciones)
					 FROM medicion_region NATURAL JOIN agrupación_países
					 WHERE códigoG=códigoR);