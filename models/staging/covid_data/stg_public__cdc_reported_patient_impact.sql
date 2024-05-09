with 

source as (

    select * from {{ source('covid_data', 'cdc_reported_patient_impact') }}

),

renamed as (

    select
        state,
        critical_staffing_shortage_today_yes,
        critical_staffing_shortage_today_no,
        critical_staffing_shortage_today_not_reported,
        critical_staffing_shortage_anticipated_within_week_yes,
        critical_staffing_shortage_anticipated_within_week_no,
        critical_staffing_shortage_anticipated_within_week_not_reported,
        hospital_onset_covid,
        hospital_onset_covid_coverage,
        inpatient_beds,
        inpatient_beds_coverage,
        inpatient_beds_used,
        inpatient_beds_used_coverage,
        inpatient_beds_used_covid,
        inpatient_beds_used_covid_coverage,
        previous_day_admission_adult_covid_confirmed,
        previous_day_admission_adult_covid_confirmed_coverage,
        previous_day_admission_adult_covid_suspected,
        previous_day_admission_adult_covid_suspected_coverage,
        previous_day_admission_pediatric_covid_confirmed,
        previous_day_admission_pediatric_covid_confirmed_coverage,
        previous_day_admission_pediatric_covid_suspected,
        previous_day_admission_pediatric_covid_suspected_coverage,
        staffed_adult_icu_bed_occupancy,
        staffed_adult_icu_bed_occupancy_coverage,
        staffed_icu_adult_patients_confirmed_and_suspected_covid,
        staffed_icu_adult_patients_confirmed_and_suspected_covid_coverage,
        staffed_icu_adult_patients_confirmed_covid,
        staffed_icu_adult_patients_confirmed_covid_coverage,
        total_adult_patients_hospitalized_confirmed_and_suspected_covid,
        total_adult_patients_hospitalized_confirmed_and_suspected_covid_coverage,
        total_adult_patients_hospitalized_confirmed_covid,
        total_adult_patients_hospitalized_confirmed_covid_coverage,
        total_pediatric_patients_hospitalized_confirmed_and_suspected_covid,
        total_pediatric_patients_hospitalized_confirmed_and_suspected_covid_coverage,
        total_pediatric_patients_hospitalized_confirmed_covid,
        total_pediatric_patients_hospitalized_confirmed_covid_coverage,
        total_staffed_adult_icu_beds,
        total_staffed_adult_icu_beds_coverage,
        inpatient_beds_utilization,
        inpatient_beds_utilization_coverage,
        inpatient_beds_utilization_numerator,
        inpatient_beds_utilization_denominator,
        percent_of_inpatients_with_covid,
        percent_of_inpatients_with_covid_coverage,
        percent_of_inpatients_with_covid_numerator,
        percent_of_inpatients_with_covid_denominator,
        inpatient_bed_covid_utilization,
        inpatient_bed_covid_utilization_coverage,
        inpatient_bed_covid_utilization_numerator,
        inpatient_bed_covid_utilization_denominator,
        adult_icu_bed_covid_utilization,
        adult_icu_bed_covid_utilization_coverage,
        adult_icu_bed_covid_utilization_numerator,
        adult_icu_bed_covid_utilization_denominator,
        adult_icu_bed_utilization,
        adult_icu_bed_utilization_coverage,
        adult_icu_bed_utilization_numerator,
        adult_icu_bed_utilization_denominator,
        date,
        iso3166_1,
        iso3166_2,
        last_update_date,
        last_reported_flag

    from source

)

select * from renamed
