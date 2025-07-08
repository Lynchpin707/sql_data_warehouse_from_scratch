Warning!! Use this with caution, if you don't have primary key or unique constraints.
This will create replicates.

create or replace procedure bronze.load_bronze()
LANGUAGE PLPGSQL
as $$
begin
	TRUNCATE TABLE bronze.crm_cust_info;
    TRUNCATE TABLE bronze.crm_prd_info;
    TRUNCATE TABLE bronze.crm_sales_details;
    TRUNCATE TABLE bronze.erp_cust_az12;
    TRUNCATE TABLE bronze.erp_loc_a101;
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;

	copy bronze.crm_cust_info from '/Users/mac/Desktop/data_warehouse_from_scratch/datasets/source_crm/cust_info.csv' delimiter ',' CSV header;
	
	copy bronze.crm_prd_info from '/Users/mac/Desktop/data_warehouse_from_scratch/datasets/source_crm/prd_info.csv' delimiter ',' CSV header;
	
	copy bronze.crm_sales_details from '/Users/mac/Desktop/data_warehouse_from_scratch/datasets/source_crm/sales_details.csv' delimiter ',' CSV header;
	
	copy bronze.erp_cust_az12 from '/Users/mac/Desktop/data_warehouse_from_scratch/datasets/source_erp/cust_az12.csv' delimiter ',' CSV header;
	
	copy bronze.erp_loc_a101 from '/Users/mac/Desktop/data_warehouse_from_scratch/datasets/source_erp/loc_a101.csv' delimiter ',' CSV header;
	
	copy bronze.erp_px_cat_g1v2 from '/Users/mac/Desktop/data_warehouse_from_scratch/datasets/source_erp/px_cat_g1v2.csv' delimiter ',' CSV header;
end;
$$;


-- Now you can call the procedure
Call procedure bronze.load_bronze();
