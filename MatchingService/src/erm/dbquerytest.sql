insert into record (record_id) values (seq_record.nextval)

select * from record

insert into player (user_id, user_name, user_pw, user_location, user_phone, record_id) values ('aaa','aaa','aaa','a','a',10);
insert into player (user_id, user_name, user_pw, user_location, user_phone, record_id) values ('bbb','bbb','bbb','a','a',2);
insert into player (user_id, user_name, user_pw, user_location, user_phone, record_id) values ('fff','fff','fff','a','a',6);
insert into player (user_id, user_name, user_pw, user_location, user_phone, record_id) values ('ccc','ccc','ccc','a','a',3);
insert into player (user_id, user_name, user_pw, user_location, user_phone, record_id) values ('ddd','ddd','ddd','a','a',4);
insert into player (user_id, user_name, user_pw, user_location, user_phone, record_id) values ('eee','eee','eee','a','a',5);
insert into player (user_id, user_name, user_pw, user_location, user_phone, record_id) values ('ggg','ggg','ggg','a','a',7);
insert into player (user_id, user_name, user_pw, user_location, user_phone, record_id) values ('hhh','hhh','hhh','a','a',8);
insert into player (user_id, user_name, user_pw, user_location, user_phone, record_id) values ('iii','iii','iii','a','a',9);

insert into team (team_id, team_name, team_leader, team_score, team_manner, team_gametype)
values (seq_team.nextval, 'fb team1', 'aaa', 0, 0, '축구');

select * from player
select * from team

update player set team1=2, team1_flag=1 where user_id='aaa';
update player set team1=2, team1_flag=1 where user_id='bbb';
update player set team1=2, team1_flag=1 where user_id='ccc';
update player set team1=2, team1_flag=0 where user_id='ddd';
update player set team1=2, team1_flag=0 where user_id='eee';

update player set team1=-1 where user_id='iii';
update player set team1=-1 where user_id='fff';

update team set team_open=1 where team_id=2

select table_name, constraint_name, constraint_type from user_constraints;

select * from player where team1=2 order by user_name

