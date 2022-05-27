{{
  config(
    materialized = 'incremental',
    unique_key = 'event_id',
    cluster_by = 'tstamp'
  )
}}

with

source as (

    select *

    from source {{ source('patty_bar_web', 'tracks') }}
    {%- if is_incremental() %}
    where received_at >= ( select max(received_at_tstamp)::date from {{ this }} )
    {%- endif %}

)

renamed as (

    select
        id as event_id,
        'patty_bar_web'::varchar as source_schema,
        'tracks'::varchar as source_table,
        'patty-bar'::varchar as tracking_plan,
        context_library_name as library_name,
        context_library_version as library_version,
        sent_at as sent_at_tstamp,
        received_at as received_at_tstamp,
        timestamp as tstamp,
        anonymous_id,
        user_id

    from source

)

select * from renamed
