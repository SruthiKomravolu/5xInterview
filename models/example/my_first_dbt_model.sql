
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/
create or replace  view INTERVIEW_DB.PLAYGROUND_venkatasruthi_komaravolu.death_rate  as (
select INDONESIA,(max(TOTAL_DEATHS)/max(population)*100) as rate from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_VENKATASRUTHI_KOMARAVOLU
group by INDONESIA order by rate desc)


create or replace  view INTERVIEW_DB.PLAYGROUND_venkatasruthi_komaravolu.monthbymonth  as (
select month(to_date(date, 'MM/DD/YYYY')) as month, year(to_date(date, 'MM/DD/YYYY')) as year, 
            concat(month(to_date(date, 'MM/DD/YYYY')),'_ ', year(to_date(date, 'MM/DD/YYYY'))) as month_year,
            INDONESIA,COUNTRY,
              max(TOTAL_CASES) as Total_cases ,sum(new_cases) as New_Positive_cases

from 

FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_VENKATASRUTHI_KOMARAVOLU group by INDONESIA, month_year,month,year, COUNTRY 
order by year,month

)



create or replace  view INTERVIEW_DB.PLAYGROUND_venkatasruthi_komaravolu.weekbyweek  as (
select WEEK(to_date(date, 'MM/DD/YYYY')) as week, year(to_date(date, 'MM/DD/YYYY')) as year, 
            concat(WEEK(to_date(date, 'MM/DD/YYYY')),'_ ', year(to_date(date, 'MM/DD/YYYY'))) as week_year,
            INDONESIA,COUNTRY,
              max(TOTAL_CASES) as Total_cases ,sum(new_cases) as New_Positive_cases

from 

FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_VENKATASRUTHI_KOMARAVOLU group by INDONESIA, week_year,week,year, COUNTRY 
order by year,week

)


--{{ config(materialized='view') }}
  
/*with source_data as (

    select 1 as id
    union all
    select null as id

)
*/
--select *
--from source_data







/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
