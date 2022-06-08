{{
  config(
    materialized = 'view',
  )
}}

with

source as (

    select *

    from {{ source('my_app_web', 'order_completed') }}

),

renamed as (

    select
        id as event_id,
        'patty_bar_web'::varchar as source_schema,
        'order_completed'::varchar as source_table,
        'my-plan'::varchar as tracking_plan,
        context_library_name as library_name,
        context_library_version as library_version,
        sent_at as sent_at_tstamp,
        received_at as received_at_tstamp,
        timestamp as tstamp,
        anonymous_id,
        user_id,
        checkout_id,
        currency,
        order_id,
        products,
        shipping,
        subtotal,
        tax,
        total

    from source

)

select * from renamed
