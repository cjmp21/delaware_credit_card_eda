/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
	cast([FISCAL_YEAR] as numeric) fiscal_year
      ,cast([FISCAL_PERIOD] as numeric) fiscal_period
      ,[DEPT_NAME] as dept_name
      ,[DIV_NAME] as div_name
      ,[MERCHANT] as merchant
      ,[CAT_DESCR] as category_description
      ,cast([TRANS_DT] as date) transaction_dt 
      ,cast([MERCHANDISE_AMT] as float(53)) merchandise_amount
INTO [delaware_database].[dbo].[delaware_credit_card_transactions]
FROM [delaware_database].[dbo].[State_Employee_Credit_Card_Transactions_20240109]