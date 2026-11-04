with source as (
    select * from {{ ref('stg_sql_server_dbo__orders') }}
),
cleaned as (
    select
    order_id
    , user_id
    , created_at_utc
    , total_order_cost_usd
    , order_status
    -- ... resto de columnas
    , is_deleted
    , date_load
    from source
    where not is_deleted
    qualify row_number() over (partition by order_id order by date_load desc) = 1
    
)
select * from cleaned