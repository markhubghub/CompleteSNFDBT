{% macro get_timeperiod(x) %}
CASE WHEN TO_TIMESTAMP({{x}}) < CURRENT_DATE THEN 'PAST'
ELSE 'FUTURE' END
{% endmacro %}

{% macro get_season(d) %}
CASE WHEN MONTH(TO_TIMESTAMP({{d}})) IN (12,1,2) 
     THEN 'WINTER'   
     WHEN MONTH(TO_TIMESTAMP({{d}})) IN (3,4,5) 
     THEN 'SPRING'
     WHEN MONTH(TO_TIMESTAMP({{d}})) IN (6,7,8) 
     THEN 'SUMMER'
     WHEN MONTH(TO_TIMESTAMP({{d}})) IN (9,10,11) 
     THEN 'FALL'
     ELSE 'UNKNOWN'
END
{% endmacro %}

{% macro get_daytype(t) %}
CASE WHEN DAYNAME(TO_TIMESTAMP({{t}})) IN ('Sat','Sun') 
     THEN 'WEEKEND' 
     ELSE 'BUSINESSDAY'
END
{% endmacro %}

