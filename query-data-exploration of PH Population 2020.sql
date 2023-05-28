
-- Query for Top 10 Most Populated Cities

SELECT
r.region AS Region,
p.province AS Province,
c.city as City,
FORMAT(c.total_population, 2) AS 'City Total'
FROM region_population_data r
LEFT JOIN province_population_data p on r.region_id=p.region_id
LEFT JOIN city_population_data c on p.province_id=c.province_id
ORDER BY c.total_population DESC
LIMIT 10;

-- Query for Top 10 Most Populated Provinces

SELECT
r.region as Region,
p.province AS Province,
FORMAT(p.total_population, 2) AS 'Province Total'
FROM region_population_data r
LEFT JOIN province_population_data p on r.region_id=p.region_id
WHERE NOT p.region_id='NCR'
ORDER BY p.total_population DESC
LIMIT 10;

-- Query for Top 10 Most Populated Regions

SELECT
r.region AS Region,
FORMAT(r.total_population, 2) AS 'Region Total'
FROM region_population_data r
ORDER BY r.total_population DESC
LIMIT 10;

-- Query for Top 10 Highest Avg Per Household

SELECT 
r.region AS Region,
p.province AS Province,
c.city AS City,
FORMAT(c.household_population, 2) AS 'Household Population',
FORMAT(c.number_of_households, 2) AS 'Number of Household',
FORMAT(c.avg_per_household, 2) AS 'Average Per Household'
FROM region_population_data r
LEFT JOIN province_population_data p on r.region_id=p.region_id
LEFT JOIN city_population_data c on p.province_id=c.province_id
ORDER BY c.avg_per_household DESC
LIMIT 10;

-- Query for No. of People not included in household (Overseas Workers, etc.,)

SELECT
r.region AS Region,
p.province AS Province,
c.city AS City,
FORMAT(c.total_population, 0) AS 'Total Population',
FORMAT(c.household_population, 0) AS 'Household Population',
FORMAT((c.total_population - c.household_population), 0) AS 'Not Included in a Housing Unit'
FROM region_population_data r
LEFT JOIN province_population_data p ON r.region_id=p.region_id
LEFT JOIN city_population_data c ON p.province_id=c.province_id
ORDER BY (c.total_population - c.household_population) DESC
LIMIT 10