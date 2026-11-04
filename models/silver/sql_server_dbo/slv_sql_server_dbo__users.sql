with source as (
    select * from {{ ref('stg_sql_server_dbo__users') }}
),
cleaned as (
    select
    user_id
    , first_name
    , last_name
    , email
    , phone_number
    , address_id
    , created_at
    , updated_at
    , is_deleted
    , _fivetran_synced
    , _loaded_at
    from source
    where not is_deleted
    qualify row_number() over (partition by user_id order by _fivetran_synced desc) = 1
)
select * from cleaned