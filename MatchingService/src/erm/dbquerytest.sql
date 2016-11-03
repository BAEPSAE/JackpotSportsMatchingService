--제일먼저
insert into record (record_id) values (seq_record.nextval);
insert into record (record_id) values (seq_record.nextval);
insert into record (record_id) values (seq_record.nextval);
insert into record (record_id) values (seq_record.nextval);
insert into record (record_id) values (seq_record.nextval);
insert into record (record_id) values (seq_record.nextval);
insert into record (record_id) values (seq_record.nextval);
insert into record (record_id) values (seq_record.nextval);
insert into record (record_id) values (seq_record.nextval);
insert into record (record_id) values (seq_record.nextval);

select * from record
--유저 넣기
insert into player (user_id, user_name, user_pw, user_location, user_phone, record_id) values ('aaa','aaa','aaa','a','a',1);
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

insert into matching values (seq_matching.nextval, 'bbb', 100, 1, '2016/11/1', 3, 0, 0, 0, sysdate);
insert into matching values (seq_matching.nextval, 'ccc', 120, 1, '2016/11/1', 3, 0, 0, 0, sysdate);
insert into matching values (seq_matching.nextval, 'ddd', 50, 1, '2016/11/1', 3, 0, 0, 0, sysdate);
insert into matching values (seq_matching.nextval, 'eee', 200, 1, '2016/11/1', 3, 0, 0, 0, sysdate);
insert into matching values (seq_matching.nextval, 'fff', 260, 1, '2016/11/1', 3, 0, 0, 0, sysdate);
insert into matching values (seq_matching.nextval, 'ggg', 150, 1, '2016/11/1', 3, 0, 0, 0, sysdate);
insert into matching values (seq_matching.nextval, 'hhh', 110, 1, '2016/11/1', 3, 0, 0, 0, sysdate);
insert into matching values (seq_matching.nextval, 'iii', 0, 1, '2016/11/1', 3, 0, 0, 0, sysdate);


CREATE TABLE MATCHING(
   -- 매칭_ID
   MATCHING_ID number(10) primary key,
   PLAYER varchar2(100 char) NOT NULL,
   SCORE number,
   -- 운동종류
   GAME_TYPE varchar2(10 char) NOT NULL,
   -- 경기일
   GAME_DATE date NOT NULL,
   -- 경기시간대
   GAME_TIME number(2),
   -- 경기장예약여부
   GROUND_HOLD number(1),
   -- 경기지역
   LATITUDE varchar2(100 char) NOT NULL,--위도
   LONGITUDE varchar2(100 char) NOT NULL,--경도
   -- 이 시간까지 매칭안되면 강제매칭 시작하는 시간
   MATCHING_TIME date NOT NULL
);





