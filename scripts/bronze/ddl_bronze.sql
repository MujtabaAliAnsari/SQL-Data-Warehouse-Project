--DDL FOR BRONZE LAYER TABLES
--These scripts first check if the table exists and only creates the table when it does not already exist to avoid data loss

--CRM_CUST_INFO
create table IF NOT EXISTS CRM_CUST_INFO
(
    cst_id	Int	,
    cst_key	varchar	,
    cst_firstname	text	,
    cst_lastname	text	,
    cst_marital_status	text	,
    cst_gndr	text	,
    cst_create_date	date
);

--CRM_PRD_INFO
create table IF NOT EXISTS CRM_PRD_INFO
(
    prd_id       Int,
    prd_key      varchar,
    prd_nm       text,
    prd_cost     Int,
    prd_line     text,
    prd_start_dt date,
    prd_end_dt   date
);

--CRM_SALES_DETAILS
create table IF NOT EXISTS CRM_SALES_DETAILS
(
    sls_ord_num	varchar	,
    sls_prd_key	varchar	,
    sls_cust_id	int	,
    sls_order_dt	int	,
    sls_ship_dt	int	,
    sls_due_dt	int	,
    sls_sales	int	,
    sls_quantity	int	,
    sls_price	int
);

--ERP_CUST_AZ12
create table IF NOT EXISTS ERP_CUST_AZ12
(
    CID	varchar	,
    BDATE	date	,
    GEN	text
);

--ERP_LOC_A101
create table IF NOT EXISTS ERP_LOC_A101
(
    CID varchar,
    CNTRY text
);

--ERP_PX_CAT_G1V2
CREATE TABLE IF NOT EXISTS ERP_PX_CAT_G1V2
(
    ID TEXT,
    CAT TEXT,
    SUBCAT TEXT,
    MAINTENANCE TEXT
);
