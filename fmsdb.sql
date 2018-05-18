--------------------------------------------------------
--  File created - Sunday-May-06-2018   
--------------------------------------------------------
--------------------------------------------------------
--  Drop DDL 
--------------------------------------------------------

drop SEQUENCE faculty_id;
drop SEQUENCE subject_id;
drop SEQUENCE student_id;
drop SEQUENCE blog_id;
drop SEQUENCE leave_id;
drop SEQUENCE semdetails_id;
drop SEQUENCE stactivity_id;
drop SEQUENCE document_id;
drop SEQUENCE timetable_id;
drop SEQUENCE lab_id;
drop SEQUENCE lecture_id;
drop SEQUENCE like_id;
drop SEQUENCE notice_id;
drop Table notice;
drop Table likes;
drop Table lecture;
drop Table lab;
drop Table timetable;
drop Table document;
drop Table stactivity;
drop Table semdetails;
drop Table leave;
drop Table blogs;
drop Table student;
drop Table subject;
drop Table faculty;

--------------------------------------------------------
--  DDL for Sequence BLOG_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FMS"."BLOG_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DOCUMENT_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FMS"."DOCUMENT_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence FACULTY_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FMS"."FACULTY_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 161 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LAB_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FMS"."LAB_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LEAVE_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FMS"."LEAVE_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LECTURE_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FMS"."LECTURE_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LIKE_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FMS"."LIKE_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence NOTICE_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FMS"."NOTICE_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEMDETAILS_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FMS"."SEMDETAILS_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence STACTIVITY_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FMS"."STACTIVITY_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence STUDENT_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FMS"."STUDENT_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1101 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SUBJECT_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FMS"."SUBJECT_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TIMETABLE_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FMS"."TIMETABLE_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BLOGS
--------------------------------------------------------

  CREATE TABLE "FMS"."BLOGS" 
   (	"B_ID" NUMBER(5,0), 
	"F_ID" VARCHAR2(10 BYTE), 
	"PHOTO" VARCHAR2(50 BYTE), 
	"DETAILS" VARCHAR2(100 BYTE), 
	"SUBJECT" VARCHAR2(15 BYTE), 
	"POSTDATE" DATE, 
	"LIKED" NUMBER(3,0) DEFAULT '0', 
	"UNLIKED" NUMBER(3,0) DEFAULT '0'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table DOCUMENT
--------------------------------------------------------

  CREATE TABLE "FMS"."DOCUMENT" 
   (	"D_ID" VARCHAR2(10 BYTE), 
	"F_ID" VARCHAR2(10 BYTE), 
	"SNAME" VARCHAR2(10 BYTE), 
	"DNAME" VARCHAR2(200 BYTE), 
	"DTYPE" VARCHAR2(10 BYTE), 
	"DEXET" VARCHAR2(5 BYTE), 
	"DSIZE" NUMBER(6,4), 
	"SPECIFICATION" VARCHAR2(50 BYTE) DEFAULT ''
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table FACULTY
--------------------------------------------------------

  CREATE TABLE "FMS"."FACULTY" 
   (	"F_ID" VARCHAR2(10 BYTE), 
	"PASSWORD" VARCHAR2(10 BYTE), 
	"FNAME" VARCHAR2(12 BYTE), 
	"MNAME" VARCHAR2(12 BYTE), 
	"LNAME" VARCHAR2(12 BYTE), 
	"DOB" DATE, 
	"MOB" VARCHAR2(10 BYTE), 
	"EMAIL" VARCHAR2(30 BYTE), 
	"PHOTO" VARCHAR2(50 BYTE), 
	"JOINDATE" DATE, 
	"QUELI" VARCHAR2(50 BYTE), 
	"EXPERIANCE" NUMBER(2,0), 
	"SALARY" NUMBER(6,0), 
	"ROLE" VARCHAR2(20 BYTE) DEFAULT 'assiprof', 
	"SEQ_Q_A" VARCHAR2(50 BYTE), 
	"SPECIAL" VARCHAR2(50 BYTE), 
	"STATUS" VARCHAR2(5 BYTE) DEFAULT 'false'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LAB
--------------------------------------------------------

  CREATE TABLE "FMS"."LAB" 
   (	"LA_ID" NUMBER(5,0), 
	"SRNO" NUMBER(2,0), 
	"BATCH" VARCHAR2(3 BYTE), 
	"F_ID" VARCHAR2(10 BYTE), 
	"S_ID" VARCHAR2(10 BYTE), 
	"LOCATION" VARCHAR2(10 BYTE), 
	"STIME" VARCHAR2(20 BYTE), 
	"ETIME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LEAVE
--------------------------------------------------------

  CREATE TABLE "FMS"."LEAVE" 
   (	"L_ID" NUMBER(6,0), 
	"F_ID" VARCHAR2(10 BYTE), 
	"STARTDATE" DATE, 
	"ENDDATE" DATE, 
	"TOTALDAYS" NUMBER(2,0), 
	"TYPE" VARCHAR2(30 BYTE), 
	"REASON" VARCHAR2(50 BYTE), 
	"STATUS" VARCHAR2(10 BYTE) DEFAULT 'false'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LECTURE
--------------------------------------------------------

  CREATE TABLE "FMS"."LECTURE" 
   (	"LE_ID" NUMBER(5,0), 
	"SRNO" NUMBER(2,0), 
	"F_ID" VARCHAR2(10 BYTE), 
	"S_ID" VARCHAR2(10 BYTE), 
	"STIME" VARCHAR2(20 BYTE), 
	"ETIME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LIKES
--------------------------------------------------------

  CREATE TABLE "FMS"."LIKES" 
   (	"LI_ID" NUMBER(10,0), 
	"B_ID" NUMBER(5,0), 
	"F_ID" VARCHAR2(10 BYTE), 
	"LIKES" NUMBER(1,0) DEFAULT '1'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "FMS"."NOTICE" 
   (	"NI_ID" NUMBER(10,0), 
	"TITLE" VARCHAR2(20 BYTE), 
	"SUBJECT" VARCHAR2(70 BYTE), 
	"DATA" VARCHAR2(250 BYTE), 
	"SENDDATE" VARCHAR2(12 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SEMDETAILS
--------------------------------------------------------

  CREATE TABLE "FMS"."SEMDETAILS" 
   (	"SED_ID" VARCHAR2(10 BYTE), 
	"ST_ID" VARCHAR2(10 BYTE), 
	"SEM" VARCHAR2(4 BYTE), 
	"BATCH" VARCHAR2(2 BYTE), 
	"ROLLNO" VARCHAR2(10 BYTE), 
	"STATUS" VARCHAR2(10 BYTE) DEFAULT 'deactive'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table STACTIVITY
--------------------------------------------------------

  CREATE TABLE "FMS"."STACTIVITY" 
   (	"STA_ID" VARCHAR2(10 BYTE), 
	"SED_ID" VARCHAR2(10 BYTE), 
	"S_ID" VARCHAR2(10 BYTE), 
	"EXAM" VARCHAR2(10 BYTE), 
	"MARKS" NUMBER(2,0) DEFAULT '0', 
	"TLAB" NUMBER(2,0) DEFAULT '0', 
	"GLAB" NUMBER(2,0) DEFAULT '0', 
	"TLEC" NUMBER(2,0) DEFAULT '0', 
	"GLEC" NUMBER(2,0) DEFAULT '0', 
	"STATUS" VARCHAR2(2 BYTE) DEFAULT 'pr'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------

  CREATE TABLE "FMS"."STUDENT" 
   (	"ST_ID" VARCHAR2(10 BYTE), 
	"FNAME" VARCHAR2(12 BYTE), 
	"MNAME" VARCHAR2(12 BYTE), 
	"LNAME" VARCHAR2(12 BYTE), 
	"DOB" DATE, 
	"MOBNO" VARCHAR2(12 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"ADMDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SUBJECT
--------------------------------------------------------

  CREATE TABLE "FMS"."SUBJECT" 
   (	"S_ID" VARCHAR2(10 BYTE), 
	"SCODE" VARCHAR2(15 BYTE), 
	"SNAME" VARCHAR2(50 BYTE), 
	"ALIAS" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TIMETABLE
--------------------------------------------------------

  CREATE TABLE "FMS"."TIMETABLE" 
   (	"SRNO" NUMBER(2,0), 
	"DAY" VARCHAR2(20 BYTE), 
	"SEMESTER" VARCHAR2(4 BYTE), 
	"DIVISION" VARCHAR2(2 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into FMS.BLOGS
SET DEFINE OFF;
Insert into FMS.BLOGS (B_ID,F_ID,PHOTO,DETAILS,SUBJECT,POSTDATE,LIKED,UNLIKED) values (6,'hod111','photo/6.jpg','Always be calm','Lecture',to_date('02-MAY-18','DD-MON-RR'),0,1);
Insert into FMS.BLOGS (B_ID,F_ID,PHOTO,DETAILS,SUBJECT,POSTDATE,LIKED,UNLIKED) values (7,'hod111','photo/7.jpg','Always be calm','Lecture',to_date('02-MAY-18','DD-MON-RR'),0,0);
Insert into FMS.BLOGS (B_ID,F_ID,PHOTO,DETAILS,SUBJECT,POSTDATE,LIKED,UNLIKED) values (8,'hod111','photo/8.jpg','Always be calm','Lecture',to_date('02-MAY-18','DD-MON-RR'),0,0);
Insert into FMS.BLOGS (B_ID,F_ID,PHOTO,DETAILS,SUBJECT,POSTDATE,LIKED,UNLIKED) values (9,'hod111','photo/9.jpg','Always be calm','Lecture',to_date('02-MAY-18','DD-MON-RR'),0,1);
REM INSERTING into FMS.DOCUMENT
SET DEFINE OFF;
Insert into FMS.DOCUMENT (D_ID,F_ID,SNAME,DNAME,DTYPE,DEXET,DSIZE,SPECIFICATION) values ('1','hod111','wcf','Subbu Allamaraju - RESTful Web Services Cookbook_ Solutions for Improving Scalability and Simplicity (2010, Yahoo Press).pdf','File','pdf',2.2355,'restful api');
Insert into FMS.DOCUMENT (D_ID,F_ID,SNAME,DNAME,DTYPE,DEXET,DSIZE,SPECIFICATION) values ('2','hod111','ds','traversalofabinarytree-111224121555-phpapp02.pdf','File','pdf',0.2417,'tree traversal');
Insert into FMS.DOCUMENT (D_ID,F_ID,SNAME,DNAME,DTYPE,DEXET,DSIZE,SPECIFICATION) values ('3','hod111','python','David M. Beazley-Python essential reference-Sams_ Pearson Education [distributor] (2006).pdf','File','pdf',2.3269,'startup in python');
REM INSERTING into FMS.FACULTY
SET DEFINE OFF;
Insert into FMS.FACULTY (F_ID,PASSWORD,FNAME,MNAME,LNAME,DOB,MOB,EMAIL,PHOTO,JOINDATE,QUELI,EXPERIANCE,SALARY,ROLE,SEQ_Q_A,SPECIAL,STATUS) values ('adm101','adm1234','Bhavika','M','Gambhava',to_date('01-JAN-85','DD-MON-RR'),'9876543210','bhavika@gmail.com','photo\adm101.jpg',to_date('01-JAN-09','DD-MON-RR'),'B.TECH',2,50000,'admprof','Favorite_Color_red','digital circuit,computer network','TRUE');
Insert into FMS.FACULTY (F_ID,PASSWORD,FNAME,MNAME,LNAME,DOB,MOB,EMAIL,PHOTO,JOINDATE,QUELI,EXPERIANCE,SALARY,ROLE,SEQ_Q_A,SPECIAL,STATUS) values ('assi102','assi1234','Jigar','M','Pandya',to_date('02-JAN-83','DD-MON-RR'),'8765432109','jigar@gmail.com','photo\assi102.jpg',to_date('02-JAN-10','DD-MON-RR'),'M.TECH',2,50000,'assiprof','Favorite_Color_red','c,java','TRUE');
Insert into FMS.FACULTY (F_ID,PASSWORD,FNAME,MNAME,LNAME,DOB,MOB,EMAIL,PHOTO,JOINDATE,QUELI,EXPERIANCE,SALARY,ROLE,SEQ_Q_A,SPECIAL,STATUS) values ('assi103','assi1234','Apurva','A','Maheta',to_date('03-JAN-87','DD-MON-RR'),'7654321098','apurva@gmail.com','photo\assi103.jpg',to_date('03-JAN-11','DD-MON-RR'),'M.TECH',2,50000,'assiprof','Favorite_Color_red','php,dm','TRUE');
Insert into FMS.FACULTY (F_ID,PASSWORD,FNAME,MNAME,LNAME,DOB,MOB,EMAIL,PHOTO,JOINDATE,QUELI,EXPERIANCE,SALARY,ROLE,SEQ_Q_A,SPECIAL,STATUS) values ('assi104','assi1234','Pinkal','C','Chauhan',to_date('04-JAN-89','DD-MON-RR'),'9543210987','pinkal@gmail.com','photo\assi104.jpg',to_date('04-JAN-14','DD-MON-RR'),'M.TECH',2,50000,'assiprof','Favorite_Color_red','algoritham','TRUE');
Insert into FMS.FACULTY (F_ID,PASSWORD,FNAME,MNAME,LNAME,DOB,MOB,EMAIL,PHOTO,JOINDATE,QUELI,EXPERIANCE,SALARY,ROLE,SEQ_Q_A,SPECIAL,STATUS) values ('assi105','assi1234','Shaifali','P','Malukani',to_date('05-JAN-83','DD-MON-RR'),'9432109876','shaifali@gmail.com','photo\assi105.jpg',to_date('05-JAN-11','DD-MON-RR'),'M.TECH',2,50000,'assiprof','Favorite_Color_red','computer network','TRUE');
Insert into FMS.FACULTY (F_ID,PASSWORD,FNAME,MNAME,LNAME,DOB,MOB,EMAIL,PHOTO,JOINDATE,QUELI,EXPERIANCE,SALARY,ROLE,SEQ_Q_A,SPECIAL,STATUS) values ('assi106','assi1234','Vivek','S','Patel',to_date('06-JAN-87','DD-MON-RR'),'9321098765','vivek@gmail.com','photo\assi106.jpg',to_date('06-JAN-12','DD-MON-RR'),'M.TECH',2,50000,'assiprof','Favorite_Color_red','data structure,digital circuit','TRUE');
Insert into FMS.FACULTY (F_ID,PASSWORD,FNAME,MNAME,LNAME,DOB,MOB,EMAIL,PHOTO,JOINDATE,QUELI,EXPERIANCE,SALARY,ROLE,SEQ_Q_A,SPECIAL,STATUS) values ('assi107','assi1234','Parth','R','Dave',to_date('07-JAN-87','DD-MON-RR'),'9210987654','parth@gmail.com','photo\assi107.jpg',to_date('07-JAN-12','DD-MON-RR'),'M.TECH',2,50000,'assiprof','Favorite_Color_red','data structure,microprocessor','TRUE');
Insert into FMS.FACULTY (F_ID,PASSWORD,FNAME,MNAME,LNAME,DOB,MOB,EMAIL,PHOTO,JOINDATE,QUELI,EXPERIANCE,SALARY,ROLE,SEQ_Q_A,SPECIAL,STATUS) values ('assi108','assi1234','Jatayu','H','Baxi',to_date('08-JAN-87','DD-MON-RR'),'9909876543','jatayu@gmail.com','photo\assi108.jpg',to_date('08-JAN-11','DD-MON-RR'),'M.TECH',2,50000,'assiprof','Favorite_Color_red','os,asp.net','TRUE');
Insert into FMS.FACULTY (F_ID,PASSWORD,FNAME,MNAME,LNAME,DOB,MOB,EMAIL,PHOTO,JOINDATE,QUELI,EXPERIANCE,SALARY,ROLE,SEQ_Q_A,SPECIAL,STATUS) values ('asso109','asso1234','Brijesh','S','Bhatt',to_date('09-JAN-80','DD-MON-RR'),'9698765432','brijesh@gmail.com','photo\asso109.jpg',to_date('09-JAN-00','DD-MON-RR'),'PHD',7,95000,'assoprof','Favorite_Color_red','software engg.,algorithem','TRUE');
Insert into FMS.FACULTY (F_ID,PASSWORD,FNAME,MNAME,LNAME,DOB,MOB,EMAIL,PHOTO,JOINDATE,QUELI,EXPERIANCE,SALARY,ROLE,SEQ_Q_A,SPECIAL,STATUS) values ('assi110','assi1234','Niyati','J','Buch',to_date('10-JAN-87','DD-MON-RR'),'9458741230','niyati@gmail.com','photo\assi110.jpg',to_date('10-JAN-12','DD-MON-RR'),'M.TECH',2,50000,'assiprof','Favorite_Color_red','java,c,c++','TRUE');
Insert into FMS.FACULTY (F_ID,PASSWORD,FNAME,MNAME,LNAME,DOB,MOB,EMAIL,PHOTO,JOINDATE,QUELI,EXPERIANCE,SALARY,ROLE,SEQ_Q_A,SPECIAL,STATUS) values ('hod111','hod1234','Chandubhai','K','Bhesdadiya',to_date('05-JAN-78','DD-MON-RR'),'9123216131','ckb@gmail.com','photo\hod111.jpg',to_date('06-JAN-93','DD-MON-RR'),'PHD',8,99000,'hod','Favorite_Color_red','AI,compiler design','TRUE');
Insert into FMS.FACULTY (F_ID,PASSWORD,FNAME,MNAME,LNAME,DOB,MOB,EMAIL,PHOTO,JOINDATE,QUELI,EXPERIANCE,SALARY,ROLE,SEQ_Q_A,SPECIAL,STATUS) values ('121','parth','Parth','N','Prajapati',to_date('01-APR-18','DD-MON-RR'),'9409521571','prajapatiparth@gmail.com','photo/121.jpg',null,'MBA',2,null,'assiprof','2_Black','Marketing','TRUE');
Insert into FMS.FACULTY (F_ID,PASSWORD,FNAME,MNAME,LNAME,DOB,MOB,EMAIL,PHOTO,JOINDATE,QUELI,EXPERIANCE,SALARY,ROLE,SEQ_Q_A,SPECIAL,STATUS) values ('141','hemant1234','Hemant','S','Shah',to_date('15-MAY-90','DD-MON-RR'),'7564865945','hemantshah@gmail.com','photo/141.jpg',null,'M.Tech',2,null,'assiprof','2_red','Image Processing','false');
REM INSERTING into FMS.LAB
SET DEFINE OFF;
Insert into FMS.LAB (LA_ID,SRNO,BATCH,F_ID,S_ID,LOCATION,STIME,ETIME) values (1,5,'C1','assi106','4','LAB3','13:30','15:30');
Insert into FMS.LAB (LA_ID,SRNO,BATCH,F_ID,S_ID,LOCATION,STIME,ETIME) values (2,5,'C2','assi102','14','LAB2','13:30','15:30');
Insert into FMS.LAB (LA_ID,SRNO,BATCH,F_ID,S_ID,LOCATION,STIME,ETIME) values (3,5,'C3','assi107','5','LAB8','13:30','15:30');
Insert into FMS.LAB (LA_ID,SRNO,BATCH,F_ID,S_ID,LOCATION,STIME,ETIME) values (4,5,'C4','adm101','6','LAB5','13:30','15:30');
REM INSERTING into FMS.LEAVE
SET DEFINE OFF;
Insert into FMS.LEAVE (L_ID,F_ID,STARTDATE,ENDDATE,TOTALDAYS,TYPE,REASON,STATUS) values (1,'hod111',to_date('11-APR-18','DD-MON-RR'),to_date('13-APR-18','DD-MON-RR'),2,'Sick_Leave','nothing','grant');
REM INSERTING into FMS.LECTURE
SET DEFINE OFF;
Insert into FMS.LECTURE (LE_ID,SRNO,F_ID,S_ID,STIME,ETIME) values (65,5,'hod111','16','8:30','9:30');
Insert into FMS.LECTURE (LE_ID,SRNO,F_ID,S_ID,STIME,ETIME) values (66,5,'assi103','9','10:45','11:45');
REM INSERTING into FMS.LIKES
SET DEFINE OFF;
Insert into FMS.LIKES (LI_ID,B_ID,F_ID,LIKES) values (5,9,'hod111',0);
Insert into FMS.LIKES (LI_ID,B_ID,F_ID,LIKES) values (21,6,'hod111',0);
REM INSERTING into FMS.NOTICE
SET DEFINE OFF;
Insert into FMS.NOTICE (NI_ID,TITLE,SUBJECT,DATA,SENDDATE) values (21,'Expert Session','Expert Session on cloud computing','Expert session on cloud-computing will be conducted by Dr. M.K. Mehta on 12 MAR,2018 at 12AM and venue for this is Multimedia hall.','05-MAY-18');
Insert into FMS.NOTICE (NI_ID,TITLE,SUBJECT,DATA,SENDDATE) values (22,'Expert Session','Expert Session on cloud computing','Expert session on cloud-computing will be conducted by Dr. M.K. Mehta on 12 MAR,2018 at 12 o''clock and venue for this is Multimedia hall.','05-MAY-2018');
REM INSERTING into FMS.SEMDETAILS
SET DEFINE OFF;
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('1','1001','VII','C1','CE01','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('2','1002','VII','C1','CE02','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('3','1003','VII','C1','CE03','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('4','1004','VII','C1','CE04','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('5','1005','VII','C2','CE05','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('6','1006','VII','C2','CE06','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('7','1007','VII','C2','CE07','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('8','1008','VII','C2','CE08','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('9','1009','VII','C3','CE09','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('10','1010','VII','C3','CE10','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('11','1011','VII','C3','CE11','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('12','1012','VII','C3','CE12','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('13','1013','VII','C4','CE13','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('14','1014','VII','C4','CE14','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('15','1015','VII','C4','CE15','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('16','1016','VII','C4','CE16','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('17','1017','VII','D1','CE17','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('18','1018','VII','D1','CE18','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('19','1019','VII','D1','CE19','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('20','1020','VII','D1','CE20','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('21','1021','VII','D2','CE21','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('22','1022','VII','D2','CE22','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('23','1023','VII','D2','CE23','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('24','1024','VII','D2','CE24','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('25','1025','VII','D3','CE25','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('26','1026','VII','D3','CE26','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('27','1027','VII','D3','CE27','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('28','1028','VII','D3','CE28','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('29','1029','VII','D4','CE29','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('30','1030','VII','D4','CE30','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('31','1031','VII','D4','CE31','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('32','1032','VII','D4','CE32','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('33','1033','VII','D4','CE33','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('34','1034','v','C1','CE01','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('35','1035','v','C1','CE02','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('36','1036','v','C1','CE03','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('37','1037','v','C1','CE04','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('38','1038','v','C2','CE05','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('39','1039','v','C2','CE06','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('40','1040','v','C2','CE07','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('41','1041','v','C2','CE08','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('42','1042','v','C3','CE09','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('43','1043','v','C3','CE10','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('44','1044','v','C3','CE11','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('45','1045','v','C3','CE12','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('46','1046','v','C4','CE13','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('47','1047','v','C4','CE14','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('48','1048','v','C4','CE15','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('49','1049','v','C4','CE16','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('50','1050','v','D1','CE17','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('51','1051','v','D1','CE18','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('52','1052','v','D1','CE19','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('53','1053','v','D1','CE20','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('54','1054','v','D2','CE21','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('55','1055','v','D2','CE22','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('56','1056','v','D2','CE23','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('57','1057','v','D2','CE24','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('58','1058','v','D3','CE25','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('59','1059','v','D3','CE26','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('60','1060','v','D3','CE27','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('61','1061','v','D3','CE28','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('62','1062','v','D4','CE29','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('63','1063','v','D4','CE30','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('64','1064','v','D4','CE31','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('65','1065','v','D4','CE32','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('66','1066','v','D4','CE33','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('67','1067','III','C1','CE01','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('68','1068','III','C1','CE02','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('69','1069','III','C1','CE03','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('70','1070','III','C1','CE04','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('71','1071','III','C2','CE05','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('72','1072','III','C2','CE06','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('73','1073','III','C2','CE07','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('74','1074','III','C2','CE08','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('75','1075','III','C3','CE09','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('76','1076','III','C3','CE10','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('77','1077','III','C3','CE11','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('78','1078','III','C3','CE12','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('79','1079','III','C4','CE13','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('80','1080','III','C4','CE14','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('81','1081','III','C4','CE15','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('82','1082','III','C4','CE16','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('83','1083','III','D1','CE17','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('84','1084','III','D1','CE18','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('85','1085','III','D1','CE19','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('86','1086','III','D1','CE20','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('87','1087','III','D2','CE21','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('88','1088','III','D2','CE22','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('89','1089','III','D2','CE23','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('90','1090','III','D2','CE24','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('91','1091','III','D3','CE25','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('92','1092','III','D3','CE26','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('93','1093','III','D3','CE27','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('94','1094','III','D3','CE28','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('95','1095','III','D3','CE29','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('96','1096','III','D4','CE30','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('97','1097','III','D4','CE31','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('98','1098','III','D4','CE32','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('99','1099','III','D4','CE33','active');
Insert into FMS.SEMDETAILS (SED_ID,ST_ID,SEM,BATCH,ROLLNO,STATUS) values ('100','1100','III','D4','CE34','active');
REM INSERTING into FMS.STACTIVITY
SET DEFINE OFF;
REM INSERTING into FMS.STUDENT
SET DEFINE OFF;
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1001','Lois','H','Walker',to_date('29-MAR-97','DD-MON-RR'),'303-572-8492','lois.walker@hotmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1002','Brenda','S','Robinson',to_date('31-JUL-98','DD-MON-RR'),'225-945-4954','brenda.robinson@gmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1003','Joe','W','Robinson',to_date('16-JUN-98','DD-MON-RR'),'219-904-2161','joe.robinson@gmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1004','Diane','I','Evans',to_date('04-DEC-98','DD-MON-RR'),'215-793-6791','diane.evans@yahoo.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1005','Benjamin','R','Russell',to_date('17-APR-98','DD-MON-RR'),'262-404-2252','benjamin.russell@charter.net',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1006','Patrick','F','Bailey',to_date('27-SEP-97','DD-MON-RR'),'319-812-6957','patrick.bailey@aol.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1007','Nancy','T','Baker',to_date('13-JUN-97','DD-MON-RR'),'229-336-5117','nancy.baker@bp.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1008','Carol','V','Murphy',to_date('30-JUN-97','DD-MON-RR'),'216-336-0009','carol.murphy@gmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1009','Frances','B','Young',to_date('09-JUN-98','DD-MON-RR'),'210-819-9765','frances.young@gmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1010','Diana','T','Peterson',to_date('13-NOV-98','DD-MON-RR'),'479-783-5656','diana.peterson@hotmail.co.uk',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1011','Ralph','L','Flores',to_date('05-FEB-97','DD-MON-RR'),'316-280-2864','ralph.flores@yahoo.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1012','Jack','C','Alexander',to_date('19-MAY-98','DD-MON-RR'),'702-603-3769','jack.alexander@gmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1013','Melissa','Q','King',to_date('24-FEB-98','DD-MON-RR'),'216-605-3731','melissa.king@comcast.net',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1014','Wayne','G','Watson',to_date('26-JUN-97','DD-MON-RR'),'701-231-9370','wayne.watson@gmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1015','Cheryl','O','Scott',to_date('23-FEB-98','DD-MON-RR'),'215-288-9345','cheryl.scott@gmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1016','Paula','G','Diaz',to_date('22-AUG-97','DD-MON-RR'),'252-531-7641','paula.diaz@gmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1017','Joshua','T','Stewart',to_date('18-MAY-98','DD-MON-RR'),'217-279-9342','joshua.stewart@yahoo.ca',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1018','Theresa','G','Lee',to_date('05-DEC-98','DD-MON-RR'),'319-553-8919','theresa.lee@gmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1019','Julia','S','Scott',to_date('15-JUL-97','DD-MON-RR'),'423-939-1010','julia.scott@apple.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1020','Thomas','Q','Lewis',to_date('04-OCT-97','DD-MON-RR'),'314-679-3697','thomas.lewis@gmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1021','Carol','J','Edwards',to_date('14-DEC-97','DD-MON-RR'),'225-283-4295','carol.edwards@msn.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1022','Matthew','L','Turner',to_date('26-OCT-97','DD-MON-RR'),'236-972-7624','matthew.turner@gmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1023','Joan','C','Stewart',to_date('20-NOV-97','DD-MON-RR'),'216-637-6800','joan.stewart@yahoo.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1024','Ruby','R','Rogers',to_date('01-MAY-98','DD-MON-RR'),'423-231-6507','ruby.rogers@gmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1025','Carolyn','V','Hayes',to_date('10-MAR-98','DD-MON-RR'),'239-882-8784','carolyn.hayes@hotmail.co.uk',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1026','Anne','L','Russell',to_date('29-JUL-98','DD-MON-RR'),'605-635-1306','anne.russell@ibm.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1027','Daniel','K','Cooper',to_date('01-JAN-99','DD-MON-RR'),'701-510-8162','daniel.cooper@yahoo.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1028','Roger','L','Roberts',to_date('07-JUL-98','DD-MON-RR'),'206-497-3141','roger.roberts@gmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1029','Maria','W','Walker',to_date('19-MAR-99','DD-MON-RR'),'423-668-5506','maria.walker@microsoft.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1030','Brenda','M','Butler',to_date('06-DEC-98','DD-MON-RR'),'480-814-8284','brenda.butler@gmail.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1031','Lillian','X','Brown',to_date('12-MAY-99','DD-MON-RR'),'239-812-9041','lillian.brown@aol.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1032','Amy','B','Howard',to_date('16-JUN-99','DD-MON-RR'),'803-613-3168','amy.howard@aol.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1033','Gregory','X','Edwards',to_date('31-AUG-98','DD-MON-RR'),'503-256-9654','gregory.edwards@outlook.com',to_date('27-JUL-15','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1034','Roy','Z','Griffin',to_date('08-MAY-99','DD-MON-RR'),'219-506-9378','roy.griffin@yahoo.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1035','Richard','Y','Mitchell',to_date('28-JUL-98','DD-MON-RR'),'205-621-5884','richard.mitchell@verizon.net',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1036','Mary','P','Wilson',to_date('01-DEC-98','DD-MON-RR'),'423-937-8660','mary.wilson@sbcglobal.net',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1037','Aaron','N','Price',to_date('10-FEB-99','DD-MON-RR'),'219-287-8926','aaron.price@bp.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1038','Donna','R','Brown',to_date('14-SEP-98','DD-MON-RR'),'212-434-7910','donna.brown@aol.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1039','Carl','N','Collins',to_date('22-DEC-98','DD-MON-RR'),'479-740-7633','carl.collins@yahoo.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1040','Joyce','E','Jenkins',to_date('22-AUG-98','DD-MON-RR'),'262-455-4187','joyce.jenkins@aol.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1041','Mary','G','Bryant',to_date('21-JUN-99','DD-MON-RR'),'319-827-3516','mary.bryant@verizon.net',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1042','Amanda','M','Hughes',to_date('29-JUL-98','DD-MON-RR'),'225-544-9700','amanda.hughes@rediffmail.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1043','Jack','E','Campbell',to_date('04-JAN-99','DD-MON-RR'),'316-499-5737','jack.campbell@gmail.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1044','Alan','E','Rivera',to_date('11-DEC-98','DD-MON-RR'),'423-277-6819','alan.rivera@apple.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1045','Elizabeth','Q','Jackson',to_date('15-AUG-98','DD-MON-RR'),'603-568-6118','elizabeth.jackson@aol.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1046','Nancy','L','Davis',to_date('14-NOV-98','DD-MON-RR'),'219-610-3067','nancy.davis@ibm.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1047','Ernest','D','Martinez',to_date('09-NOV-98','DD-MON-RR'),'479-951-4138','ernest.martinez@gmail.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1048','Judy','Y','Hernandez',to_date('25-MAR-99','DD-MON-RR'),'316-736-6126','judy.hernandez@gmail.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1049','Nancy','L','Jones',to_date('10-NOV-98','DD-MON-RR'),'212-825-1930','nancy.jones@gmail.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1050','Pamela','X','Wright',to_date('14-APR-99','DD-MON-RR'),'307-329-8832','pamela.wright@aol.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1051','Larry','T','Miller',to_date('31-OCT-99','DD-MON-RR'),'217-574-9283','larry.miller@shell.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1052','Ann','Q','Coleman',to_date('11-MAY-00','DD-MON-RR'),'319-994-4179','ann.coleman@ibm.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1053','Judy','C','Gonzales',to_date('17-JUN-00','DD-MON-RR'),'201-640-8645','judy.gonzales@gmail.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1054','Peter','X','Washington',to_date('06-NOV-99','DD-MON-RR'),'231-322-0316','peter.washington@bp.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1055','Clarence','A','Ross',to_date('13-DEC-99','DD-MON-RR'),'423-772-0118','clarence.ross@apple.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1056','Sharon','E','Lopez',to_date('04-MAY-00','DD-MON-RR'),'304-934-5548','sharon.lopez@gmail.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1057','Ann','Q','Cooper',to_date('25-DEC-99','DD-MON-RR'),'406-278-6460','ann.cooper@exxonmobil.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1058','Anne','A','Perez',to_date('05-MAY-00','DD-MON-RR'),'423-837-3338','anne.perez@sbcglobal.net',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1059','Nancy','P','Howard',to_date('05-MAY-00','DD-MON-RR'),'236-973-8086','nancy.howard@gmail.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1060','Antonio','R','Roberts',to_date('27-AUG-99','DD-MON-RR'),'205-267-7304','antonio.roberts@hotmail.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1061','Frances','P','Watson',to_date('30-JAN-00','DD-MON-RR'),'406-530-8069','frances.watson@outlook.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1062','Debra','G','Wood',to_date('30-OCT-99','DD-MON-RR'),'308-646-6219','debra.wood@hotmail.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1063','Henry','Y','Jenkins',to_date('06-NOV-99','DD-MON-RR'),'314-731-7135','henry.jenkins@hotmail.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1064','Melissa','X','Butler',to_date('14-NOV-99','DD-MON-RR'),'308-827-9016','melissa.butler@hotmail.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1065','Todd','H','Hall',to_date('31-AUG-99','DD-MON-RR'),'240-513-8668','todd.hall@yahoo.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1066','Christopher','D','Nelson',to_date('29-MAR-00','DD-MON-RR'),'480-946-9780','christopher.nelson@aol.com',to_date('03-AUG-16','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1067','Andrea','P','Garcia',to_date('06-JUL-99','DD-MON-RR'),'219-624-3708','andrea.garcia@aol.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1068','Jeremy','I','Sanchez',to_date('05-FEB-00','DD-MON-RR'),'423-974-2755','jeremy.sanchez@hotmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1069','Steven','J','Phillips',to_date('12-SEP-99','DD-MON-RR'),'225-968-5952','steven.phillips@hotmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1070','Cynthia','J','Ramirez',to_date('22-SEP-99','DD-MON-RR'),'406-961-7340','cynthia.ramirez@btinternet.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1071','Jason','W','Anderson',to_date('03-JAN-00','DD-MON-RR'),'217-856-6752','jason.anderson@gmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1072','Cynthia','X','White',to_date('15-JUN-99','DD-MON-RR'),'314-593-3092','cynthia.white@gmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1073','Margaret','N','Brooks',to_date('27-JUN-99','DD-MON-RR'),'303-960-0117','margaret.brooks@gmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1074','Douglas','I','Flores',to_date('21-APR-00','DD-MON-RR'),'303-836-4721','douglas.flores@gmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1075','Paul','V','Watson',to_date('09-MAR-00','DD-MON-RR'),'270-556-7711','paul.watson@hotmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1076','Linda','R','Moore',to_date('18-AUG-00','DD-MON-RR'),'215-793-7095','linda.moore@gmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1077','Cheryl','O','Miller',to_date('20-APR-01','DD-MON-RR'),'270-880-3858','cheryl.miller@ntlworld.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1078','Martha','G','Washington',to_date('28-MAR-01','DD-MON-RR'),'405-945-0242','martha.washington@aol.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1079','William','G','Hernandez',to_date('22-JUL-00','DD-MON-RR'),'239-276-0532','william.hernandez@rediffmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1080','Carolyn','F','Price',to_date('30-MAY-01','DD-MON-RR'),'217-409-4338','carolyn.price@yahoo.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1081','Ruby','Q','Stewart',to_date('23-OCT-00','DD-MON-RR'),'218-445-2369','ruby.stewart@gmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1082','Paul','D','Cooper',to_date('12-AUG-00','DD-MON-RR'),'210-984-4722','paul.cooper@gmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1083','Ernest','G','Washington',to_date('28-OCT-00','DD-MON-RR'),'212-596-1659','ernest.washington@msn.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1084','Dorothy','K','Edwards',to_date('19-JAN-01','DD-MON-RR'),'215-902-6888','dorothy.edwards@hotmail.co.uk',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1085','Ryan','V','Alexander',to_date('01-AUG-00','DD-MON-RR'),'225-395-3347','ryan.alexander@shell.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1086','Lillian','N','Mitchell',to_date('23-OCT-00','DD-MON-RR'),'316-876-1484','lillian.mitchell@shaw.ca',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1087','Kelly','R','Adams',to_date('23-MAY-01','DD-MON-RR'),'405-418-0037','kelly.adams@bp.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1088','Jimmy','R','Howard',to_date('27-NOV-00','DD-MON-RR'),'212-855-9316','jimmy.howard@yahoo.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1089','Margaret','T','Allen',to_date('08-SEP-00','DD-MON-RR'),'216-697-6987','margaret.allen@gmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1090','Janet','Y','Henderson',to_date('24-DEC-00','DD-MON-RR'),'239-769-6347','janet.henderson@ntlworld.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1091','Eugene','D','Perez',to_date('06-OCT-00','DD-MON-RR'),'262-472-7112','eugene.perez@exxonmobil.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1092','Deborah','E','Smith',to_date('31-OCT-00','DD-MON-RR'),'907-279-8694','deborah.smith@yahoo.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1093','Janice','S','Parker',to_date('12-JAN-01','DD-MON-RR'),'314-842-5984','janice.parker@yahoo.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1094','Rebecca','A','Stewart',to_date('11-AUG-00','DD-MON-RR'),'209-233-7631','rebecca.stewart@gmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1095','Phillip','F','White',to_date('04-MAR-01','DD-MON-RR'),'503-668-6592','phillip.white@gmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1096','Jose','K','Hill',to_date('08-OCT-00','DD-MON-RR'),'228-245-5000','jose.hill@hotmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1097','Harold','Z','Nelson',to_date('24-DEC-00','DD-MON-RR'),'217-555-9216','harold.nelson@gmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1098','Nicole','O','Ward',to_date('12-DEC-00','DD-MON-RR'),'231-761-7861','nicole.ward@yahoo.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1099','Theresa','R','Murphy',to_date('30-DEC-00','DD-MON-RR'),'907-356-1555','theresa.murphy@gmail.com',to_date('23-JUL-17','DD-MON-RR'));
Insert into FMS.STUDENT (ST_ID,FNAME,MNAME,LNAME,DOB,MOBNO,EMAIL,ADMDATE) values ('1100','Tammy','B','Young',to_date('22-MAR-01','DD-MON-RR'),'231-290-3075','tammy.young@comcast.net',to_date('23-JUL-17','DD-MON-RR'));
REM INSERTING into FMS.SUBJECT
SET DEFINE OFF;
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('1','CT116','ELE. OF LINUX OS & C PROG.-I','ELOSCP');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('2','CT215','C PROGRAMMING II','CP');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('3','CE312','DIGITAL & ANALOG COMM. SYSTEMS','DACS');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('4','CE311','OBJECT ORIENTED PROG. WITH JAVA','OOPJ');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('5','CE310','DATA STRUCTURES & ALGORITHMS','DSA');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('6','CE308','DESIGN OF DIGITAL CIRCUITS','DDC');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('7','CE417','COMPUTER SYSTEM ARCHITECUTRE','CSA');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('8','CE414','DESIGN & ANALYSIS OF ALGORITHM','DAA');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('9','CE410','JAVA TECHNOLOGY','JT');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('10','CE409','COMPUTER PERIPHERALS','CPI');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('11','CE513','OPERATING SYSTEMS','OS');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('12','CE510','SOFTWARE ENGINEERING','SE');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('13','CE509','WEB DEVELOPEMENT IN .NET','WDDN');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('14','CE508','DATABASE SYSTEM','DBS');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('15','CE502','MICROPROCESSOR FUNDAMENT. & PROG.','MFP');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('16','CT614','THEORY OF AUTOMATA & FORMAL LANG.','TAFL');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('17','CE621','SYSTEM DESIGN PRACTICE','SDP');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('18','CE620','OBJECT ORIENTED SOFTWARE ENGG.','OOSE');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('19','CE618','NETWORK INFORMATION & SECURITY','NIS');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('20','CE617','SERVICE ORIENTED ARCHITECTURE','SOA');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('21','CE611','COMPUTER NETWORKS','CN');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('41','CE615','Image Processing','IP');
Insert into FMS.SUBJECT (S_ID,SCODE,SNAME,ALIAS) values ('61','CE618','Advanced Computer Network','ACN');
REM INSERTING into FMS.TIMETABLE
SET DEFINE OFF;
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (1,'Monday','I','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (2,'Monday','I','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (3,'Monday','II','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (4,'Monday','II','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (5,'Monday','III','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (6,'Monday','III','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (7,'Monday','IV','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (8,'Monday','IV','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (9,'Monday','V','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (10,'Monday','V','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (11,'Monday','VI','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (12,'Monday','VI','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (13,'Monday','VII','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (14,'Monday','VII','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (15,'Tuesday','I','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (16,'Tuesday','I','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (17,'Tuesday','II','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (18,'Tuesday','II','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (19,'Tuesday','III','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (20,'Tuesday','III','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (21,'Tuesday','IV','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (22,'Tuesday','IV','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (23,'Tuesday','V','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (24,'Tuesday','V','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (25,'Tuesday','VI','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (26,'Tuesday','VI','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (27,'Tuesday','VII','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (28,'Tuesday','VII','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (29,'Wednesday','I','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (30,'Wednesday','I','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (31,'Wednesday','II','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (32,'Wednesday','II','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (33,'Wednesday','III','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (34,'Wednesday','III','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (35,'Wednesday','IV','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (36,'Wednesday','IV','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (37,'Wednesday','V','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (38,'Wednesday','V','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (39,'Wednesday','VI','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (40,'Wednesday','VI','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (41,'Wednesday','VII','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (42,'Wednesday','VII','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (43,'Thursday','I','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (44,'Thursday','I','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (45,'Thursday','II','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (46,'Thursday','II','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (47,'Thursday','III','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (48,'Thursday','III','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (49,'Thursday','IV','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (50,'Thursday','IV','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (51,'Thursday','V','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (52,'Thursday','V','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (53,'Thursday','VI','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (54,'Thursday','VI','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (55,'Thursday','VII','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (56,'Thursday','VII','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (57,'Friday','I','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (58,'Friday','I','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (59,'Friday','II','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (60,'Friday','II','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (61,'Friday','III','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (62,'Friday','III','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (63,'Friday','IV','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (64,'Friday','IV','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (65,'Friday','V','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (66,'Friday','V','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (67,'Friday','VI','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (68,'Friday','VI','D');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (69,'Friday','VII','C');
Insert into FMS.TIMETABLE (SRNO,DAY,SEMESTER,DIVISION) values (70,'Friday','VII','D');
--------------------------------------------------------
--  DDL for Index SYS_C008830
--------------------------------------------------------

  CREATE UNIQUE INDEX "FMS"."SYS_C008830" ON "FMS"."BLOGS" ("B_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008957
--------------------------------------------------------

  CREATE UNIQUE INDEX "FMS"."SYS_C008957" ON "FMS"."DOCUMENT" ("D_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008617
--------------------------------------------------------

  CREATE UNIQUE INDEX "FMS"."SYS_C008617" ON "FMS"."FACULTY" ("F_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008688
--------------------------------------------------------

  CREATE UNIQUE INDEX "FMS"."SYS_C008688" ON "FMS"."LAB" ("LA_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008651
--------------------------------------------------------

  CREATE UNIQUE INDEX "FMS"."SYS_C008651" ON "FMS"."LEAVE" ("L_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008694
--------------------------------------------------------

  CREATE UNIQUE INDEX "FMS"."SYS_C008694" ON "FMS"."LECTURE" ("LE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008835
--------------------------------------------------------

  CREATE UNIQUE INDEX "FMS"."SYS_C008835" ON "FMS"."LIKES" ("LI_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008932
--------------------------------------------------------

  CREATE UNIQUE INDEX "FMS"."SYS_C008932" ON "FMS"."NOTICE" ("NI_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008913
--------------------------------------------------------

  CREATE UNIQUE INDEX "FMS"."SYS_C008913" ON "FMS"."SEMDETAILS" ("SED_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008921
--------------------------------------------------------

  CREATE UNIQUE INDEX "FMS"."SYS_C008921" ON "FMS"."STACTIVITY" ("STA_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008882
--------------------------------------------------------

  CREATE UNIQUE INDEX "FMS"."SYS_C008882" ON "FMS"."STUDENT" ("ST_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008622
--------------------------------------------------------

  CREATE UNIQUE INDEX "FMS"."SYS_C008622" ON "FMS"."SUBJECT" ("S_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008685
--------------------------------------------------------

  CREATE UNIQUE INDEX "FMS"."SYS_C008685" ON "FMS"."TIMETABLE" ("SRNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table BLOGS
--------------------------------------------------------

  ALTER TABLE "FMS"."BLOGS" ADD PRIMARY KEY ("B_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FMS"."BLOGS" MODIFY ("POSTDATE" NOT NULL ENABLE);
  ALTER TABLE "FMS"."BLOGS" MODIFY ("SUBJECT" NOT NULL ENABLE);
  ALTER TABLE "FMS"."BLOGS" MODIFY ("F_ID" NOT NULL ENABLE);
  ALTER TABLE "FMS"."BLOGS" MODIFY ("B_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DOCUMENT
--------------------------------------------------------

  ALTER TABLE "FMS"."DOCUMENT" ADD PRIMARY KEY ("D_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FMS"."DOCUMENT" MODIFY ("DEXET" NOT NULL ENABLE);
  ALTER TABLE "FMS"."DOCUMENT" MODIFY ("DTYPE" NOT NULL ENABLE);
  ALTER TABLE "FMS"."DOCUMENT" MODIFY ("DNAME" NOT NULL ENABLE);
  ALTER TABLE "FMS"."DOCUMENT" MODIFY ("SNAME" NOT NULL ENABLE);
  ALTER TABLE "FMS"."DOCUMENT" MODIFY ("F_ID" NOT NULL ENABLE);
  ALTER TABLE "FMS"."DOCUMENT" MODIFY ("D_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FACULTY
--------------------------------------------------------

  ALTER TABLE "FMS"."FACULTY" ADD PRIMARY KEY ("F_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FMS"."FACULTY" MODIFY ("EXPERIANCE" NOT NULL ENABLE);
  ALTER TABLE "FMS"."FACULTY" MODIFY ("QUELI" NOT NULL ENABLE);
  ALTER TABLE "FMS"."FACULTY" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "FMS"."FACULTY" MODIFY ("MOB" NOT NULL ENABLE);
  ALTER TABLE "FMS"."FACULTY" MODIFY ("LNAME" NOT NULL ENABLE);
  ALTER TABLE "FMS"."FACULTY" MODIFY ("FNAME" NOT NULL ENABLE);
  ALTER TABLE "FMS"."FACULTY" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "FMS"."FACULTY" MODIFY ("F_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LAB
--------------------------------------------------------

  ALTER TABLE "FMS"."LAB" ADD PRIMARY KEY ("LA_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FMS"."LAB" MODIFY ("SRNO" NOT NULL ENABLE);
  ALTER TABLE "FMS"."LAB" MODIFY ("LA_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LEAVE
--------------------------------------------------------

  ALTER TABLE "FMS"."LEAVE" ADD PRIMARY KEY ("L_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FMS"."LEAVE" ADD CONSTRAINT "DIFF" CHECK (enddate > startdate) ENABLE;
  ALTER TABLE "FMS"."LEAVE" MODIFY ("REASON" NOT NULL ENABLE);
  ALTER TABLE "FMS"."LEAVE" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "FMS"."LEAVE" MODIFY ("ENDDATE" NOT NULL ENABLE);
  ALTER TABLE "FMS"."LEAVE" MODIFY ("STARTDATE" NOT NULL ENABLE);
  ALTER TABLE "FMS"."LEAVE" MODIFY ("F_ID" NOT NULL ENABLE);
  ALTER TABLE "FMS"."LEAVE" MODIFY ("L_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LECTURE
--------------------------------------------------------

  ALTER TABLE "FMS"."LECTURE" ADD PRIMARY KEY ("LE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FMS"."LECTURE" MODIFY ("SRNO" NOT NULL ENABLE);
  ALTER TABLE "FMS"."LECTURE" MODIFY ("LE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LIKES
--------------------------------------------------------

  ALTER TABLE "FMS"."LIKES" ADD PRIMARY KEY ("LI_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FMS"."LIKES" MODIFY ("F_ID" NOT NULL ENABLE);
  ALTER TABLE "FMS"."LIKES" MODIFY ("B_ID" NOT NULL ENABLE);
  ALTER TABLE "FMS"."LIKES" MODIFY ("LI_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "FMS"."NOTICE" ADD PRIMARY KEY ("NI_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FMS"."NOTICE" MODIFY ("DATA" NOT NULL ENABLE);
  ALTER TABLE "FMS"."NOTICE" MODIFY ("SUBJECT" NOT NULL ENABLE);
  ALTER TABLE "FMS"."NOTICE" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "FMS"."NOTICE" MODIFY ("NI_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SEMDETAILS
--------------------------------------------------------

  ALTER TABLE "FMS"."SEMDETAILS" ADD PRIMARY KEY ("SED_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FMS"."SEMDETAILS" MODIFY ("ROLLNO" NOT NULL ENABLE);
  ALTER TABLE "FMS"."SEMDETAILS" MODIFY ("BATCH" NOT NULL ENABLE);
  ALTER TABLE "FMS"."SEMDETAILS" MODIFY ("SEM" NOT NULL ENABLE);
  ALTER TABLE "FMS"."SEMDETAILS" MODIFY ("ST_ID" NOT NULL ENABLE);
  ALTER TABLE "FMS"."SEMDETAILS" MODIFY ("SED_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STACTIVITY
--------------------------------------------------------

  ALTER TABLE "FMS"."STACTIVITY" ADD PRIMARY KEY ("STA_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FMS"."STACTIVITY" ADD CONSTRAINT "DIFF2" CHECK (tlec >= glec) ENABLE;
  ALTER TABLE "FMS"."STACTIVITY" ADD CONSTRAINT "DIFF1" CHECK (tlab >= glab) ENABLE;
  ALTER TABLE "FMS"."STACTIVITY" MODIFY ("EXAM" NOT NULL ENABLE);
  ALTER TABLE "FMS"."STACTIVITY" MODIFY ("S_ID" NOT NULL ENABLE);
  ALTER TABLE "FMS"."STACTIVITY" MODIFY ("SED_ID" NOT NULL ENABLE);
  ALTER TABLE "FMS"."STACTIVITY" MODIFY ("STA_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "FMS"."STUDENT" ADD PRIMARY KEY ("ST_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FMS"."STUDENT" MODIFY ("ADMDATE" NOT NULL ENABLE);
  ALTER TABLE "FMS"."STUDENT" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "FMS"."STUDENT" MODIFY ("MOBNO" NOT NULL ENABLE);
  ALTER TABLE "FMS"."STUDENT" MODIFY ("LNAME" NOT NULL ENABLE);
  ALTER TABLE "FMS"."STUDENT" MODIFY ("FNAME" NOT NULL ENABLE);
  ALTER TABLE "FMS"."STUDENT" MODIFY ("ST_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SUBJECT
--------------------------------------------------------

  ALTER TABLE "FMS"."SUBJECT" ADD PRIMARY KEY ("S_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FMS"."SUBJECT" MODIFY ("ALIAS" NOT NULL ENABLE);
  ALTER TABLE "FMS"."SUBJECT" MODIFY ("SNAME" NOT NULL ENABLE);
  ALTER TABLE "FMS"."SUBJECT" MODIFY ("SCODE" NOT NULL ENABLE);
  ALTER TABLE "FMS"."SUBJECT" MODIFY ("S_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TIMETABLE
--------------------------------------------------------

  ALTER TABLE "FMS"."TIMETABLE" ADD PRIMARY KEY ("SRNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FMS"."TIMETABLE" MODIFY ("SRNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BLOGS
--------------------------------------------------------

  ALTER TABLE "FMS"."BLOGS" ADD CONSTRAINT "FK3_FID_FACULTY" FOREIGN KEY ("F_ID")
	  REFERENCES "FMS"."FACULTY" ("F_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DOCUMENT
--------------------------------------------------------

  ALTER TABLE "FMS"."DOCUMENT" ADD CONSTRAINT "FKD1_FID_FACULTY" FOREIGN KEY ("F_ID")
	  REFERENCES "FMS"."FACULTY" ("F_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LAB
--------------------------------------------------------

  ALTER TABLE "FMS"."LAB" ADD CONSTRAINT "FKST13_SRNO_TIMETABLE" FOREIGN KEY ("SRNO")
	  REFERENCES "FMS"."TIMETABLE" ("SRNO") ENABLE;
  ALTER TABLE "FMS"."LAB" ADD CONSTRAINT "FKST14_FID_FACULTY" FOREIGN KEY ("F_ID")
	  REFERENCES "FMS"."FACULTY" ("F_ID") ENABLE;
  ALTER TABLE "FMS"."LAB" ADD CONSTRAINT "FKST15_SID_SUBJECT" FOREIGN KEY ("S_ID")
	  REFERENCES "FMS"."SUBJECT" ("S_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LEAVE
--------------------------------------------------------

  ALTER TABLE "FMS"."LEAVE" ADD CONSTRAINT "FK4_FID_FACULTY" FOREIGN KEY ("F_ID")
	  REFERENCES "FMS"."FACULTY" ("F_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LECTURE
--------------------------------------------------------

  ALTER TABLE "FMS"."LECTURE" ADD CONSTRAINT "FKST16_SRNO_TIMETABLE" FOREIGN KEY ("SRNO")
	  REFERENCES "FMS"."TIMETABLE" ("SRNO") ENABLE;
  ALTER TABLE "FMS"."LECTURE" ADD CONSTRAINT "FKST17_FID_FACULTY" FOREIGN KEY ("F_ID")
	  REFERENCES "FMS"."FACULTY" ("F_ID") ENABLE;
  ALTER TABLE "FMS"."LECTURE" ADD CONSTRAINT "FKST18_SID_SUBJECT" FOREIGN KEY ("S_ID")
	  REFERENCES "FMS"."SUBJECT" ("S_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LIKES
--------------------------------------------------------

  ALTER TABLE "FMS"."LIKES" ADD CONSTRAINT "FKST19_FID_FACULTY" FOREIGN KEY ("F_ID")
	  REFERENCES "FMS"."FACULTY" ("F_ID") ENABLE;
  ALTER TABLE "FMS"."LIKES" ADD CONSTRAINT "FKST20_BID_BLOGS" FOREIGN KEY ("B_ID")
	  REFERENCES "FMS"."BLOGS" ("B_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SEMDETAILS
--------------------------------------------------------

  ALTER TABLE "FMS"."SEMDETAILS" ADD CONSTRAINT "FKST10_STID_STUDENT" FOREIGN KEY ("ST_ID")
	  REFERENCES "FMS"."STUDENT" ("ST_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STACTIVITY
--------------------------------------------------------

  ALTER TABLE "FMS"."STACTIVITY" ADD CONSTRAINT "FKST10_SEDID_STUDENT" FOREIGN KEY ("SED_ID")
	  REFERENCES "FMS"."SEMDETAILS" ("SED_ID") ENABLE;
  ALTER TABLE "FMS"."STACTIVITY" ADD CONSTRAINT "FKST11_SID_SUBJECT" FOREIGN KEY ("S_ID")
	  REFERENCES "FMS"."SUBJECT" ("S_ID") ENABLE;
