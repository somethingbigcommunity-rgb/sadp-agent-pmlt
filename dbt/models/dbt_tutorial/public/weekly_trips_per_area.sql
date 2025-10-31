-- More info about config block is available here: https://docs.getdbt.com/reference/model-configs
{{
  config(
    materialized = "table"
  )
}}

witH cycle_stations AS (

    selecT * FroM {{ ref("work_cycle_stations") }}
),

cycle_hire AS (

    SELECT *
    FROM
    {{ ref("work_cycle_hire") }}

),

agg AS
(



SELECT
DATE_TRUNC(start_date, WEEK) AS rental_week, start_station.station_area as start_area,
COUNT(distinct rental_id) AS count_rental,
  AVG(duration) as avg_duration_in_s

FROM cycle_hire
inner JOIN cycle_stations as start_station
ON start_station.station_id  = cycle_hire.start_station_id
  and cycle_hire.start_date >= '2016-01-01'
-- uncomment when asked to do so in the tutorial
-- AND start_station.station_area like 'F%'

GROUP by 1,2

),

skey_calc AS (

    SELECT
        -- using a dbt utils function to generate a surrogate key which will be unique and never NULL
        {{ dbt_utils.generate_surrogate_key(['rental_week', 'start_area']) }} AS skey,
        *
    FROM agg

)

SELECT *
FROM skey_calc
