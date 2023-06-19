select
    *
from
    {{source('gsmk_tables','visits')}}
limit 10
