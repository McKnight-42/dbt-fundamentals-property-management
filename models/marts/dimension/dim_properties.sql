with properties as (
    select * from {{ ref('stg_properties') }}
),
property_owners as (
    select * from {{ ref('stg_property_owners') }}
),
units as (
    select * from {{ ref('stg_units') }}
),
final as (
    select
        property_owners.property_owner_id,
        properties.property_id,
        units.unit_id,
        properties.name,
        properties.address,
        properties.city,
        properties.state,
        properties.zip_code,
        properties.year_built,
        units.rent,
        units.status,
        units.square_feet,
        units.bedrooms,
        units.bathrooms



    from property_owners
    left join properties on property_owners.property_id = properties.property_id
    left join units on property_owners.property_id = units.property_id
)

select * from final