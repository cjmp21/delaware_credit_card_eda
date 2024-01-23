
-- 1. understanding [delaware_credit_card_transactions] table

/*
with 
base as (
	select *
	from [dbo].[delaware_credit_card_transactions]
)

select top 1000 * --count(*), count(distinct concat(transaction_dt, merchandise_amount, merchant, div_name))
--distinct fiscal_year, fiscal_period
--distinct dept_name, div_name
--distinct merchant, category_description
from base
--order by fiscal_year, fiscal_period
--order by dept_name, div_name --dept_name incluye a div_name
--order by merchant, category_description --> category_description include merchant

-- transactions is de-normalized / to normalize it:
-- generate dim_division [div_code, div_name, dept_name],
--			dim_merchant [merchant_code, merchant, category_description]
--			dim_transaction_dt[transaction_dt, fiscal_year, fiscal_period]
--			fact_transactions [transaction_pk (concat(transaction_dt, merchandise_amount, merchant, div_name))]
*/


-- 2. understanding [dbo].[balance_sheets_fixed]
/*with base_balances as(
	select * from [dbo].[balance_sheets_fixed]
)

select *
from base_balances
*/
-- 3. understanding [dbo].[income_statements_fixed]

with income_statements as(
	select * from [delaware_database]..income_statements_fixed
)

select *
from income_statements
