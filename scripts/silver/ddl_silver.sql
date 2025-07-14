/* 
This script creates all the tables we are going to need in the silver layers
*/

CREATE TABLE IF NOT EXISTS silver.crm_cust_info (
    cst_id int,
    cst_key varchar(50),
    cst_firstname varchar(50),
    cst_lastname varchar(50),
    cst_marital_status varchar(50),
    cst_gndr varchar(50),
    cst_create_date DATE,
    dwh_create_date DATE default CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS silver.crm_prd_info (
    prd_id int,
    cat_id varchar(50),
    prd_key varchar(50),
    prd_nm varchar(50),
    prd_cost int,
    prd_line char(50),
    prd_start_dt DATE,
    prd_end_dt DATE,
    dwh_create_date DATE default CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS silver.crm_sales_details (
    sls_ord_num varchar(50),
    sls_prd_key varchar(50),
    sls_cust_id int,
    sls_order_dt date,
    sls_ship_dt date,
    sls_due_dt date,
    sls_sales int,
    sls_quantity int,
    sls_price int,
    dwh_create_date DATE default CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS silver.erp_cust_az12 (
    cid    VARCHAR(50),
    bdate  DATE,
    gen    VARCHAR(50),
    dwh_create_date DATE default CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS silver.erp_px_cat_g1v2 (
    id           VARCHAR(50),
    cat          VARCHAR(50),
    subcat       VARCHAR(50),
    maintenance  VARCHAR(50),
    dwh_create_date DATE default CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS silver.erp_loc_a101 (
    cid    VARCHAR(50),
    cntry  VARCHAR(50),
    dwh_create_date DATE default CURRENT_DATE
);
