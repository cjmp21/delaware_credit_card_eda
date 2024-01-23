-- statistics from delaware_credit_card_transactions_complete
with base as (
select *
from delaware_credit_card_transactions_complete
)

--select max(transaction_dt)
--from base

select transaction_year
	, transaction_month
	, balance_sheet_year
	, income_statement_year
	, income_statement_month
	, count(*) as records
from base
group by transaction_year
	, transaction_month
	, balance_sheet_year
	, income_statement_year
	, income_statement_month
order by transaction_year
	, transaction_month
	, balance_sheet_year
	, income_statement_year
	, income_statement_month