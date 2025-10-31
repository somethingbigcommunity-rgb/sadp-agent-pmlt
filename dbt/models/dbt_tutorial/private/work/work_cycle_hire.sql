/*
  If config does not specify an explicit materialization, the default will be used from
  dbt_project.yml. If there is no default there, it will be set to "view"
*/

{{
  config(
    materialized = "table"
  )
}}

WITH source_hires AS (
    SELECT * FROM {{ source('london_bicycles', 'cycle_hire') }}
),

stations AS (
    SELECT * FROM {{ ref('work_cycle_stations') }}
)

SELECT
    rental_id AS rental_id,
    duration  AS duration,
    bike_id   AS bike_id,
    end_date,
    end_station_id,
    end_station_name,
    start_date,
    start_station_id,
    start_station_name,
    end_station_logical_terminal,
    start_station_logical_terminal,
    end_station_priority_id
FROM source_hires
-- we are only interested in hires where we can correctly map the station ids
WHERE
    start_station_id IN (SELECT station_id FROM stations)
    AND end_station_id IN (SELECT station_id FROM stations)
