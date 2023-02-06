create table activity (

 player_id     int     ,
 device_id     int     ,
 event_date    date    ,
 games_played  int
 );

 insert into activity values (1,2,TO_DATE('2016-03-01','YYYY-MM-DD'),5 );
 insert into activity values (1,2,TO_DATE('2016-03-02','YYYY-MM-DD'),6 );
 insert into activity values (2,3,TO_DATE('2017-06-25','YYYY-MM-DD'),1 );
 insert into activity values (3,1,TO_DATE('2016-03-02','YYYY-MM-DD'),0 );
 insert into activity values (3,4,TO_DATE('2018-07-03','YYYY-MM-DD'),5 );
commit;

 select * from activity;
 
 --game play analysis 1
 select player_id, min(event_date)
from activity
group by player_id;

--game play analysis 2
with cte as (
select player_id, device_id, row_number() over(partition by player_id order by event_date) as rn
from activity)
select player_id, max(device_id) as device_id
from cte
where rn = 1
group by player_id

drop table activity;
