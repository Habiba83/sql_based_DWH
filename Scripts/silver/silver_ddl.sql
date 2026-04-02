-- CRM CUSTOMER (SILVER)
IF OBJECT_ID('silver.crm_customer', 'U') IS NOT NULL
    DROP TABLE silver.crm_customer;
GO

CREATE TABLE silver.crm_customer (
    cst_id             INT,
    cst_key            NVARCHAR(50),
    cst_firstname      NVARCHAR(100),
    cst_lastname       NVARCHAR(100),
    cst_marital_status NVARCHAR(10),
    cst_gndr           NVARCHAR(10),
    cst_create_date    DATE,
    load_date          DATETIME DEFAULT GETDATE()
);
GO


-- CRM PRODUCT (SILVER)
IF OBJECT_ID('silver.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_prd_info;
GO

CREATE TABLE silver.crm_prd_info (
    prd_id        INT,
    prd_key       NVARCHAR(50),
    prd_nm        NVARCHAR(50),
    prd_cost      INT,
    prd_line      NVARCHAR(50),
    prd_start_dt  DATETIME,
    prd_end_dt    DATETIME,
    load_date     DATETIME DEFAULT GETDATE()
);
GO


-- CRM SALES (SILVER)
IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE silver.crm_sales_details;
GO

CREATE TABLE silver.crm_sales_details (
    sls_ord_num   NVARCHAR(50),
    sls_prd_key   NVARCHAR(50),
    sls_cust_id   INT,
    sls_order_dt  DATE,
    sls_ship_dt   DATE,
    sls_due_dt    DATE,
    sls_sales     INT,
    sls_quantity  INT,
    sls_price     INT,
    load_date     DATETIME DEFAULT GETDATE()
);
GO


-- ERP CUSTOMER (SILVER)
IF OBJECT_ID('silver.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE silver.erp_cust_az12;
GO

CREATE TABLE silver.erp_cust_az12 (
    cid        NVARCHAR(50),
    bdate      DATE,
    gen        NVARCHAR(50),
    load_date  DATETIME DEFAULT GETDATE()
);
GO


-- ERP LOCATION (SILVER)
IF OBJECT_ID('silver.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE silver.erp_loc_a101;
GO

CREATE TABLE silver.erp_loc_a101 (
    cid        NVARCHAR(50),
    cntry      NVARCHAR(50),
    load_date  DATETIME DEFAULT GETDATE()
);
GO


-- ERP PRODUCT CATEGORY (SILVER)
IF OBJECT_ID('silver.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE silver.erp_px_cat_g1v2;
GO

CREATE TABLE silver.erp_px_cat_g1v2 (
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(50),
    load_date    DATETIME DEFAULT GETDATE()
);
GO

ALTER TABLE silver.crm_sales_details
ALTER COLUMN sls_order_dt DATE;

