WITH CTE AS (
Select
TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
{{get_daytype('STARTED_AT')}} AS DAY_TYPE,
{{get_season('STARTED_AT')}} AS SEASON_OF_YEAR,
{{get_timeperiod('STARTED_AT')}} AS TIME_PERIOD
From {{ source('demo','BIKE')}}
Where STARTED_AT <> 'started_at'
)

Select * from CTE


