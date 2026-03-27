{{ config(materialized= 'table') }}
with tb1 as(
    select
    id,
    firstname,
    lastname
    from {{source('datafeed','raw_customerdata')}})
select * from tb1