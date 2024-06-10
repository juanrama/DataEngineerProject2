# learn_dbt

STILL DEVELOP ON DOCKERFILE BECAUSE THERE IS SOME TROUBLE



## How to run it? (temporary)
### Load Data
```
1. Make database
make database namely db_project_2
```
2. run insert_data.py


### Running DBT
```
1. build the postgres image
```
docker build -t postgres -f Dockerfile.postgres .W
```
2. run postgres container
if you want to check the result on local (uncomment first the EXPOSE command on dockerfile postgres)
```
docker run -d -p 5432:5432 --name postgres postgres
```
3. debug your dbt connection
```
dbt debug --profiles-dir ./ --project-dir dbt_dskola_project
```
4. run dbt model
```
dbt run --profiles-dir ./ --project-dir dbt_dskola_project
```
5. generate dbt docs
```
dbt docs generate --profiles-dir ./ --project-dir dbt_dskola_project
```
6. serve dbt docs
```
dbt docs serve --profiles-dir ./ --project-dir dbt_dskola_project
```
