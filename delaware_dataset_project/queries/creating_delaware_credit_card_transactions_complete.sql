/*** creating final delaware dataset (delaware_credit_card_transactions_complete) ***/
with balance_sheets as (
	select *
	from [dbo].[balance_sheets_fixed]
)

, income_statements as (
	select *
	from [dbo].[income_statements_fixed]
)

, yf_symbols as (
	select *
	from [dbo].[delaware_dataset__yf_symbols]
)

, transactions as (
select *, year(transaction_dt) as transaction_year, month(transaction_dt) as transaction_month
from [dbo].[delaware_credit_card_transactions]
)

, transactions_join_1 as (
	select transactions.*, yf_symbols.yahoo_finance_symbol as company
	from transactions left join yf_symbols
		on transactions.merchant = yf_symbols.merchant
)

, transactions_joined_2 as (
select transactions_join_1.*, balance_sheets.*, income_statements.*
from transactions_join_1 
	left join balance_sheets
		on transactions_join_1.company = balance_sheets.balance_sheet_company
			and transactions_join_1.transaction_year = balance_sheets.balance_sheet_year
	left join income_statements
		on transactions_join_1.company = income_statements.income_statement_company
			and transactions_join_1.transaction_year = income_statements.income_statement_year
			and transactions_join_1.transaction_month = income_statements.income_statement_month
)

select *
into delaware_credit_card_transactions_complete
from transactions_joined_2

/*where (company is not null)
	and ((balance_sheet_year is not null) and
	(income_statement_year is not null))*/

-- total registros: 1.340.286
-- registros con company symbol: 121.298
-- registros con company symboly ( bal sheet o fin statements): 48.528
-- registros con company symbol y balance sheets: 45.654
-- registros con company symbol y fin statements: 17.982
-- registros con company symbol, bal sheet y fin statements: 15.108
;
create view delaware_credit_card_transactions_view 
as 

with yf_symbols as (
	select *
	from [dbo].[delaware_dataset__yf_symbols]
)

select transactions.*, yf_symbols.yahoo_finance_symbol as company
--into delaware_credit_card_transactions_w_symbol
from [delaware_credit_card_transactions] as transactions left join yf_symbols
	on transactions.merchant = yf_symbols.merchant

select *
from delaware_credit_card_transactions_w_symbol