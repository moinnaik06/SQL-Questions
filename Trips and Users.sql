Create table test_trips (id int, client_id int, driver_id int, city_id int, status varchar(50), request_at varchar(50));

Create table test_users (users_id int, banned varchar(50), role varchar(50));

select * from test_trips;

select * from test_users;

Truncate table test_trips;

insert into test_trips (id, client_id, driver_id, city_id, status, request_at) values ('1', '1', '10', '1', 'completed',TO_DATE('2013-10-01','YYYY-MM-DD'));
insert into test_trips (id, client_id, driver_id, city_id, status, request_at) values ('2', '2', '11', '1', 'cancelled_by_driver',TO_DATE('2013-10-01','YYYY-MM-DD'));
insert into test_trips (id, client_id, driver_id, city_id, status, request_at) values ('3', '3', '12', '6', 'completed',TO_DATE('2013-10-01','YYYY-MM-DD'));
insert into test_trips (id, client_id, driver_id, city_id, status, request_at) values ('4', '4', '13', '6', 'cancelled_by_client',TO_DATE('2013-10-01','YYYY-MM-DD'));
insert into test_trips (id, client_id, driver_id, city_id, status, request_at) values ('5', '1', '10', '1', 'completed',TO_DATE('2013-10-02','YYYY-MM-DD'));
insert into test_trips (id, client_id, driver_id, city_id, status, request_at) values ('6', '2', '11', '6', 'completed',TO_DATE('2013-10-02','YYYY-MM-DD'));
insert into test_trips (id, client_id, driver_id, city_id, status, request_at) values ('7', '3', '12', '6', 'completed',TO_DATE('2013-10-02','YYYY-MM-DD'));
insert into test_trips (id, client_id, driver_id, city_id, status, request_at) values ('8', '2', '12', '12', 'completed',TO_DATE('2013-10-03','YYYY-MM-DD'));
insert into test_trips (id, client_id, driver_id, city_id, status, request_at) values ('9', '3', '10', '12', 'completed',TO_DATE('2013-10-03','YYYY-MM-DD'));
insert into test_trips (id, client_id, driver_id, city_id, status, request_at) values ('10', '4', '13', '12', 'cancelled_by_driver',TO_DATE('2013-10-03','YYYY-MM-DD'));
commit;

insert into test_users (users_id, banned, role) values ('1', 'No', 'client');
insert into test_users (users_id, banned, role) values ('2', 'Yes', 'client');
insert into test_users (users_id, banned, role) values ('3', 'No', 'client');
insert into test_users (users_id, banned, role) values ('4', 'No', 'client');
insert into test_users (users_id, banned, role) values ('10', 'No', 'driver');
insert into test_users (users_id, banned, role) values ('11', 'No', 'driver');
insert into test_users (users_id, banned, role) values ('12', 'No', 'driver');
insert into test_users (users_id, banned, role) values ('13', 'No', 'driver');
commit;
