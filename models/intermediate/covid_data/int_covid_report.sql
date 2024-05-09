
with
    total_inpatient_beds as (
        select *
        from {{ref('stg_public__cdc_inpatient_beds_all')}}
    )


    , total_inpatient_beds_covid as (
        select *
        from {{ref('stg_public__cdc_inpatient_beds_covid_19')}}
    )


    , total_inpatient_beds_icu as (
        select *
        from {{ref('stg_public__cdc_inpatient_beds_icu_all')}}
    )


    , joining_data as (
        select
            total_inpatient_beds.state
            , SUM(total_inpatient_beds.inpatient_beds_occupied) as total_inpatient_beds_occupied
            , AVG(total_inpatient_beds.inpatient_beds_in_use_pct) as total_inpatient_beds_in_use_pct
            , SUM(total_inpatient_beds_covid.inpatient_beds_occupied) as covid_inpatient_beds_occupied
            , AVG(total_inpatient_beds_covid.inpatient_beds_in_use_pct) as covid_inpatient_beds_in_use_pct
            , SUM(total_inpatient_beds_icu.staffed_adult_icu_beds_occupied) as icu_inpatient_beds_occupied
            , AVG(total_inpatient_beds_icu.staffed_adult_icu_beds_occupied_pct) as icu_inpatient_beds_in_use_pct
        from total_inpatient_beds
        left join total_inpatient_beds_covid on
            total_inpatient_beds.state = total_inpatient_beds_covid.state
            and total_inpatient_beds."DATE" = total_inpatient_beds_covid."DATE"
        left join total_inpatient_beds_icu on
            total_inpatient_beds.state = total_inpatient_beds_icu.state
            and total_inpatient_beds."DATE" = total_inpatient_beds_icu."DATE"
        group by
            total_inpatient_beds.state
    )


select *
from joining_data

