CREATE TABLE GAMES(
   -- 경기ID
   GAME_ID number(10) primary key,
   -- 경기종류동작구
   GAME_TYPE varchar2(15) NOT NULL,
   --경기하는 시간
   GAME_TIME number NOT NULL,
   PLAYER1 varchar2(100 char) NOT NULL,
   P1_LATITUDE varchar2(20 char),
   P1_LONGITUDE varchar2(20 char),--경도
   PLAYER2 varchar2(100 char) NOT NULL,
   P2_LATITUDE varchar2(20 char),--위도
   P2_LONGITUDE varchar2(20 char),--경도
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

/*DROP SEQUENCE*/
DROP SEQUENCE SEQ_GROUND;
DROP SEQUENCE SEQ_MATCHING;
DROP SEQUENCE SEQ_RECORD;
DROP SEQUENCE SEQ_BOARD;
DROP SEQUENCE SEQ_REPLY;
DROP SEQUENCE SEQ_GROUND_REVIEW;
DROP SEQUENCE SEQ_MESSAGE;
DROP SEQUENCE SEQ_TEAM;
DROP SEQUENCE SEQ_GAMES;
DROP SEQUENCE SEQ_NOTICE;

/*CREATE SEQUENCE*/
CREATE SEQUENCE SEQ_GROUND INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MATCHING INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_RECORD INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_BOARD INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_REPLY INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_GROUND_REVIEW INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MESSAGE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TEAM INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_GAMES INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_NOTICE INCREMENT BY 1 START WITH 1;

--//---------- 기록 ----------//--
--축구
--LEADER
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 52, 8, 110, 52, 8, 110, 40, 6, 110, 40, 6);  --1
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 59, 1, 110, 59, 1, 110, 51, 7, 100, 51, 7);  --2
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 61, 9, 120, 61, 9, 120, 57, 1, 120, 57, 1);  --3
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 80, 57, 4, 80, 57, 4, 80, 50, 4, 80, 50, 4);  --4
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 90, 36, 3, 90, 36, 3, 90, 70, 3, 90, 70, 3);  --5
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 100, 49, 4, 100, 49, 4, 100, 50, 7, 100, 50, 7);  --6
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 99, 40, 5, 99, 40, 5, 70, 48, 0, 70, 48, 0);    --7
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 58, 4, 120, 58, 4, 11, 6, 0, 11, 6, 0);    --8
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 67, 48, 2, 67, 48, 2, 67, 18, 2, 67, 18, 2);    --9
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 51, 25, 6, 51, 25, 6, 44, 19, 7, 44, 19, 7);  --10
--MEMBER
--TEAM1
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 52, 8, 0, 0, 0, 110, 59, 1, 110, 59, 1); --1_1
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 52, 8, 0, 0, 0, 120, 61, 9, 120, 61, 9);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 52, 8, 0, 0, 0, 80, 57, 4, 80, 57, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 52, 8, 0, 0, 0, 90, 36, 3, 90, 36, 3);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 52, 8, 0, 0, 0, 100, 49, 4, 100, 49, 4);  --1_5
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 52, 8, 0, 0, 0, 99, 40, 5, 99, 40, 5);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 52, 8, 0, 0, 0, 120, 58, 4, 120, 58, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 52, 8, 0, 0, 0, 67, 48, 2, 67, 48, 2); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 52, 8, 0, 0, 0, 51, 25, 6, 51, 25, 6); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 52, 8, 0, 0, 0, 44, 19, 7, 44, 19, 7); --1_10
--TEAM2
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 59, 1, 0, 0, 0, 110, 40, 6, 110, 40, 6); --2_1
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 59, 1, 0, 0, 0, 110, 51, 7, 100, 51, 7);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 59, 1, 0, 0, 0, 120, 57, 1, 120, 57, 1);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 59, 1, 0, 0, 0, 80, 50, 4, 80, 50, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 59, 1, 0, 0, 0, 90, 70, 3, 90, 70, 3);  --2_5
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 59, 1, 0, 0, 0, 100, 50, 7, 100, 50, 7);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 59, 1, 0, 0, 0, 120, 58, 4, 120, 58, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 59, 1, 0, 0, 0, 11, 6, 0, 11, 6, 0); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 59, 1, 0, 0, 0, 67, 18, 2, 67, 18, 2); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 110, 59, 1, 0, 0, 0, 44, 19, 7, 44, 19, 7); --2_10
--TEAM3
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 61, 9, 0, 0, 0, 99, 59, 1, 99, 59, 1); --3_1
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 61, 9, 0, 0, 0, 80, 61, 9, 80, 61, 9);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 61, 9, 0, 0, 0, 100, 57, 4, 100, 57, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 61, 9, 0, 0, 0, 98, 36, 3, 98, 36, 3);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 61, 9, 0, 0, 0, 99, 49, 4, 99, 49, 4);  --3_5
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 61, 9, 0, 0, 0, 88, 40, 5, 88, 40, 5);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 61, 9, 0, 0, 0, 110, 58, 4, 110, 58, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 61, 9, 0, 0, 0, 85, 48, 2, 85, 48, 2); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 61, 9, 0, 0, 0, 56, 25, 6, 56, 25, 6); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 61, 9, 0, 0, 0, 48, 19, 7, 48, 19, 7); --3_10
--TEAM4
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 80, 57, 4, 0, 0, 0, 120, 59, 1, 120, 59, 1); --4_1
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 80, 57, 4, 0, 0, 0, 110, 61, 9, 110, 61, 9);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 80, 57, 4, 0, 0, 0, 120, 57, 4, 120, 57, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 80, 57, 4, 0, 0, 0, 80, 36, 3, 80, 36, 3);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 80, 57, 4, 0, 0, 0, 90, 49, 4, 90, 49, 4);  --4_5
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 80, 57, 4, 0, 0, 0, 100, 40, 5, 100, 40, 5);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 80, 57, 4, 0, 0, 0, 99, 58, 4, 99, 58, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 80, 57, 4, 0, 0, 0, 120, 48, 2, 120, 48, 2); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 80, 57, 4, 0, 0, 0, 67, 25, 6, 67, 25, 6); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 80, 57, 4, 0, 0, 0, 51, 19, 7, 51, 19, 7); --4_10
--TEAM5
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 90, 36, 3, 0, 0, 0, 80, 59, 1, 80, 59, 1); --5_1
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 90, 36, 3, 0, 0, 0, 90, 61, 9, 90, 61, 9);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 90, 36, 3, 0, 0, 0, 100, 57, 4, 100, 57, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 90, 36, 3, 0, 0, 0, 99, 36, 3, 99, 36, 3);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 90, 36, 3, 0, 0, 0, 120, 49, 4, 120, 49, 4);  --5_5
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 90, 36, 3, 0, 0, 0, 67, 40, 5, 67, 40, 5);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 90, 36, 3, 0, 0, 0, 61, 58, 4, 61, 58, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 90, 36, 3, 0, 0, 0, 51, 48, 2, 51, 48, 2); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 90, 36, 3, 0, 0, 0, 110, 25, 6, 110, 25, 6); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 90, 36, 3, 0, 0, 0, 120, 19, 7, 120, 19, 7); --5_10
--TEAM6
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 100, 49, 4, 0, 0, 0, 111, 59, 1, 111, 59, 1); --6_1
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 100, 49, 4, 0, 0, 0, 121, 61, 9, 121, 61, 9);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 100, 49, 4, 0, 0, 0, 81, 57, 4, 81, 57, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 100, 49, 4, 0, 0, 0, 88, 36, 3, 88, 36, 3);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 100, 49, 4, 0, 0, 0, 99, 49, 4, 99, 49, 4);  --6_5
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 100, 49, 4, 0, 0, 0, 95, 40, 5, 95, 40, 5);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 100, 49, 4, 0, 0, 0, 100, 58, 4, 100, 58, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 100, 49, 4, 0, 0, 0, 60, 48, 2, 60, 48, 2); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 100, 49, 4, 0, 0, 0, 54, 25, 6, 54, 25, 6); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 100, 49, 4, 0, 0, 0, 41, 19, 7, 41, 19, 7); --6_10
--TEAM7
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 99, 40, 5, 0, 0, 0, 110, 59, 1, 110, 59, 1); --7_1
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 99, 40, 5, 0, 0, 0, 110, 61, 9, 110, 61, 9);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 99, 40, 5, 0, 0, 0, 120, 57, 4, 120, 57, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 99, 40, 5, 0, 0, 0, 80, 36, 3, 80, 36, 3);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 99, 40, 5, 0, 0, 0, 90, 49, 4, 90, 49, 4);  --7_5
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 99, 40, 5, 0, 0, 0, 100, 40, 5, 100, 40, 5);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 99, 40, 5, 0, 0, 0, 99, 58, 4, 99, 58, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 99, 40, 5, 0, 0, 0, 120, 48, 2, 120, 48, 2); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 99, 40, 5, 0, 0, 0, 67, 25, 6, 67, 25, 6); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 99, 40, 5, 0, 0, 0, 51, 19, 7, 51, 19, 7); --7_10
--TEAM8
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 58, 4, 0, 0, 0, 100, 59, 1, 100, 59, 1); --8_1
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 58, 4, 0, 0, 0, 100, 61, 9, 100, 61, 9);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 58, 4, 0, 0, 0, 100, 57, 4, 100, 57, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 58, 4, 0, 0, 0, 100, 36, 3, 100, 36, 3);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 58, 4, 0, 0, 0, 100, 49, 4, 100, 49, 4);  --8_5
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 58, 4, 0, 0, 0, 100, 40, 5, 100, 40, 5);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 58, 4, 0, 0, 0, 100, 58, 4, 100, 58, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 58, 4, 0, 0, 0, 100, 48, 2, 100, 48, 2); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 58, 4, 0, 0, 0, 100, 25, 6, 100, 25, 6); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 120, 58, 4, 0, 0, 0, 100, 19, 7, 100, 19, 7); --8_10
--TEAM9
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 67, 48, 2, 0, 0, 0, 99, 59, 1, 99, 59, 1); --9_1
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 67, 48, 2, 0, 0, 0, 100, 61, 9, 100, 61, 9);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 67, 48, 2, 0, 0, 0, 60, 57, 4, 60, 57, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 67, 48, 2, 0, 0, 0, 70, 36, 3, 70, 36, 3);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 67, 48, 2, 0, 0, 0, 90, 49, 4, 90, 49, 4);  --9_5
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 67, 48, 2, 0, 0, 0, 89, 40, 5, 89, 40, 5);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 67, 48, 2, 0, 0, 0, 98, 58, 4, 98, 58, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 67, 48, 2, 0, 0, 0, 55, 48, 2, 55, 48, 2); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 67, 48, 2, 0, 0, 0, 40, 25, 6, 40, 25, 6); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 67, 48, 2, 0, 0, 0, 34, 19, 7, 34, 19, 7); --19_10
--TEAM10
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 51, 25, 6, 0, 0, 0, 120, 59, 1, 120, 59, 1); --10_1
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 51, 25, 6, 0, 0, 0, 130, 61, 9, 130, 61, 9);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 51, 25, 6, 0, 0, 0, 90, 57, 4, 90, 57, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 51, 25, 6, 0, 0, 0, 100, 36, 3, 100, 36, 3);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 51, 25, 6, 0, 0, 0, 110, 49, 4, 110, 49, 4);  --10_5
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 51, 25, 6, 0, 0, 0, 109, 40, 5, 109, 40, 5);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 51, 25, 6, 0, 0, 0, 130, 58, 4, 130, 58, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 51, 25, 6, 0, 0, 0, 77, 48, 2, 77, 48, 2); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 51, 25, 6, 0, 0, 0, 61, 25, 6, 61, 25, 6); 
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 51, 25, 6, 0, 0, 0, 55, 19, 7, 55, 19, 7); --10_10
--개인(110~114)
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 0, 0, 0, 0, 0, 0, 110, 61, 1, 110, 61, 1);
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 0, 0, 0, 0, 0, 0, 120, 59, 9, 120, 59, 9);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 0, 0, 0, 0, 0, 0, 80, 36, 4, 80, 36, 4);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 0, 0, 0, 0, 0, 0, 90, 57, 3, 90, 57, 3);  
INSERT INTO RECORD VALUES(SEQ_RECORD.NEXTVAL, 0, 0, 0, 0, 0, 0, 100, 63, 4, 100, 63, 4); 

