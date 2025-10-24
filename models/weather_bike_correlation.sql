with cte as (
select 
*
from {{ ref('trip_fact') }} t
left join {{ ref('daily_weather_dimension') }} w
on t.trip_start_date = w.date_of_weather

order by trip_start_date

)

select * from cte