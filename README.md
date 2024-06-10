## How to run it? 
### Create and Load Database
```
1. Create database
run insert_data.py
```

### Running DBT

1. debug your dbt connection
```
dbt debug --profiles-dir ./ --project-dir dbt_dskola_project
```
2. run dbt model
```
dbt run --profiles-dir ./ --project-dir dbt_dskola_project
```
3. generate dbt docs
```
dbt docs generate --profiles-dir ./ --project-dir dbt_dskola_project
```
4. serve dbt docs
```
dbt docs serve --profiles-dir ./ --project-dir dbt_dskola_project
```
