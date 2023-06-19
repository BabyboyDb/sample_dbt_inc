{{
    config(
        materialized='view',
    )
}}

{% set type = 'DevOps' %}


select
    id,
    name
from {{ ref('developers') }} d
where d.type = '{{ type }}'
