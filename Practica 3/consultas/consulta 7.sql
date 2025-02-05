--7 
--El indicador HLTHRES_243 mide el número de grupos especialistas en cirugía
--por cada 100 000 habitantes. Queremos saber cómo ha ido cambiando el ratio de
--especialistas en cirugía en los países nórdicos vs en los países miembros de la UE
--a lo largo de los años.

DROP VIEW IF EXISTS Nordicos;
DROP VIEW IF EXISTS Europeos;

CREATE VIEW Nordicos AS
SELECT año, valor AS valorNor
FROM indicador NATURAL JOIN valor_anual
GROUP BY año, valor, códigoI, códigoR
HAVING códigoI = 'HLTHRES_243' AND códigoR = 'NORDIC'
ORDER BY año;

CREATE VIEW Europeos AS
SELECT año, valor AS valorEu
FROM indicador NATURAL JOIN valor_anual
GROUP BY año, valor, códigoI, códigoR
HAVING códigoI = 'HLTHRES_243' AND códigoR = 'EU_MEMBERS'
ORDER BY año;

SELECT año, valornor/valoreu AS ratio
FROM Nordicos NATURAL JOIN Europeos;