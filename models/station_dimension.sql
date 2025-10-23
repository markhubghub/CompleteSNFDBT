with
    bike as (

        select
            start_statio_id as station_id,
            start_station_name as station_name,
            start_lat as station_lat,
            start_lng as station_long

        -- from {{ source("demo", "BIKE") }}
        from {{ ref('bike_stg') }}
        where ride_id <> 'ride_id'
        -- limit 10

    )

select *
from bike
