-- defining most important companies by transaction 
with base_ as (
select *
from [delaware_credit_card_transactions]
)

, calculations as (
	select *
	, count(merchandise_amount) over(partition by merchant) as transactions
	, sum(merchandise_amount) over(partition by merchant) as amount
	from base_
)

, grouped_data as (
	select merchant, max(transactions) as transactions, max(amount) as amount
	from calculations
	group by merchant
)

, sum_total as (
select sum(transactions) as total_transactions, sum(amount) as total_amount
from grouped_data
)

select top 200 merchant, transactions, amount
	, (select total_transactions from sum_total) as total_transactions
	, (select total_amount from sum_total) as total_amount
from grouped_data
order by transactions desc, amount desc, merchant