SELECT*FROM RECORD;
--//---------- 팀 ----------//--
--축구팀
INSERT INTO TEAM VALUES(SEQ_TEAM.NEXTVAL, '나랑사커자', 'USER1', 313, 100, '축구', 110, 52, 8, 1); --1
INSERT INTO TEAM VALUES(SEQ_TEAM.NEXTVAL, 'KFC(코리아풋볼클럽)', 'USER2', 321, 100, '축구', 110, 59, 1, 1); 
INSERT INTO TEAM VALUES(SEQ_TEAM.NEXTVAL, '애미야공좀다오', 'EmiyaGonhzomdao', 149, 100, '축구', 120, 61, 9, 1); 
INSERT INTO TEAM VALUES(SEQ_TEAM.NEXTVAL, '포도씨유나이티드', 'podo', 197, 100, '축구', 80, 57, 4, 1);
INSERT INTO TEAM VALUES(SEQ_TEAM.NEXTVAL, '차구차구', 'bulbada', 265, 100, '축구', 90, 36, 3, 1); --5
INSERT INTO TEAM VALUES(SEQ_TEAM.NEXTVAL, '축구배고프구', 'soCold', 177, 100, '축구', 100, 49, 4, 1);
INSERT INTO TEAM VALUES(SEQ_TEAM.NEXTVAL, '왕십리조기축구', 'closeToMaHome', 290, 100, '축구', 99, 40, 5, 1);
INSERT INTO TEAM VALUES(SEQ_TEAM.NEXTVAL, '공도차고숨도차고', 'FC', 222, 100, '축구', 120, 58, 4, 1); 
INSERT INTO TEAM VALUES(SEQ_TEAM.NEXTVAL, '축구싶냐', 'FeelSoGood', 97, 100, '축구', 67, 48, 2, 1);
INSERT INTO TEAM VALUES(SEQ_TEAM.NEXTVAL, '맨체스터윤아짱', '폭주흑염소', 132, 100, '축구', 51, 25, 6, 1); --10


