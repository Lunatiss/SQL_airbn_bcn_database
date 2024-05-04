-- Analizar los tipos de apartamentos, servicios y precios promedio en cada barrio

-- neighborhood with high concentration of airbnb appartments 
CREATE VIEW concentration_tourist AS
SELECT d.district AS name, COUNT(a.airbnb_id) AS total_airbnb
FROM airbnb as a
RIGHT JOIN district AS d
ON a.district_id = d.district_id
GROUP BY d.district;

SELECT* FROM concentration_tourist;

-- avg month price by district
CREATE VIEW price_avg_dis AS
 SELECT
    d.district_id AS district_id,
    d.district AS district,
    FORMAT(AVG(r.price_avg), 2) AS avg_price_€
FROM rent AS r
LEFT JOIN district AS d ON r.district_id = d.district_id
GROUP BY d.district, d.district_id
ORDER BY AVG(r.price_avg) DESC
LIMIT 10;

SELECT * FROM price_avg_dis;

-- avg month price by neighbordood
 CREATE VIEW price_avg_nei AS
 SELECT
    n.neighbourhood_id AS neighbourhood_id,
    n.neighbourhood AS neighbourhood,
    FORMAT(AVG(r.price_avg), 2) AS avg_price_€
FROM rent AS r
LEFT JOIN neighbourhood AS n ON r.neighbourhood_id = n.neighbourhood_id
GROUP BY n.neighbourhood_id, neighbourhood
ORDER BY avg_price_€ DESC
LIMIT 10;


SELECT * FROM price_avg_nei;

-- Desarrollar indicadores para determinar si un barrio tiene una alta concentración de turistas.
CREATE VIEW Summary_population AS 
	SELECT
    p.neighbourhood_id,
    n.neighbourhood,
    CONCAT(FORMAT((SUM(p.strangers) / SUM(p.population)) * 100, 2), '%') AS foreigner_percentage,
    CONCAT(FORMAT((SUM(p.spaniards) / SUM(p.population)) * 100, 2), '%') AS spaniard_percentage
FROM population AS p
LEFT JOIN neighbourhood AS n ON p.neighbourhood_id = n.neighbourhood_id
GROUP BY p.neighbourhood_id, n.neighbourhood;

SELECT * FROM Summary_population; 

-- % foreigner
SELECT
    p.neighbourhood_id,
    n.neighbourhood,
    CONCAT(FORMAT((SUM(p.strangers) / SUM(p.population)) * 100, 2), '%') AS foreigner_percentage
FROM population AS p
LEFT JOIN neighbourhood AS n ON p.neighbourhood_id = n.neighbourhood_id
GROUP BY p.neighbourhood_id, n.neighbourhood
ORDER BY foreigner_percentage DESC
LIMIT 10;

-- %spaniards 
	SELECT
    p.neighbourhood_id,
    n.neighbourhood,
    CONCAT(FORMAT((SUM(p.spaniards) / SUM(p.population)) * 100, 2), '%') AS spaniard_percentage
FROM population AS p
LEFT JOIN neighbourhood AS n ON p.neighbourhood_id = n.neighbourhood_id
GROUP BY p.neighbourhood_id, n.neighbourhood;


--   sacar precio medio de la noche por airbnb
SELECT
    a.district_id,
    d.district,
    ROUND(AVG(a.price_night),2) AS price_night
FROM airbnb AS a
LEFT JOIN district AS d ON a.district_id = d.district_id
GROUP BY a.district_id
ORDER BY AVG(a.price_night) DESC;


-- Precios promedio de rent por barrio
 CREATE VIEW price_avg_dis AS
 SELECT
    d.district AS district_name,
    CONCAT("€", FORMAT(AVG(r.price_avg), 2)) AS avg_price
FROM rent AS r
LEFT JOIN district AS d ON r.district_id = d.district_id
GROUP BY d.district;

-- Precios promedio de rent por barrio
 CREATE VIEW price_avg_nei AS
 SELECT
    n.neighbourhood_id AS neighbourhood_id,
    n.neighbourhood AS neighbourhood,
    CONCAT("€", FORMAT(AVG(r.price_avg), 2)) AS avg_price
FROM rent AS r
LEFT JOIN neighbourhood AS n ON r.neighbourhood_id = n.neighbourhood_id
GROUP BY n.neighbourhood_id, neighbourhood;

 