--1
--Obtén por orden alfabético de su descripción aquellos indicadores (descripción e
--identificador) que miden (unidad de medida) en número de profesionales
--(‘number of professionals’)
SELECT códigoI AS identificador, descripciónI AS descripción
FROM indicador NATURAL JOIN unidad_de_medida
WHERE unidad_de_medida.descripciónU = 'number of professionals'
ORDER BY descripciónI