with
    trips as (

        select

            ride_id,
            -- rideable_type,
            date(to_timestamp(started_at)) as trip_start_date,
            date(to_timestamp(ended_at)) as trip_end_date,
            timestampdiff(
                minute, to_timestamp(started_at), to_timestamp(ended_at)
            ) as trip_duration_minutes,
            start_statio_id as trip_station_start_id,
            end_station_id as trip_station_end_id,
            member_casual,
        --from {{ source("demo", "BIKE") }}
        from {{ ref("BIKE_STG")}}
        where ride_id <> 'ride_id'
        limit 10

    )

select *
from trips
