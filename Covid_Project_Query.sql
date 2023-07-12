select *
from Portfolio.dbo.Covid_Death$
where continent is not null
order by 3,4

--select *
--from Portfolio.dbo.Covid_Vacs$
--order by 3,4

-- Select Data that we are going to be using

select location, date, total_cases,new_cases,total_deaths,population
from Portfolio.dbo.Covid_Death$
where continent is not null
order by 1,2

-- total cases vs total deaths
select location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DetahPercentage
from Portfolio.dbo.Covid_Death$
where location like '%states%'
and continent is not null
order by 1,2

-- Total cases vs Population
select location,population, date, total_cases, (total_cases/population)*100 as CasePercentage
from Portfolio.dbo.Covid_Death$
--where location like '%states%'
order by 1,2

-- Country with highest infection Rate compared to population
select location,population, max(total_cases)as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
from Portfolio.dbo.Covid_Death$
--where location like '%states%'
group by location,population
order by PercentPopulationInfected desc



-- Countries with Highest DeathCount per Population
select location, MAX(cast(total_deaths as int)) as TotalDeathCount
from Portfolio.dbo.Covid_Death$
where continent is not null
--where location like '%states%'
group by location
order by TotalDeathCount desc

-- Continent Breakdown
select location, MAX(cast(total_deaths as int)) as TotalDeathCount
from Portfolio.dbo.Covid_Death$
where continent is null
--where location like '%states%'
group by location
order by TotalDeathCount desc

select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
from Portfolio.dbo.Covid_Death$
where continent is not null
--where location like '%states%'
group by continent
order by TotalDeathCount desc

-- Contintents with the highest death count Populatio 
select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
from Portfolio.dbo.Covid_Death$
where continent is not null
--where location like '%states%'
group by continent
order by TotalDeathCount desc

-- Global numbers per day

select date, 
	Sum(new_cases) as totalCases,
	Sum(cast(new_deaths as int)) as totalDeaths,
	Sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from Portfolio.dbo.Covid_Death$
--where location like '%states%'
Where continent is not null
Group by date
order by 1,2

-- total Global numbers
select  
	Sum(new_cases) as totalCases,
	Sum(cast(new_deaths as int)) as totalDeaths,
	Sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from Portfolio.dbo.Covid_Death$
Where continent is not null
order by 1,2


-- Looking a Total population vs Vaccinations

Select 
	dea.continent, dea.location, dea.date,dea.population,
	vacs.new_vaccinations,
	SUM(convert(bigint, vacs.new_vaccinations)) over 
	(partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
	--,(RollingPeopleVaccinated/population)*100
From Portfolio.dbo.Covid_Death$ as dea
join Portfolio.dbo.Covid_Vacs$ as vacs
	on dea.location = vacs.location
	and dea.date = vacs.date
Where dea.continent is not null
Order by 2,3

-- Use CTE

with PopvsVac (continent, location, date, population,new_vaccinations,RollingPeopleVaccinated)
as
(
Select 
	dea.continent, dea.location, dea.date,dea.population,
	vacs.new_vaccinations,
	SUM(convert(bigint, vacs.new_vaccinations)) over 
	(partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
	--,(RollingPeopleVaccinated/population)*100
From Portfolio.dbo.Covid_Death$ as dea
join Portfolio.dbo.Covid_Vacs$ as vacs
	on dea.location = vacs.location
	and dea.date = vacs.date
Where dea.continent is not null
--Order by 2,3
)
Select *, (RollingPeopleVaccinated/population)*100
From PopvsVac

-- tempTable

Drop table if exists #PercentPopulationVaccinated
create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
location nvarchar(255),
Date datetime,
population numeric,
new_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select 
	dea.continent, dea.location, dea.date,dea.population,
	vacs.new_vaccinations,
	SUM(convert(bigint, vacs.new_vaccinations)) over 
	(partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
	--,(RollingPeopleVaccinated/population)*100
From Portfolio.dbo.Covid_Death$ as dea
join Portfolio.dbo.Covid_Vacs$ as vacs
	on dea.location = vacs.location
	and dea.date = vacs.date
Where dea.continent is not null
--Order by 2,3

Select *, (RollingPeopleVaccinated/population)*100
From #PercentPopulationVaccinated

-- views

Create view PercentPopulationVaccinated as
Select 
	dea.continent, dea.location, dea.date,dea.population,
	vacs.new_vaccinations,
	SUM(convert(bigint, vacs.new_vaccinations)) over 
	(partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
	--,(RollingPeopleVaccinated/population)*100
From Portfolio.dbo.Covid_Death$ as dea
join Portfolio.dbo.Covid_Vacs$ as vacs
	on dea.location = vacs.location
	and dea.date = vacs.date
Where dea.continent is not null

select *
from PercentPopulationVaccinated