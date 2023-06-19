/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml
    Try changing "table" to "view" below
*/

{{
    config(materialized='table')
}}

with source_data as (

    SELECT
    {{ dbt_utils.star(from=ref("first_10_visits"), except=['ctrldate']) }},
    C.ctrldate
FROM {{ ref("first_10_visits") }}
left join
    select c.id_service, c.ctrldate from {{source("gsmk_tables","cards")}} c
    using (id_service)

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
