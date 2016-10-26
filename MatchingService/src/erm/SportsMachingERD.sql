/* Drop Tables */

DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE MESSAGE CASCADE CONSTRAINTS;
DROP TABLE GAMES CASCADE CONSTRAINTS;
DROP TABLE GROUND_REVIEW CASCADE CONSTRAINTS;
DROP TABLE GROUNDS CASCADE CONSTRAINTS;
DROP TABLE MATCHING CASCADE CONSTRAINTS;
DROP TABLE PLAYER CASCADE CONSTRAINTS;
DROP TABLE RECORD CASCADE CONSTRAINTS;
DROP TABLE TEAM CASCADE CONSTRAINTS;


select * from message;

/* Create Sequences */

CREATE SEQUENCE SEQ_GROUND INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MATCHING INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_RECORD INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_BOARD INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_REPLY INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_GROUND_REVIEW INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MESSAGE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TEAM INCREMENT BY 1 START WITH 1;

drop sequence seq_message;

/* Create Tables */

CREATE TABLE BOARD
(
   BOARDNUM number primary key,
   TITLE varchar2(500 char) NOT NULL,
   CONTENT varchar2(4000 char) NOT NULL,
   -- 회원ID
   USER_ID varchar2(100 char) NOT NULL UNIQUE,
   INPUTDATE date NOT NULL,
   CATEGORY varchar2(100 char) NOT NULL
);

drop table games

CREATE TABLE GAMES
(
   -- 경기ID
   GAME_ID number(10) primary key,
   -- 경기종류
   GAME_TYPE varchar2(15) NOT NULL,
   LATITUDE varchar2(20 char) NOT NULL,--위도
   LONGITUDE varchar2(20 char) NOT NULL,--경도
   PLAYER1 varchar2(100 char) NOT NULL,
   PLAYER2 varchar2(100 char) NOT NULL,
   -- 승자ID
   WINNER_ID varchar2(20 char),
   -- 경기_무승부
   GAME_DRAW number(1),
   -- 경기_무효
   GAME_INVALIDITY number(1),
   -- 경기장ID
   GROUND_ID number(10),
   -- 결과입력 인증키(유저1)
   PLAYER1_KEY varchar2(6 char),
   -- 결과입력 인증키(유저2)
   PLAYER2_KEY varchar2(6 char)
);

drop table GROUNDS 

CREATE TABLE GROUNDS
(
   -- 경기장ID
   GROUND_ID number(10) primary key,
   -- 경기장_지역
   LATITUDE varchar2(20 char) NOT NULL,--위도
   LONGITUDE varchar2(20 char) NOT NULL,--경도
   -- 경기장_이름
   GROUND_NAME varchar2(20) NOT NULL,
   -- 경기장_전화번호
   GROUND_PHONE varchar2(15 char) NOT NULL,
   -- 경기장_주소
   GROUND_ADDRESS varchar2(50 char) NOT NULL
);

DROP TABLE GROUND_REVIEW

CREATE TABLE GROUND_REVIEW
(
   RVNUM number primary key,
   -- 경기장ID
   GROUND_ID number(10) NOT NULL,
   CONTENT varchar2(500 char) NOT NULL,
   -- 회원ID
   USER_ID varchar2(100 char) NOT NULL UNIQUE
);

DROP TABLE MATCHING

CREATE TABLE MATCHING
(
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
   LATITUDE varchar2(20 char) NOT NULL,--위도
   LONGITUDE varchar2(20 char) NOT NULL,--경도
   -- 매칭시작시간
   MATCHING_STARTTIME number(6) NOT NULL
);


CREATE TABLE MESSAGE
(
   MSGNUM number primary key,
   CONTENT varchar2(2000 char),
   -- 회원ID
   USER_ID varchar2(100 char) NOT NULL,
   -- 경기ID
   GAME_ID number(10) NOT NULL,
   INPUTDATE date
);

drop table message;


CREATE TABLE PLAYER
(
   USER_ID varchar2(100) primary key,
   USER_NAME varchar2(100) NOT NULL,
   USER_PW varchar2(30) NOT NULL,.
   USER_LOCATION varchar2(20) NOT NULL,
   USER_PHONE varchar2(15) NOT NULL,
   RECORD_ID number(5) NOT NULL,
   TEAM1 number default -1,
   TEAM1_FLAG number(1),
   TEAM2 number default -1,
   TEAM2_FLAG number(1),
   PP_SCORE number,
   BL_SCORE number,
   savefilename varchar2(100)
);

