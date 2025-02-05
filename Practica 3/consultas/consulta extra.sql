--CONSULTA EXTRA
--Comparar el numero de medicos graduados fuera de españa con los médicos graduados en españa
DROP VIEW IF EXISTS Medicos_europe;
DROP VIEW IF EXISTS Medicos_esp;

CREATE VIEW Medicos_europe AS
SELECT año, avg(valor) AS valor_medic_europe
FROM valor_anual NATURAL JOIN país
WHERE códigoI=(SELECT códigoI
				FROM indicador	
				WHERE descripciónI='Medical graduates, total number') AND códigoR=códigoPa AND códigoR!='ESP'
GROUP BY año
ORDER BY año;


CREATE VIEW Medicos_esp AS
SELECT año, valor AS valor_medic_esp
FROM valor_anual
WHERE  códigoI=(SELECT códigoI
				FROM indicador
				WHERE descripciónI='Medical graduates, total number') AND códigoR ='ESP';

SELECT año, valor_medic_europe/valor_medic_esp AS ratio
FROM Medicos_europe NATURAL JOIN  Medicos_esp


