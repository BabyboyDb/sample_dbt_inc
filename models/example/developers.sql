{{
    config(
        materialized='table',
    )
}}


select 1 as id, 'Nikita' as name, 'Analytics' as type
union
select 2 as id, 'Stanislav' as name, 'Analytics' as type
union
select 3 as id, 'Alex' as name, 'CTO' as type
union
select 4 as id, 'Artem' as name, 'DevOps' as type
union
select 5 as id, 'Artem' as name, 'DataScience' as type
union
select 6 as id, 'Victor' as name, 'Backend' as type
union
select 7 as id, 'Mark' as name, 'DataEngineer' as type
