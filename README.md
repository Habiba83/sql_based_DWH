#  Data Warehouse Project (Bronze → Silver → Gold)

##  Overview

This project implements a complete **Data Warehouse pipeline** using SQL Server, following the Medallion Architecture:

* **Bronze Layer** → Raw data ingestion (CRM & ERP sources)
* **Silver Layer** → Data cleaning, transformation, and standardization
* **Gold Layer** → Business-ready star schema (Dimensions & Fact tables)

---

## Data Sources

###  CRM System

* `crm_customer`
* `crm_prd_info`
* `crm_sales_details`

###  ERP System

* `erp_cust_az12`
* `erp_loc_a101`
* `erp_px_cat_g1v2`

---

##  Bronze Layer (Raw Data)

* Stores raw data exactly as received
* Uses **BULK INSERT** for ingestion
* No transformations applied

---

## Silver Layer (Cleaned Data)

* Data cleaning and validation:

  * Trimmed strings
  * Data Enrichment
  * Standardized gender & marital status
  * Fixed invalid dates
* Deduplication using `ROW_NUMBER()`
* Derived columns (e.g., product categories, calculated sales)


##  Gold Layer (Business Model)

###  Dimensions

* `dim_customers`
* `dim_products`

### Fact Table

* `fact_sales`

---

##  Data Model (Star Schema)

* `fact_sales` links to:

  * `dim_customers`
  * `dim_products`

---

## ETL Process

### 1. Bronze Load

* Full load using:

  * `TRUNCATE + BULK INSERT`

### 2. Silver Load

* Transformation using:

  * `INSERT INTO ... SELECT`
* Includes:

  * Data cleaning
  * Standardization
  * Deduplication

### 3. Gold Layer

* Views built for analytics:

  * Customer dimension
  * Product dimension
  * Sales fact

---

## 🧪 Features Implemented

* ✅ Full ETL pipeline
* ✅ Error handling (TRY/CATCH)
* ✅ Performance tracking
* ✅ Data quality rules
* ✅ Star schema modeling

