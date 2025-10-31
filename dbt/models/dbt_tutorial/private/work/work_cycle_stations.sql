/*
If config block does not specify an explicit materialization,
the value setup in dbt_project.yml is used.
If no value is set in dbt_project.yml, it will default to "view".
*/

{{
  config(
    materialized = "table"
  )
}}

WITH source AS (
    SELECT * FROM {{ source('london_bicycles', 'cycle_stations') }}
),

renamed AS (
    SELECT
        id              AS station_id,
        installed       AS is_installed,
        latitude        AS lattitude,
        longitude       AS longitude,
        name            AS station_name,
        bikes_count     AS count_bike,
        docks_count     AS count_docks,
        nbemptydocks    AS count_empty_docks,
        temporary       AS is_temporary,
        terminal_name   AS terminal_name,
        install_date    AS install_date,
        removal_date    AS removal_date,
        locked = 'true' AS is_locked
    FROM source
)

SELECT
    *,
    -- retrieve the last part of the station name
    trim(array_reverse(split(station_name, ','))[offset(0)]) AS station_area
FROM renamed
