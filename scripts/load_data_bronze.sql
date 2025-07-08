CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE
    total_start   TIMESTAMP;
    total_end     TIMESTAMP;
    start_time    TIMESTAMP;
    end_time      TIMESTAMP;
BEGIN
    total_start := clock_timestamp();

    RAISE NOTICE '--------------';
    RAISE NOTICE 'Loading tables';
    RAISE NOTICE '--------------';

    BEGIN
        -- crm_cust_info
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating table: crm_cust_info ';
        TRUNCATE TABLE bronze.crm_cust_info;
        RAISE NOTICE '>> Inserting data into: crm_cust_info';
        COPY bronze.crm_cust_info FROM '/Users/mac/Desktop/data_warehouse_from_scratch/datasets/source_crm/cust_info.csv' DELIMITER ',' CSV HEADER;
        end_time := clock_timestamp();
        RAISE NOTICE '⏱ crm_cust_info loaded in %.3f seconds', EXTRACT(EPOCH FROM end_time - start_time);

        -- crm_prd_info
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating table: crm_prd_info ';
        TRUNCATE TABLE bronze.crm_prd_info;
        RAISE NOTICE '>> Inserting data into: crm_prd_info';
        COPY bronze.crm_prd_info FROM '/Users/mac/Desktop/data_warehouse_from_scratch/datasets/source_crm/prd_info.csv' DELIMITER ',' CSV HEADER;
        end_time := clock_timestamp();
        RAISE NOTICE '⏱ crm_prd_info loaded in %.3f seconds', EXTRACT(EPOCH FROM end_time - start_time);

        -- crm_sales_details
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating table: crm_sales_details ';
        TRUNCATE TABLE bronze.crm_sales_details;
        RAISE NOTICE '>> Inserting data into: crm_sales_details';
        COPY bronze.crm_sales_details FROM '/Users/mac/Desktop/data_warehouse_from_scratch/datasets/source_crm/sales_details.csv' DELIMITER ',' CSV HEADER;
        end_time := clock_timestamp();
        RAISE NOTICE '⏱ crm_sales_details loaded in %.3f seconds', EXTRACT(EPOCH FROM end_time - start_time);

        -- erp_cust_az12
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating table: erp_cust_az12 ';
        TRUNCATE TABLE bronze.erp_cust_az12;
        RAISE NOTICE '>> Inserting data into: erp_cust_az12';
        COPY bronze.erp_cust_az12 FROM '/Users/mac/Desktop/data_warehouse_from_scratch/datasets/source_erp/cust_az12.csv' DELIMITER ',' CSV HEADER;
        end_time := clock_timestamp();
        RAISE NOTICE '⏱ erp_cust_az12 loaded in %.3f seconds', EXTRACT(EPOCH FROM end_time - start_time);

        -- erp_loc_a101
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating table: erp_loc_a101 ';
        TRUNCATE TABLE bronze.erp_loc_a101;
        RAISE NOTICE '>> Inserting data into: erp_loc_a101';
        COPY bronze.erp_loc_a101 FROM '/Users/mac/Desktop/data_warehouse_from_scratch/datasets/source_erp/loc_a101.csv' DELIMITER ',' CSV HEADER;
        end_time := clock_timestamp();
        RAISE NOTICE '⏱ erp_loc_a101 loaded in %.3f seconds', EXTRACT(EPOCH FROM end_time - start_time);

        -- erp_px_cat_g1v2
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating table: erp_px_cat_g1v2 ';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        RAISE NOTICE '>> Inserting data into: erp_px_cat_g1v2';
        COPY bronze.erp_px_cat_g1v2 FROM '/Users/mac/Desktop/data_warehouse_from_scratch/datasets/source_erp/px_cat_g1v2.csv' DELIMITER ',' CSV HEADER;
        end_time := clock_timestamp();
        RAISE NOTICE '⏱ erp_px_cat_g1v2 loaded in %.3f seconds', EXTRACT(EPOCH FROM end_time - start_time);

        RAISE NOTICE '--------------------------';
        RAISE NOTICE 'Tables loaded successfully';
        RAISE NOTICE '--------------------------';

    EXCEPTION
        WHEN OTHERS THEN
            RAISE NOTICE '-----------------------------------------';
            RAISE NOTICE 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
            RAISE NOTICE '-----------------------------------------';
            RAISE NOTICE 'Error message: %', SQLERRM;
    END;

    total_end := clock_timestamp();
    RAISE NOTICE 'Total load time: %.3f seconds', EXTRACT(EPOCH FROM total_end - total_start);
END;
$$;


-- now you can call the procedure using 
call bronze.load_bronze();	