--alter table player add savefilename varchar2(100);

drop table player
delete player
delete record
drop table RECORD;
select * from RECORD;
select * from PLAYER

CREATE TABLE RECORD
(
   -- 승패ID
   RECORD_ID number(5) primary key,
   -- 축구_토탈
   FB_TOTAL number DEFAULT 0,
   -- 축구_승
   FB_WIN number DEFAULT 0,
   -- 축구_무승부
   FB_DRAW number DEFAULT 0,
   -- 농구_토탈
   BB_TOTAL number DEFAULT 0,
   -- 농구_승
   BB_WIN number DEFAULT 0,
   -- 농구_무승부
   BB_DRAW number DEFAULT 0,
   -- 탁구_토탈
   PP_TOTAL number DEFAULT 0,
   -- 탁구_승
   PP_WIN number DEFAULT 0,
   -- 탁구_무승부
   PP__DRAW number DEFAULT 0,
   -- 볼링_전체
   BL_TOTAL number DEFAULT 0,
   -- 볼링_승
   BL_WIN number DEFAULT 0,
   -- 볼링_무승부
   BL_DRAW number DEFAULT 0
);


CREATE TABLE REPLY
(
   REPLYNUM number primary key,
   BOARDNUM number NOT NULL,
   -- 회원ID
   USER_ID varchar2(100 char) NOT NULL UNIQUE,
   CONTENT varchar2(2000),
   INPUTDATE date
);


CREATE TABLE TEAM
(
   -- 팀ID
   TEAM_ID number primary key,
   -- 팀이름
   TEAM_NAME varchar2(500 char) NOT NULL,
   TEAM_LEADER varchar2(100 char) NOT NULL,
   -- 팀승점
   TEAM_SCORE number(5) NOT NULL,
   -- 팀매너점수
   TEAM_MANNER number(10) NOT NULL,
   -- 팀종목
   TEAM_GAMETYPE varchar2(10 char) NOT NULL,
   TEAM_TOTALGAME number,
   TEAM_WINGAME number,
   TEAM_DRAW number,
   -- 팀 모집여부
   TEAM_OPEN number(1)
);



/* Create Foreign Keys */

ALTER TABLE REPLY
   ADD FOREIGN KEY (BOARDNUM)
   REFERENCES BOARD (BOARDNUM)
;


ALTER TABLE MESSAGE
   ADD FOREIGN KEY (GAME_ID)
   REFERENCES GAMES (GAME_ID)
;


ALTER TABLE GAMES
   ADD FOREIGN KEY (GROUND_ID)
   REFERENCES GROUNDS (GROUND_ID)
;


ALTER TABLE GROUND_REVIEW
   ADD FOREIGN KEY (GROUND_ID)
   REFERENCES GROUNDS (GROUND_ID)
;


ALTER TABLE BOARD
   ADD FOREIGN KEY (USER_ID)
   REFERENCES PLAYER (USER_ID)
;


ALTER TABLE GROUND_REVIEW
   ADD FOREIGN KEY (USER_ID)
   REFERENCES PLAYER (USER_ID)
;


ALTER TABLE MESSAGE
   ADD FOREIGN KEY (USER_ID)
   REFERENCES PLAYER (USER_ID)
;


ALTER TABLE REPLY
   ADD FOREIGN KEY (USER_ID)
   REFERENCES PLAYER (USER_ID)
;


ALTER TABLE PLAYER
   ADD FOREIGN KEY (RECORD_ID)
   REFERENCES RECORD (RECORD_ID)
;


ALTER TABLE PLAYER
   ADD FOREIGN KEY (TEAM1)
   REFERENCES TEAM (TEAM_ID)
;


ALTER TABLE PLAYER
   ADD FOREIGN KEY (TEAM2)
   REFERENCES TEAM (TEAM_ID)
;





/* Comments */

