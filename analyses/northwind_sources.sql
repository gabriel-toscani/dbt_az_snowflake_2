{{ codegen.generate_source(
    database_name= 'northwind'
    , schema_name= 'raw_northwind'
    , generate_columns = 'True'
    , include_descriptions = 'True'
    , include_schema = 'True'
    , include_data_types = False
    ) }}