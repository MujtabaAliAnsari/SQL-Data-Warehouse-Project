--Run the below query to create a new database call DATAWAREHOUSE
CREATE DATABASE datawarehouse;

--Run the below query to create a schema which will be the bronze layer if it does not exist already
CREATE SCHEMA IF NOT EXISTS BRONZE;

--Run the below query to create a schema which will be the bronze layer if it does not exist already
CREATE SCHEMA IF NOT EXISTS SILVER;

--Run the below query to create a schema which will be the bronze layer if it does not exist already
CREATE SCHEMA IF NOT EXISTS GOLD;
