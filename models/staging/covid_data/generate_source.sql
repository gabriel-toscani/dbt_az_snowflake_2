{{ config(enabled=false) }}

{{ codegen.generate_source(schema_name= 'public'
                            , include_schema = 'true'
                            , database_name= 'COVID19_EPIDEMIOLOGICAL_DATA'
                            , generate_columns= 'true'
                            , include_data_types= false
                            , table_names = [
                                'CDC_INPATIENT_BEDS_ALL'
                                , 'CDC_INPATIENT_BEDS_COVID_19'
                                , 'CDC_INPATIENT_BEDS_ICU_ALL'
                                , 'CDC_POLICY_MEASURES'
                                , 'CDC_REPORTED_PATIENT_IMPACT'
                                , 'CDC_TESTING']) }}