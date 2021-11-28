
-- Use the `ref` function to select from other models

/*select *
from {{ ref('my_first_dbt_model') }}
where id = 1
*/
create or replace  view INTERVIEW_DB.PLAYGROUND_venkatasruthi_komaravolu.weekbyweek  as (
select WEEK(to_date(date, 'MM/DD/YYYY')) as week, year(to_date(date, 'MM/DD/YYYY')) as year, 
            concat(WEEK(to_date(date, 'MM/DD/YYYY')),'_ ', year(to_date(date, 'MM/DD/YYYY'))) as week_year,
            INDONESIA,COUNTRY,
              max(TOTAL_CASES) as Total_cases ,sum(new_cases) as New_Positive_cases

from 

FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_VENKATASRUTHI_KOMARAVOLU group by INDONESIA, week_year,week,year, COUNTRY 
order by year,week

)