--//---------- 플레이어 ----------//--
--TEAM1
INSERT INTO PLAYER VALUES('USER1', '관리자', '1111', '강남구', '010-xxxx-1234', 1, 1, 1, NULL, 0, 321, 321, 'SAVEFILENAME', 100); --1
  --USER1의 회원들
    INSERT INTO PLAYER VALUES('USER3', '가을의전설', '1111', '광진구', '010-xxxx-0000', 11, 1, 1, NULL, 0, 91, 91, 'SAVEFILENAME', 100);
    INSERT INTO PLAYER VALUES('USER4', '난앓아요', '1111', '동대문구', '010-xxxx-0000', 12, 1, 1, NULL, 0, 115, 115, 'SAVEFILENAME', 100);
    INSERT INTO PLAYER VALUES('USER5', '김호모', '1111', '동대문구', '010-xxxx-0000', 13, 1, 1, NULL, 0, 156, 156, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER6', '팔도강산명민', '1111', '강남구', '010-xxxx-0000', 14, 1, 1, NULL, 0, 224, 224, 'SAVEFILENAME', 100); --5
    INSERT INTO PLAYER VALUES('USER7', '착한만수', '1111', '강남구', '010-xxxx-0000', 15, 1, 1, NULL, 0, 267, 267, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER8', '백마탄환자', '1111', '송파구', '010-xxxx-0000', 16, 1, 1, NULL, 0, 244, 244, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER9', '앙ㅁr', '1111', '광진구', '010-xxxx-0000', 17, 1, 1, NULL, 0, 265, 265, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER10', '캘로그콘프로토스', '1111', '광진구', '010-xxxx-0000', 18, 1, 1, NULL, 0, 222, 222, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER11', '해리포터와죽음의성', '1111', '광진구', '010-xxxx-0000', 19, 1, 1, NULL, 0, 300, 300, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER12', '안주로도마뱀', '1111', '송파구', '010-xxxx-0000', 20, 1, 1, NULL, 0, 278, 278, 'SAVEFILENAME', 100); --10

--TEAM2
INSERT INTO PLAYER VALUES('USER2', '부관리자', '1111', '강동구', '010-xxxx-0000', 2, 2, 1, NULL, 0, 333, 333, 'SAVEFILENAME', 100); --2
 --USER12의 회원들
    INSERT INTO PLAYER VALUES('USER13', '톱과젤리', '1111', '성동구', '010-xxxx-0000', 21, 2, 1, NULL, 0, 99, 99, 'SAVEFILENAME', 100); --1
    INSERT INTO PLAYER VALUES('USER14', '송해손잡고벽을넘어서', '1111', '성동구', '010-xxxx-0000', 22, 2, 1, NULL, 0, 116, 116, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER15', '최양을피하는방법', '1111', '강동구', '010-xxxx-0000', 23, 2, 1, NULL, 0, 148, 148, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER16', '화려한', '1111', '강동구', '010-xxxx-0000', 24, 2, 1, NULL, 0, 221, 221, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER17', '한말하면잔소리', '1111', '성동구', '010-xxxx-0000', 25, 2, 1, NULL, 0, 254, 254, 'SAVEFILENAME', 100); --5
    INSERT INTO PLAYER VALUES('USER18', '퓨Zl티', '1111', '성동구', '010-xxxx-0000', 26, 2, 1, NULL, 0, 242, 242, 'SAVEFILENAME', 100);
    INSERT INTO PLAYER VALUES('USER19', '본햏', '1111', '강동구', '010-xxxx-0000', 27, 2, 1, NULL, 0, 211, 211, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER20', '마스터도넛', '1111', '강동구', '010-xxxx-0000', 28, 2, 1, NULL, 0, 289, 289, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER21', '발렌타인게이', '1111', '강동구', '010-xxxx-0000', 29, 2, 1, NULL, 0, 311, 311, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER22', '뱁새', '1111', '강동구', '010-xxxx-0000', 30, 2, 1, NULL, 0, 266, 266, 'SAVEFILENAME', 100); --10

--TEAM3
INSERT INTO PLAYER VALUES('EmiyaGonhzomdao', 'EmiyaGonhzomdao', '1111', '강북구', '010-xxxx-0000', 3, 3, 1, NULL, 0, 301, 310, 'SAVEFILENAME', 100); --3
 --USER41의 회원들
    INSERT INTO PLAYER VALUES('USER23', '제이케이롤링', '1111', '성북구', '010-xxxx-0000', 31, 3, 1, NULL, 0, 111, 111, 'SAVEFILENAME', 100); --1
    INSERT INTO PLAYER VALUES('USER24', 'CookieWithYesJam', '1111', '성북구', '010-xxxx-0000', 32, 3, 1, NULL, 0, 138, 138, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER25', 'noMoreMoney', '1111', '성북구', '010-xxxx-0000', 33, 3, 1, NULL, 0, 152, 152, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER26', '원할머니머니', '1111', '도봉구', '010-xxxx-0000', 34, 3, 1, NULL, 0, 198, 198, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER27', '박잼잼', '1111', '도봉구', '010-xxxx-0000', 35, 3, 1, NULL, 0, 206, 206, 'SAVEFILENAME', 100); --5
    INSERT INTO PLAYER VALUES('USER28', '고기반찬', '1111', '도봉구', '010-xxxx-0000', 36, 3, 1, NULL, 0, 264, 264, 'SAVEFILENAME', 100);
    INSERT INTO PLAYER VALUES('USER29', '호식탐탐', '1111', '강북구', '010-xxxx-0000', 37, 3, 1, NULL, 0, 235, 235, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER30', '피땀눈물', '1111', '강북구', '010-xxxx-00000', 38, 3, 1, NULL, 0, 222, 222, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER31', '21세기소녀', '1111', '강북구', '010-xxxx-0000', 39, 3, 1, NULL, 0, 277, 277, 'SAVEFILENAME', 100); 
    INSERT INTO PLAYER VALUES('USER32', 'AmIWrong', '1111', '강북구', '010-xxxx-0000', 40, 3, 1, NULL, 0, 332, 332, 'SAVEFILENAME', 100); --10

--TEAM4
INSERT INTO PLAYER VALUES('podo', 'podo', '1111', '강서구', '010-xxxx-0000', 4, 4, 1, NULL, 0, 100, 100, 'SAVEFILENAME', 100); --4
--TEAM5
INSERT INTO PLAYER VALUES('bulbada', 'bulbada', '1111', '관악구', '010-xxxx-0000', 5, 5, 1, NULL, 0, 150, 150, 'SAVEFILENAME', 100); --5
--TEAM6
INSERT INTO PLAYER VALUES('soCold', 'soCold', '1111', '구로구', '010-xxxx-0000', 6, 6, 1, NULL, 0, 200, 200, 'SAVEFILENAME', 100); --6
--TEAM7
INSERT INTO PLAYER VALUES('closeToMaHome', 'closeToMaHome', '1111', '금천구', '010-xxxx-0000', 7, 7, 1, NULL, 0, 250, 250, 'SAVEFILENAME', 100); --7
--TEAM8
INSERT INTO PLAYER VALUES('FC', 'FC', '1111', '금천구', '010-xxxx-0000', 8, 8, 1, NULL, 0, 300, 300, 'SAVEFILENAME', 100); --8
--TEAM9
INSERT INTO PLAYER VALUES('FeelSoGood', 'FeelSoGood', '1111', '노원구', '010-xxxx-0000', 9, 9, 1, NULL, 0, 222, 222, 'SAVEFILENAME', 100); --9
--TEAM10
INSERT INTO PLAYER VALUES('폭주흑염소', '폭주흑염소', '1111', '도봉구', '010-xxxx-0000', 10, 10, 1, NULL, 0, 255, 255, 'SAVEFILENAME', 100); --10

--//어느 팀에도 속하지 않은 플레이어들 -18명
INSERT INTO PLAYER VALUES('USER110', '관리계정', '1111', '중랑구', '010-xxxx-0000', 110, NULL, 0, NULL, 0, 210, 210, 'SAVEFILENAME', 100);
INSERT INTO PLAYER VALUES('USER111', '온힘을다하면', '1111', '중랑구', '010-xxxx-0000', 111, NULL, 0, NULL, 0, 220, 220, 'SAVEFILENAME', 100);
INSERT INTO PLAYER VALUES('USER112', '전우주가힘을준다', '1111', '중랑구', '010-xxxx-0000', 112, NULL, 0, NULL, 0, 180, 180, 'SAVEFILENAME', 100);
INSERT INTO PLAYER VALUES('USER113', '전체를보면', '1111', '중랑구', '010-xxxx-0000', 113, NULL, 0, NULL, 0, 190, 190, 'SAVEFILENAME', 100);
INSERT INTO PLAYER VALUES('USER114', '그런기운이느껴진다', '1111', '중랑구', '010-xxxx-0000', 114, NULL, 0, NULL, 0, 200, 200, 'SAVEFILENAME', 100);

--//---------- 매칭 ----------//--
--//---------- GAMES ----------//--
--//-----매칭 성사
--축구
INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '축구', 1, 'USER1', '37.54787686233251', '127.08435088150107', 'bulbada', '37.57436912043878', '127.09009971641049', 'USER1', 0, 0, 11461932, '1234', '5678');
INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '축구', 2, 'USER1', '37.54787686233251', '127.08435088150107', 'soCold', '37.55113414523998', '127.12225637304209', 'USER1', 0, 0, 17558011, '1111', '2222');
INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '축구', 3, 'USER1', '37.54787686233251', '127.08435088150107', 'USER2', '37.54787686233251', '127.08435088150107', 'USER1', 0, 0, 11585948, '1234', '5678');
INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '축구', 4, 'USER1', '37.54787686233251', '127.08435088150107', 'EmiyaGonhzomdao', '37.54787686233251', '127.08435088150107', 'USER1', 0, 0, 11585948, '1111', '2222');
INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '축구', 5, 'USER1', '37.54787686233251', '127.08435088150107', 'podo', '37.54787686233251', '127.08435088150107', 'USER1', 0, 0, 11585948, '3333', '4444');
INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '축구', 1, 'USER1', '37.54787686233251', '127.08435088150107', 'closeToMaHome', '37.55113414523998', '127.12225637304209', 'USER1', 0, 0, 17558011, '3333', '4444');
INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '축구', 1, 'USER1', '37.54787686233251', '127.08435088150107', 'FC', '37.55113414523998', '127.12225637304209', 'USER1', 0, 0, 17558011, '1234', '5678');
INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '축구', 1, 'USER1', '37.54787686233251', '127.08435088150107', 'FeelSoGood', '37.55113414523998', '127.12225637304209', 'USER1', 0, 0, 17558011, '1111', '2222');
INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '축구', 2, 'USER1', '37.54787686233251', '127.08435088150107', '폭주흑염소', '37.55113414523998', '127.12225637304209', 'USER1', 0, 0, 17558011, '3333', '4444');
--탁구
--INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '탁구', (SELECT GAME_TIME FROM MATCHING WHERE PLAYER IN('USER1', 'USER23') AND LATITUDE IS NOT NULL), 'USER1', '37.50313626197912', '127.06830898419253', 'USER12', NULL, NULL, NULL, NULL, NULL, NULL, '1234', '5678');
--INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '탁구', (SELECT GAME_TIME FROM MATCHING WHERE PLAYER IN('USER1', 'USER24') AND LATITUDE IS NOT NULL), 'USER41', '37.64850453317693', '127.04099715412745', 'USER42', NULL, NULL, NULL, NULL, NULL, NULL, '1111', '2222');
--INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '탁구', (SELECT GAME_TIME FROM MATCHING WHERE PLAYER IN('USER1', 'USER25') AND LATITUDE IS NOT NULL), 'USER68', '37.545796593884816', '126.88487681627713', 'USER79', NULL, NULL, NULL, NULL, NULL, NULL, '3333', '4444');
--INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '탁구', (SELECT GAME_TIME FROM MATCHING WHERE PLAYER IN('USER1', 'USER26') AND LATITUDE IS NOT NULL), 'USER1', '37.50313626197912', '127.06830898419253', 'USER12', NULL, NULL, NULL, NULL, NULL, NULL, '1234', '5678');
--INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '탁구', (SELECT GAME_TIME FROM MATCHING WHERE PLAYER IN('USER1', 'USER27') AND LATITUDE IS NOT NULL), 'USER41', '37.64850453317693', '127.04099715412745', 'USER42', NULL, NULL, NULL, NULL, NULL, NULL, '1111', '2222');
--INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '탁구', (SELECT GAME_TIME FROM MATCHING WHERE PLAYER IN('USER1', 'USER28') AND LATITUDE IS NOT NULL), 'USER68', '37.545796593884816', '126.88487681627713', 'USER79', NULL, NULL, NULL, NULL, NULL, NULL, '3333', '4444');
--INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '탁구', (SELECT GAME_TIME FROM MATCHING WHERE PLAYER IN('USER1', 'USER29') AND LATITUDE IS NOT NULL), 'USER1', '37.50313626197912', '127.06830898419253', 'USER12', NULL, NULL, NULL, NULL, NULL, NULL, '1234', '5678');
--INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '탁구', (SELECT GAME_TIME FROM MATCHING WHERE PLAYER IN('USER1', 'USER31') AND LATITUDE IS NOT NULL), 'USER41', '37.64850453317693', '127.04099715412745', 'USER42', NULL, NULL, NULL, NULL, NULL, NULL, '1111', '2222');
--INSERT INTO GAMES VALUES(SEQ_GAMES.NEXTVAL, '탁구', (SELECT GAME_TIME FROM MATCHING WHERE PLAYER IN('USER1', 'USER32') AND LATITUDE IS NOT NULL), 'USER68', '37.545796593884816', '126.88487681627713', 'USER79', NULL, NULL, NULL, NULL, NULL, NULL, '3333', '4444');
--//---------- GROUND_REVIEW ----------//--
--SELECT*FROM GROUND_REVIEW;
INSERT INTO GROUND_REVIEW VALUES(SEQ_GROUND_REVIEW.NEXTVAL, 11585948, '누군가 사용료를 내면 일반인은 이용할 수 없어요ㅠ', 'USER1');
INSERT INTO GROUND_REVIEW VALUES(SEQ_GROUND_REVIEW.NEXTVAL, 11585948, '관리가 잘 되어있음!', 'bulbada');
INSERT INTO GROUND_REVIEW VALUES(SEQ_GROUND_REVIEW.NEXTVAL, 11585948, '주말만 쓸수 있어서 불편...', 'EmiyaGonhzomdao');
INSERT INTO GROUND_REVIEW VALUES(SEQ_GROUND_REVIEW.NEXTVAL, 11585948, '잔디가짱짱함', 'FeelSoGood');

--//---------- NOTICE ----------//--
--//축구 성사

--//---------- MESSAGE ----------//--

--//---------- BOARD ----------//--

--//---------- REPLY ----------//--
