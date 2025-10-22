with daily_weather as (
    select
    date(time) as date_of_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds
    from   {{ source("demo", "WEATHER") }}   --DEMO_DB.DEMO_SCHEMA.WEATHER 
    --limit 10
    ), -- select * from daily_weather
daily_weather_agg as (
    select
    date_of_weather,
    weather,
    round(avg(temp),2) as AVG_TEMP,
    round(avg(pressure),2) as AVG_PRESSURE,
    round(avg(humidity),2) as AVG_HUMIDITY,
    round(avg(clouds),2) as AVG_CLOUDS
    --count(weather),
    --ROW_NUMBER() OVER (PARTITION BY DATE_OF_WEATHER ORDER BY count(weather) desc ) AS ROW_NUMBER
    from daily_weather
    group by date_of_weather, weather
    qualify ROW_NUMBER() OVER (PARTITION BY DATE_OF_WEATHER ORDER BY count(weather) desc ) = 1
)


select *
from daily_weather_agg order by 1

