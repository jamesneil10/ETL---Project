
# Guidelines for ETL Project

This document contains guidelines, requirements, and suggestions for Project 1.

## Project Proposal

Before you start writing any code, remember that you only have one week to complete this project. View this project as a typical assignment from work. Imagine a bunch of data came in and you and your team are tasked with migrating it to a production data base.

Take advantage of your Instructor and TA support during office hours and class project work time. They are a valuable resource and can help you stay on track.

## Finding Data

Your project must use 2 or more sources of data. We recommend the following sites to use as sources of data:

* [data.world](https://data.world/)

* [Kaggle](https://www.kaggle.com/)

You can also use APIs or data scraped from the web. However, get approval from your instructor first. Again, there is only a week to complete this!

## Data Cleanup & Analysis

Once you have identified your datasets, perform ETL on the data. Make sure to plan and document the following:

* The sources of data that you will extract from.

* The type of transformation needed for this data (cleaning, joining, filtering, aggregating, etc).

* The type of final production database to load the data into (relational or non-relational).

* The final tables or collections that will be used in the production database.

You will be required to submit a final technical report with the above information and steps required to reproduce your ETL process.

## Project Report

At the end of the week, your team will submit a Final Report that describes the following:

* **E**xtract: your original data sources and how the data was formatted (CSV, JSON, MySQL, etc).

* **T**ransform: what data cleaning or transformation was required.

* **L**oad: the final database, tables/collections, and why this was chosen.

Please upload the report to Github and submit a link to Bootcampspot.

- - -

### Example of  ETL  


```python
import pandas as pd
from sqlalchemy import create_engine
```


```python
# Store CSV into DataFrame
```


```python
csv_file = "./Resources/customer_data.csv"
customer_data_df = pd.read_csv(csv_file)
customer_data_df.head()
```


```python
# Create new data with select columns
```


```python
new_customer_data_df = customer_data_df[['id', 'first_name', 'last_name']].copy()
new_customer_data_df.head()
```


```python
# Store JSON data into a DataFrame
```


```python
json_file = "./Resources/customer_location.json"
customer_location_df = pd.read_json(json_file)
customer_location_df.head()
```


```python
# Clean DataFrame
```


```python
new_customer_location_df = customer_location_df[["id", "address", "us_state"]].copy()
new_customer_location_df.head()
```


```python
# Connect to local database
```


```python
rds_connection_string = "<inser user name>:<insert password>@127.0.0.1/customer_db"
engine = create_engine(f'mysql://{rds_connection_string}')
```


```python
# Check for tables
```


```python
engine.table_names()
```


```python
# Use pandas to load csv converted DataFrame into database
```


```python
new_customer_data_df.to_sql(name='customer_name', con=engine, if_exists='append', index=False)
```


```python
# Use pandas to load json converted DataFrame into database
```


```python
new_customer_location_df.to_sql(name='customer_location', con=engine, if_exists='append', index=False)
```


```python
# Confirm data has been added by querying the customer_name table
# NOTE: can also check using pgAdmin
```


```python
pd.read_sql_query('select * from customer_name', con=engine).head()
```


```python
# Confirm data has been added by querying the customer_location table
```


```python
pd.read_sql_query('select * from customer_location', con=engine).head()
```




```python

```


```python

```


```python

```


```python

```
