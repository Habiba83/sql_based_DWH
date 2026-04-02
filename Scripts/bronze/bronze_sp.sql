CREATE OR ALTER PROCEDURE bronze.load_bronze_layer
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @start_time DATETIME,
            @end_time DATETIME,
            @duration INT;

    BEGIN TRY
        PRINT 'Starting Bronze Load...';
        --------------------------------------------------
        -- CRM CUSTOMER
        --------------------------------------------------
        SET @start_time = GETDATE();
        PRINT 'Loading crm_customer...';
        TRUNCATE TABLE bronze.crm_customer;
        BULK INSERT bronze.crm_customer
        FROM 'C:\Users\egypt\OneDrive\Desktop\DWH_PROJECT\Datasets\src1\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );

        SET @end_time = GETDATE();
        SET @duration = DATEDIFF(SECOND, @start_time, @end_time);
        PRINT 'crm_customer loaded in ' + CAST(@duration AS VARCHAR) + ' seconds';
        --------------------------------------------------
        -- CRM PRODUCT
        --------------------------------------------------
        SET @start_time = GETDATE();
        PRINT 'Loading crm_prd_info...';
        TRUNCATE TABLE bronze.crm_prd_info;
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\egypt\OneDrive\Desktop\DWH_PROJECT\Datasets\src1\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );

        SET @end_time = GETDATE();
        SET @duration = DATEDIFF(SECOND, @start_time, @end_time);
        PRINT 'crm_prd_info loaded in ' + CAST(@duration AS VARCHAR) + ' seconds';
        --------------------------------------------------
        -- CRM SALES
        --------------------------------------------------
        SET @start_time = GETDATE();
        PRINT 'Loading crm_sales_details...';
        TRUNCATE TABLE bronze.crm_sales_details;
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\egypt\OneDrive\Desktop\DWH_PROJECT\Datasets\src1\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );

        SET @end_time = GETDATE();
        SET @duration = DATEDIFF(SECOND, @start_time, @end_time);

        PRINT 'crm_sales_details loaded in ' + CAST(@duration AS VARCHAR) + ' seconds';
        --------------------------------------------------
        -- ERP CUSTOMER
        --------------------------------------------------
        SET @start_time = GETDATE();

        PRINT 'Loading erp_cust_az12...';

        TRUNCATE TABLE bronze.erp_cust_az12;

        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\egypt\OneDrive\Desktop\DWH_PROJECT\Datasets\src2\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );

        SET @end_time = GETDATE();
        SET @duration = DATEDIFF(SECOND, @start_time, @end_time);

        PRINT ' erp_cust_az12 loaded in ' + CAST(@duration AS VARCHAR) + ' seconds';

        --------------------------------------------------
        -- ERP LOCATION
        --------------------------------------------------
        SET @start_time = GETDATE();

        PRINT 'Loading erp_loc_a101...';

        TRUNCATE TABLE bronze.erp_loc_a101;

        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\egypt\OneDrive\Desktop\DWH_PROJECT\Datasets\src2\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );

        SET @end_time = GETDATE();
        SET @duration = DATEDIFF(SECOND, @start_time, @end_time);

        PRINT 'erp_loc_a101 loaded in ' + CAST(@duration AS VARCHAR) + ' seconds';
        --------------------------------------------------
        -- ERP CATEGORY
        --------------------------------------------------
        SET @start_time = GETDATE();

        PRINT 'Loading erp_px_cat_g1v2...';

        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\egypt\OneDrive\Desktop\DWH_PROJECT\Datasets\src2\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );

        SET @end_time = GETDATE();
        SET @duration = DATEDIFF(SECOND, @start_time, @end_time);

        PRINT 'erp_px_cat_g1v2 loaded in ' + CAST(@duration AS VARCHAR) + ' seconds';


        PRINT 'Bronze Load Completed Successfully';

    END TRY
    BEGIN CATCH

        DECLARE @error_message NVARCHAR(MAX) = ERROR_MESSAGE();

        PRINT 'ERROR OCCURRED: ' + @error_message;

    END CATCH
END;

EXEC bronze.load_bronze_layer;

