--Tableau Vizualization Project #1

-- 1

SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths) * 100 / NULLIF(SUM(new_cases), 0) AS DeathPercentages
FROM PortfolioProject..CovidDeaths$
WHERE continent IS NOT NULL
ORDER BY 1, 2


-- 2

SELECT location, SUM(CAST(new_deaths AS INT)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths$
WHERE continent IS NULL AND location NOT IN ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Low income', 'Lower middle income')
GROUP BY location
ORDER BY TotalDeathCount DESC


-- 3

SELECT Location, Population, MAX(total_cases) AS HighestInfectionCount,  MAX(CAST(total_cases AS float)) / NULLIF(CAST(Population AS float), 0) * 100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths$
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC



-- 4

SELECT Location, Population, date, MAX(total_cases) AS HighestInfectionCount,  MAX(CAST(total_cases AS float)) / NULLIF(CAST(Population AS float), 0) * 100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths$
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC