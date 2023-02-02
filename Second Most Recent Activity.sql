--https://www.youtube.com/watch?v=RljzVfz8vjk&list=PLBTZqjSKn0IfULLRo9Tm4lESxYMAG7fUQ&index=5

create table UserActivity
(
username      varchar(20) ,
activity      varchar(20),
startDate     Date   ,
endDate      Date
);

drop table UserActivity;

insert into UserActivity values ('Alice','Travel',TO_DATE('2020-02-12','YYYY-MM-DD'), TO_DATE('2020-02-20','YYYY-MM-DD'));
insert into UserActivity values ('Alice','Dancing',TO_DATE('2020-02-21','YYYY-MM-DD'), TO_DATE('2020-02-23','YYYY-MM-DD'));
insert into UserActivity values ('Alice','Travel',TO_DATE('2020-02-24','YYYY-MM-DD'), TO_DATE('2020-02-28','YYYY-MM-DD'));
insert into UserActivity values ('Bob','Travel',TO_DATE('2020-02-11','YYYY-MM-DD'), TO_DATE('2020-02-18','YYYY-MM-DD'));
commit;

select * from UserActivity;

with cte as (
select UserActivity.*, count(1) over(partition by username) as cnt, rank() over(partition by username order by startdate) as rnk
from UserActivity)
select * from cte where cnt = '1' or rnk = '2'
