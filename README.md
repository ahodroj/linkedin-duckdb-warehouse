# linkedin-duckdb-warehouse
Micro personal DWH for your LinkedIn data

## Dependencies
LinkedIn account data (Connections.csv, invitations.csv, messages.csv) available on an S3/local MinIO endpoint (**make sure to edit your credentials**), or local filesystem


## ETL LinkedIn account data into DuckDB

1. Download your LinkdedIn Data archive (see [here](https://www.linkedin.com/help/linkedin/answer/a1339364/downloading-your-account-data))

2. Install duckdb
```bash
pip install duckdb 
```

3. Run the duckdb SQL init SQL file to populate the tables
```bash
duckdb -init duckdb-linkedin.sql -no-stdin linkedin.db
```

## Query your data
4. Open up the DuckDB database
```bas
duckdb linkedin.db
```

5. Query your data
```sql
select distinct(company), count(first_name) as contacts
  from connections
group by company
order by contacts desc;
```
Result: 
````
┌───────────────────────────┬──────────┐
│          company          │ contacts │
│          varchar          │  int64   │
├───────────────────────────┼──────────┤
│ Databricks                │      149 │
│ Amazon Web Services (AWS) │       24 │
│ Evernorth                 │       19 │
│ Cigna                     │       17 │
│ Microsoft                 │       12 │
.
.
.
````
## Running without S3
Just change the ```read_csv_auto()``` paths to local ones
