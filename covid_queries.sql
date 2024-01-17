--EXPLORE COVID DEATHS DATA

Select *
From [Covid Deaths Proj]..CovidDeaths
where continent is not null
order by 3,4

-- Looking at Total Cases vs Total Deaths: Shows the likelihood of dying if you contract Covid in the country 
Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_rate
From [Covid Deaths Proj]..CovidDeaths
--Where location like '%vietnam%'
where continent is not null
order by 1,2

-- Looking at Total Cases vs Population
-- Shows the percentage of population got Covid
Select location, date, population, total_cases, (total_cases/population)*100 as infection_rate
From [Covid Deaths Proj]..CovidDeaths
--Where location like '%Vietnam%'
where continent is not null
order by 1,2

-- Looking at countries with the highest infection rate compared to population
Select location, population, max(total_cases) as [Highest Infection Count], max((total_cases/population))*100 as [Highest Infection Rate]
From [Covid Deaths Proj]..CovidDeaths
where continent is not null
Group by Location, Population
order by [Highest Infection Rate] desc

-- Looking at countries with the highest death count per population
Select location, max(cast(total_deaths as int)) as [Highest Death Count]
From [Covid Deaths Proj]..CovidDeaths
where continent is not null
Group by Location, Population
order by [Highest Death Count] desc
 
 -- Showing continents with the highest death count per population
Select continent, max(cast(total_deaths as int)) as [Highest Death Count]
From [Covid Deaths Proj]..CovidDeaths
where continent is not null
Group by continent
order by [Highest Death Count] desc

-- GLOBAL STATS

Select date, sum(new_cases) as [Total new cases], sum(cast(new_deaths as int)) as [Total new deaths], sum(cast(new_deaths as int))/sum(new_cases)*100 as [World Death Rate]
From [Covid Deaths Proj]..CovidDeaths
where continent is not null
group by date
order by 1,2
--There were 100 total cases and 1 total death that gave us a death percentage of 1% across the world per day

Select sum(new_cases) as [Total cases], sum(cast(new_deaths as int)) as [Total deaths], sum(cast(new_deaths as int))/sum(new_cases)*100 as [World Death Rate]
From [Covid Deaths Proj]..CovidDeaths
where continent is not null
order by 1,2
-- Across the world, the death percentage was a little bit over 1%


--EXPLORE COVID VACCINATIONS DATA
--Select *
--From [Covid Deaths Proj]..CovidVaccinations

--Looking at Total Populations vs Total Vaccinations
With cte_vac_pop (continent, location, date, population, new_vaccinations, rolling_vac_pop)
as
(
Select d.continent, d.location, d.date, d.population, v.new_vaccinations,
sum(convert(bigint, v.new_vaccinations)) over (Partition by d.location order by d.location, d.date) as rolling_vac_pop
From [Covid Deaths Proj]..CovidDeaths d
join [Covid Deaths Proj]..CovidVaccinations v
	on d.location = v.location 
	and d.date = v.date
Where d.continent is not null
)

select (rolling_vac_pop/population)*100 as rolling_vac_rate
from cte_vac_pop 

-- TEMP TABLE
Drop Table if exists Percent_Vaccinated
Create Table Percent_Vaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
rolling_vac_pop numeric
)
Insert into Percent_Vaccinated
Select d.continent, d.location, d.date, d.population, v.new_vaccinations,
sum(convert(bigint, v.new_vaccinations)) over (Partition by d.location order by d.location, d.date) as rolling_vac_pop
From [Covid Deaths Proj]..CovidDeaths d
join [Covid Deaths Proj]..CovidVaccinations v
	on d.location = v.location 
	and d.date = v.date
Where d.continent is not null
order by 1,2,3

Select *, (rolling_vac_pop/population)*100 as rolling_vac_rate
from Percent_Vaccinated

-- Creating View to store data 
Create View Percent_Population_Vac as
Select d.continent, d.location, d.date, d.population, v.new_vaccinations,
sum(convert(bigint, v.new_vaccinations)) over (Partition by d.location order by d.location, d.date) as rolling_vac_pop
From [Covid Deaths Proj]..CovidDeaths d
join [Covid Deaths Proj]..CovidVaccinations v
	on d.location = v.location 
	and d.date = v.date
Where d.continent is not null

Select *
From Percent_Population_Vac
