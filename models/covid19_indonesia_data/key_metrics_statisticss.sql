{{ config(materialized='view') }}

select location,population,total_rural_villages, total_urban_villages, total_cities, total_districts, total_regencies,
count(distinct date) NoOfDays,
sum(new_active_cases)total_new_cases,
avg(new_active_cases) avg_new_cases,
sum(new_recovered) total_recovered,
avg(new_recovered) avg_recovered,
sum(new_deaths) all_deaths,
avg(new_deaths) avg_deaths,
avg(growth_factor_of_new_cases) avg_growth_factor_of_new_cases,
avg(growth_factor_of_new_deaths) avg_growth_factor_of_new_deaths,
avg(case_recovered_rate) avg_case_recovered_rate_percent,
avg(case_fatality_rate) avg_case_fatality_rate_percent
from {{ ref('covid_all_data') }}
group by 1,2,3,4,5,6,7
