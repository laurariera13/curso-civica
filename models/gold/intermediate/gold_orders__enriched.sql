with orders as (
    select * from {{ ref('slv_sql_server_dbo__orders') }}
),
addresses as (
    select * from {{ ref('slv_sql_server_dbo__addresses') }}
)
promos as (
    select * from {{ ref('slv_sql_server_dbo__promos') }}
)
select * from orders
left join adresses
on orders.address_id = address.address_id
left join promos
on orders.promo_id = users.promo_id