COMMENT ON COLUMN BOARD.USER_ID IS '회원ID';
COMMENT ON COLUMN GAMES.GAME_ID IS '경기ID';
COMMENT ON COLUMN GAMES.GAME_TYPE IS '경기종류';
COMMENT ON COLUMN GAMES.WINNER_ID IS '승자ID';
COMMENT ON COLUMN GAMES.GAME_DRAW IS '경기_무승부';
COMMENT ON COLUMN GAMES.GAME_INVALIDITY IS '경기_무효';
COMMENT ON COLUMN GAMES.GROUND_ID IS '경기장ID';
COMMENT ON COLUMN GAMES.PLAYER1_KEY IS '결과입력 인증키(유저1)';
COMMENT ON COLUMN GAMES.PLAYER2_KEY IS '결과입력 인증키(유저2)';
COMMENT ON COLUMN GROUNDS.GROUND_ID IS '경기장ID';
COMMENT ON COLUMN GROUNDS.LOCATION IS '경기장_지역';
COMMENT ON COLUMN GROUNDS.GROUND_NAME IS '경기장_이름';
COMMENT ON COLUMN GROUNDS.GROUND_OWN IS '보유경기구장_수';
COMMENT ON COLUMN GROUNDS.GROUND_PHONE IS '경기장_전화번호';
COMMENT ON COLUMN GROUNDS.GROUND_ADDRESS IS '경기장_주소';
COMMENT ON COLUMN GROUND_REVIEW.GROUND_ID IS '경기장ID';
COMMENT ON COLUMN GROUND_REVIEW.USER_ID IS '회원ID';
COMMENT ON COLUMN MATCHING.MATCHING_ID IS '매칭_ID';
COMMENT ON COLUMN MATCHING.GAME_TYPE IS '운동종류';
COMMENT ON COLUMN MATCHING.GAME_DATE IS '경기일';
COMMENT ON COLUMN MATCHING.GAME_TIME IS '경기시간대';
COMMENT ON COLUMN MATCHING.GROUND_HOLD IS '경기장예약여부';
COMMENT ON COLUMN MATCHING.LOCATION IS '경기지역';
COMMENT ON COLUMN MATCHING.MATCHING_STARTTIME IS '매칭시작시간';
COMMENT ON COLUMN MESSAGE.USER_ID IS '회원ID';
COMMENT ON COLUMN MESSAGE.GAME_ID IS '경기ID';
COMMENT ON COLUMN PLAYER.USER_ID IS '회원ID';
COMMENT ON COLUMN PLAYER.USER_NAME IS '회원이름';
COMMENT ON COLUMN PLAYER.USER_PW IS '회원비밀번호';
COMMENT ON COLUMN PLAYER.USER_LOCATION IS '회원지역';
COMMENT ON COLUMN PLAYER.USER_PHONE IS '회원전화번호';
COMMENT ON COLUMN PLAYER.RECORD_ID IS '승패ID';
COMMENT ON COLUMN PLAYER.TEAM1 IS '팀ID';
COMMENT ON COLUMN PLAYER.TEAM1_FLAG IS '0 미승인
1 승인';
COMMENT ON COLUMN PLAYER.TEAM2 IS '팀ID';
COMMENT ON COLUMN RECORD.RECORD_ID IS '승패ID';
COMMENT ON COLUMN RECORD.FB_TOTAL IS '축구_토탈';
COMMENT ON COLUMN RECORD.FB_WIN IS '축구_승';
COMMENT ON COLUMN RECORD.FB_DRAW IS '축구_무승부';
COMMENT ON COLUMN RECORD.BB_TOTAL IS '농구_토탈';
COMMENT ON COLUMN RECORD.BB_WIN IS '농구_승';
COMMENT ON COLUMN RECORD.BB_DRAW IS '농구_무승부';
COMMENT ON COLUMN RECORD.PP_TOTAL IS '탁구_토탈';
COMMENT ON COLUMN RECORD.PP_WIN IS '탁구_승';
COMMENT ON COLUMN RECORD.PP__DRAW IS '탁구_무승부';
COMMENT ON COLUMN RECORD.BL_TOTAL IS '볼링_전체';
COMMENT ON COLUMN RECORD.BL_WIN IS '볼링_승';
COMMENT ON COLUMN RECORD.BL_DRAW IS '볼링_무승부';
COMMENT ON COLUMN REPLY.USER_ID IS '회원ID';
COMMENT ON COLUMN TEAM.TEAM_ID IS '팀ID';
COMMENT ON COLUMN TEAM.TEAM_NAME IS '팀이름';
COMMENT ON COLUMN TEAM.TEAM_SCORE IS '팀승점';
COMMENT ON COLUMN TEAM.TEAM_MANNER IS '팀매너점수';
COMMENT ON COLUMN TEAM.TEAM_GAMETYPE IS '팀종목';
COMMENT ON COLUMN TEAM.TEAM_OPEN IS '팀 모집여부';




