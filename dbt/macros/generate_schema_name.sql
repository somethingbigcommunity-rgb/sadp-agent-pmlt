{% macro generate_schema_name(custom_schema_name, node) -%}
    {{ dpu_schema_name.generate_schema_name(custom_schema_name, node, dev_dataset_prefix=env_var('DEV_DATASET_PREFIX', default='')) }}
{%- endmacro %}
