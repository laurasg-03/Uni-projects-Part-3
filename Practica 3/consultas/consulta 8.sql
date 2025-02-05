--8
--El indicador HLTHRES_235 mide número de equipos de radioterapia en el ámbito hospitalario, por 100000 habitantes. 
--Queremos saber cómo evoluciona la media de este indicador, para ello, para cada año tenemos en cuenta los valores de 
--los países que tienen valor no nulo de este indicador. 

SELECT año, avg(valor) AS media
FROM valor_anual NATURAL JOIN país
WHERE códigoI='HLTHRES_235' AND códigoR=CódigoPa AND valor!='0'	--Coger solo los paises y 
GROUP BY año;								                 	--los valores no nulos "0"	