/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `COPY FROM` command to load data from csv Files to bronze tables.

Parameters:
    None.
	  This stored procedure does not accept any parameters or return any values.
*/

DROP PROCEDURE BRONZE.load_bronze();

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
    DECLARE
        start_time         time;
        end_time           TIME;
        batch_start_time   TIME;
        batch_end_time     TIME;
    BEGIN
        -- Batch start time
            batch_start_time := CURRENT_TIME;

            RAISE NOTICE '================================================';
            RAISE NOTICE 'Loading Bronze Layer';
            RAISE NOTICE '================================================';

            --crm_cust_info
            RAISE NOTICE '------------------------------------------------';
            RAISE NOTICE 'Loading CRM Tables';
            RAISE NOTICE '------------------------------------------------';

            start_time := current_time;
            RAISE NOTICE 'Truncating table: datewarehouse.bronze.crm_cust_info';
            TRUNCATE TABLE BRONZE.crm_cust_info;
            RAISE NOTICE 'Inserting data into table: datewarehouse.bronze.crm_cust_info';
            COPY BRONZE.crm_cust_info from '/opt/datasets/CRM/cust_info.csv'
            delimiter ','
            csv header;
            end_time := current_time;

            RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(seconds from  (end_time - start_time));


            --crm_prd_info
            start_time := current_time;
            RAISE NOTICE 'Truncating table: datewarehouse.bronze.crm_prd_info';
            TRUNCATE TABLE BRONZE.crm_prd_info;
            RAISE NOTICE 'Inserting data into table: datewarehouse.bronze.crm_prd_info';
            COPY BRONZE.crm_prd_info from '/opt/datasets/CRM/prd_info.csv'
            delimiter ','
            csv header;
            end_time := current_time;

            RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(seconds from (end_time - start_time));


            --crm_sales_details
            start_time := current_time;
            RAISE NOTICE 'Truncating table: datewarehouse.bronze.crm_sales_details';
            TRUNCATE TABLE BRONZE.crm_sales_details;
            RAISE NOTICE 'Inserting data into table: datewarehouse.bronze.crm_sales_details';
            COPY BRONZE.crm_sales_details from '/opt/datasets/CRM/sales_details.csv'
            delimiter ','
            csv header;
            end_time := current_time;

            RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(seconds from (end_time - start_time));


            --erp_CUST_AZ12
            start_time := current_time;
            RAISE NOTICE 'Truncating table: datewarehouse.bronze.erp_cust_az12';
            TRUNCATE TABLE BRONZE.erp_cust_az12;
            RAISE NOTICE 'Inserting data into table: datewarehouse.bronze.erp_cust_az12';
            COPY BRONZE.erp_cust_az12 from '/opt/datasets/ERP/CUST_AZ12.csv'
            delimiter ','
            csv header;
            end_time := current_time;

            RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(seconds from  (end_time - start_time));


            --erp_loc_a101
            start_time := current_time;
            RAISE NOTICE 'Truncating table: datewarehouse.bronze.erp_loc_a101';
            TRUNCATE TABLE BRONZE.erp_loc_a101;
            RAISE NOTICE 'Inserting data into table: datewarehouse.bronze.erp_loc_a101';
            COPY BRONZE.erp_loc_a101 from '/opt/datasets/ERP/LOC_A101.csv'
            delimiter ','
            csv header;
            end_time := current_time;

            RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(seconds from  (end_time - start_time));


            --erp_px_cat_g1v2
            start_time := current_time;
            RAISE NOTICE 'Truncating table: datewarehouse.bronze.erp_px_cat_g1v2';
            TRUNCATE TABLE BRONZE.erp_px_cat_g1v2;
            RAISE NOTICE 'Inserting data into table: datewarehouse.bronze.erp_px_cat_g1v2';
            COPY BRONZE.erp_px_cat_g1v2 from '/opt/datasets/ERP/PX_CAT_G1V2.csv'
            delimiter ','
            csv header;
            end_time := current_time;

            RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(seconds from (end_time - start_time));


            batch_end_time := CURRENT_TIME;

    EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error occurred while loading Bronze layer';
        RAISE NOTICE 'Error Message: %', SQLERRM;
        RAISE NOTICE 'Error Code: %', SQLSTATE;
        -- Optionally re-raise the error
        -- RAISE;
    END;
$$;

call load_bronze();

