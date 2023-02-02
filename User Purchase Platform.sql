--https://www.youtube.com/watch?v=4MLVfsQEGl0&list=PLBTZqjSKn0IfULLRo9Tm4lESxYMAG7fUQ&index=7

create table spending 
(
user_id int,
spend_date date,
platform varchar(10),
amount int
);

insert into spending values(1,TO_DATE('2019-07-01','YYYY-MM-DD'),'mobile',100);
insert into spending values(1,TO_DATE('2019-07-01','YYYY-MM-DD'),'desktop',100);
insert into spending values(2,TO_DATE('2019-07-01','YYYY-MM-DD'),'mobile',100);
insert into spending values(2,TO_DATE('2019-07-02','YYYY-MM-DD'),'mobile',100);
insert into spending values(3,TO_DATE('2019-07-01','YYYY-MM-DD'),'desktop',100);
insert into spending values(3,TO_DATE('2019-07-02','YYYY-MM-DD'),'desktop',100);
commit;

select * from spending;

drop table spending;

with cte as (
select spend_date, user_id, max(platform) as platform, sum(amount) as amount 
from spending
group by spend_date, user_id having count(distinct platform) = 1
union all
select spend_date, user_id, 'both' as platform, sum(amount) as amount 
from spending
group by spend_date, user_id having count(distinct platform) = 2
union all
select distinct spend_date, null as user_id, 'both' as platform, 0 as amount 
from spending)

select spend_date, platform, sum(amount) as total_amount, count(distinct user_id) as total_users
from cte
group by spend_date, platform
order by spend_date, platform desc
