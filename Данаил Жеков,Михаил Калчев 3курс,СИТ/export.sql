--------------------------------------------------------
--  File created - ���������-���������-09-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CARS
--------------------------------------------------------

  CREATE TABLE "CHOX"."CARS" 
   (	"ID" NUMBER(*,0), 
	"KILOMETERS" NUMBER, 
	"PRICE" NUMBER, 
	"ENGINE" VARCHAR2(50 BYTE), 
	"MODEL_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "CHOX"."CATEGORY" 
   (	"ID" NUMBER(*,0), 
	"CATEGORY" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CLASS
--------------------------------------------------------

  CREATE TABLE "CHOX"."CLASS" 
   (	"ID" NUMBER(*,0), 
	"CLASS" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CLIENT
--------------------------------------------------------

  CREATE TABLE "CHOX"."CLIENT" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(50 BYTE), 
	"PHONE" VARCHAR2(10 BYTE), 
	"EMAIL" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table INSURANCE
--------------------------------------------------------

  CREATE TABLE "CHOX"."INSURANCE" 
   (	"INSURANCE_ID" NUMBER(*,0), 
	"TYPEINSURANCE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MAKE
--------------------------------------------------------

  CREATE TABLE "CHOX"."MAKE" 
   (	"ID" NUMBER(*,0), 
	"MAKE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MODEL
--------------------------------------------------------

  CREATE TABLE "CHOX"."MODEL" 
   (	"ID" NUMBER(*,0), 
	"MODEL" VARCHAR2(20 BYTE), 
	"YEAR" DATE, 
	"CATEGORY_ID" NUMBER(*,0), 
	"CLASS_ID" NUMBER(*,0), 
	"MAKE_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table OPERATOR
--------------------------------------------------------

  CREATE TABLE "CHOX"."OPERATOR" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(20 BYTE), 
	"PHONE" VARCHAR2(10 BYTE), 
	"EMAIL" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PAYMENT
--------------------------------------------------------

  CREATE TABLE "CHOX"."PAYMENT" 
   (	"ID" NUMBER(*,0), 
	"FINALPRICE" NUMBER, 
	"RENT_ID" NUMBER(*,0), 
	"KILOMETERS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table RENT
--------------------------------------------------------

  CREATE TABLE "CHOX"."RENT" 
   (	"ID" NUMBER(*,0), 
	"DAYSFROM" DATE, 
	"DAYSTO" DATE, 
	"OPERATOR_ID" NUMBER(*,0), 
	"CLIENT_ID" NUMBER(*,0), 
	"CARS_ID" NUMBER(*,0), 
	"INSURANCE_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into CHOX.CARS
SET DEFINE OFF;
Insert into CHOX.CARS (ID,KILOMETERS,PRICE,ENGINE,MODEL_ID) values (1,293366,78.99,'1.4 90HP',1);
Insert into CHOX.CARS (ID,KILOMETERS,PRICE,ENGINE,MODEL_ID) values (2,183756,250,'3.0d XDrive 215HP ',2);
Insert into CHOX.CARS (ID,KILOMETERS,PRICE,ENGINE,MODEL_ID) values (3,242045,135,'1.8T 190HP',3);
Insert into CHOX.CARS (ID,KILOMETERS,PRICE,ENGINE,MODEL_ID) values (4,104771,73,'1.8 120HP',4);
Insert into CHOX.CARS (ID,KILOMETERS,PRICE,ENGINE,MODEL_ID) values (5,115421,90,'2.2 130HP',5);
Insert into CHOX.CARS (ID,KILOMETERS,PRICE,ENGINE,MODEL_ID) values (6,114772,100,'2.0tdi 4motion 150HP',6);
Insert into CHOX.CARS (ID,KILOMETERS,PRICE,ENGINE,MODEL_ID) values (7,101453,180,'5.5 V8 4matic 450HP',8);
Insert into CHOX.CARS (ID,KILOMETERS,PRICE,ENGINE,MODEL_ID) values (8,122114,88,'1.2 75HP',7);
Insert into CHOX.CARS (ID,KILOMETERS,PRICE,ENGINE,MODEL_ID) values (9,141654,199,'4.2 V8 400HP',9);
Insert into CHOX.CARS (ID,KILOMETERS,PRICE,ENGINE,MODEL_ID) values (10,182206,100,'1.8 140HP',10);
Insert into CHOX.CARS (ID,KILOMETERS,PRICE,ENGINE,MODEL_ID) values (11,107403,136,'1.5 100HP',11);
Insert into CHOX.CARS (ID,KILOMETERS,PRICE,ENGINE,MODEL_ID) values (12,163697,98,'2.0tdi 150HP',12);
REM INSERTING into CHOX.CATEGORY
SET DEFINE OFF;
Insert into CHOX.CATEGORY (ID,CATEGORY) values (1,'wagon');
Insert into CHOX.CATEGORY (ID,CATEGORY) values (2,'SUV');
Insert into CHOX.CATEGORY (ID,CATEGORY) values (3,'sedan');
Insert into CHOX.CATEGORY (ID,CATEGORY) values (4,'hachback');
REM INSERTING into CHOX.CLASS
SET DEFINE OFF;
Insert into CHOX.CLASS (ID,CLASS) values (1,'sport');
Insert into CHOX.CLASS (ID,CLASS) values (2,'family');
Insert into CHOX.CLASS (ID,CLASS) values (3,'city');
Insert into CHOX.CLASS (ID,CLASS) values (4,'luxurious');
REM INSERTING into CHOX.CLIENT
SET DEFINE OFF;
Insert into CHOX.CLIENT (ID,NAME,PHONE,EMAIL) values (1,'Zhivko Zhekov','0837456213','Zhivko@abv.bg');
Insert into CHOX.CLIENT (ID,NAME,PHONE,EMAIL) values (2,'Ivan Ivanow','0837231233','Ivan@abv.bg');
Insert into CHOX.CLIENT (ID,NAME,PHONE,EMAIL) values (3,'Petranka Georgieva','0892341234','Pepi@abv.bg');
Insert into CHOX.CLIENT (ID,NAME,PHONE,EMAIL) values (4,'Petran  Dragan','0882015787','afgasdad');
Insert into CHOX.CLIENT (ID,NAME,PHONE,EMAIL) values (5,'danail jekov','0885825782','danail_zhekov@abv.bg');
REM INSERTING into CHOX.INSURANCE
SET DEFINE OFF;
Insert into CHOX.INSURANCE (INSURANCE_ID,TYPEINSURANCE) values (1,'Basic insurance');
Insert into CHOX.INSURANCE (INSURANCE_ID,TYPEINSURANCE) values (2,'Premium insurance');
REM INSERTING into CHOX.MAKE
SET DEFINE OFF;
Insert into CHOX.MAKE (ID,MAKE) values (1,'BMW');
Insert into CHOX.MAKE (ID,MAKE) values (2,'Mercedez-Benz');
Insert into CHOX.MAKE (ID,MAKE) values (3,'VW');
Insert into CHOX.MAKE (ID,MAKE) values (4,'Honda');
Insert into CHOX.MAKE (ID,MAKE) values (5,'Toyota');
Insert into CHOX.MAKE (ID,MAKE) values (6,'Audi');
Insert into CHOX.MAKE (ID,MAKE) values (7,'Ford');
Insert into CHOX.MAKE (ID,MAKE) values (8,'Nissan');
Insert into CHOX.MAKE (ID,MAKE) values (9,'Opel');
Insert into CHOX.MAKE (ID,MAKE) values (10,'Seat');
REM INSERTING into CHOX.MODEL
SET DEFINE OFF;
Insert into CHOX.MODEL (ID,MODEL,YEAR,CATEGORY_ID,CLASS_ID,MAKE_ID) values (1,'Exeo',to_date('2011-10-12','RRRR-MM-DD'),2,3,10);
Insert into CHOX.MODEL (ID,MODEL,YEAR,CATEGORY_ID,CLASS_ID,MAKE_ID) values (2,'530d',to_date('2016-07-11','RRRR-MM-DD'),4,3,1);
Insert into CHOX.MODEL (ID,MODEL,YEAR,CATEGORY_ID,CLASS_ID,MAKE_ID) values (3,'A4',to_date('2013-10-09','RRRR-MM-DD'),2,1,6);
Insert into CHOX.MODEL (ID,MODEL,YEAR,CATEGORY_ID,CLASS_ID,MAKE_ID) values (4,'Accord',to_date('2012-03-30','RRRR-MM-DD'),3,3,4);
Insert into CHOX.MODEL (ID,MODEL,YEAR,CATEGORY_ID,CLASS_ID,MAKE_ID) values (5,'Civic',to_date('2016-11-23','RRRR-MM-DD'),1,4,4);
Insert into CHOX.MODEL (ID,MODEL,YEAR,CATEGORY_ID,CLASS_ID,MAKE_ID) values (6,'Passat',to_date('2009-02-10','RRRR-MM-DD'),2,1,3);
Insert into CHOX.MODEL (ID,MODEL,YEAR,CATEGORY_ID,CLASS_ID,MAKE_ID) values (7,'S500',to_date('2017-04-06','RRRR-MM-DD'),4,3,2);
Insert into CHOX.MODEL (ID,MODEL,YEAR,CATEGORY_ID,CLASS_ID,MAKE_ID) values (8,'Micra',to_date('2016-09-14','RRRR-MM-DD'),3,4,8);
Insert into CHOX.MODEL (ID,MODEL,YEAR,CATEGORY_ID,CLASS_ID,MAKE_ID) values (9,'A8',to_date('2014-10-01','RRRR-MM-DD'),4,3,6);
Insert into CHOX.MODEL (ID,MODEL,YEAR,CATEGORY_ID,CLASS_ID,MAKE_ID) values (10,'Avensis',to_date('2010-08-11','RRRR-MM-DD'),2,1,5);
Insert into CHOX.MODEL (ID,MODEL,YEAR,CATEGORY_ID,CLASS_ID,MAKE_ID) values (11,'Astra',to_date('2007-04-16','RRRR-MM-DD'),2,4,9);
Insert into CHOX.MODEL (ID,MODEL,YEAR,CATEGORY_ID,CLASS_ID,MAKE_ID) values (12,'Golf',to_date('2012-05-17','RRRR-MM-DD'),2,4,3);
REM INSERTING into CHOX.OPERATOR
SET DEFINE OFF;
Insert into CHOX.OPERATOR (ID,NAME,PHONE,EMAIL) values (1,'Ivan Petrov','0884356748','ivan@rent.bg');
Insert into CHOX.OPERATOR (ID,NAME,PHONE,EMAIL) values (2,'Petyr Hristov','0847362392','petyr@rent.bg');
Insert into CHOX.OPERATOR (ID,NAME,PHONE,EMAIL) values (3,'Gergana Trifonova
','0834214523','Geri@rent.bg');
REM INSERTING into CHOX.PAYMENT
SET DEFINE OFF;
REM INSERTING into CHOX.RENT
SET DEFINE OFF;
Insert into CHOX.RENT (ID,DAYSFROM,DAYSTO,OPERATOR_ID,CLIENT_ID,CARS_ID,INSURANCE_ID) values (2,to_date('2021-09-02','RRRR-MM-DD'),to_date('2021-09-04','RRRR-MM-DD'),3,1,12,2);
Insert into CHOX.RENT (ID,DAYSFROM,DAYSTO,OPERATOR_ID,CLIENT_ID,CARS_ID,INSURANCE_ID) values (1,to_date('2021-09-09','RRRR-MM-DD'),to_date('2021-09-13','RRRR-MM-DD'),2,3,4,1);
Insert into CHOX.RENT (ID,DAYSFROM,DAYSTO,OPERATOR_ID,CLIENT_ID,CARS_ID,INSURANCE_ID) values (3,to_date('2021-08-20','RRRR-MM-DD'),to_date('2021-09-01','RRRR-MM-DD'),1,2,5,2);
Insert into CHOX.RENT (ID,DAYSFROM,DAYSTO,OPERATOR_ID,CLIENT_ID,CARS_ID,INSURANCE_ID) values (4,to_date('2021-09-06','RRRR-MM-DD'),to_date('2021-09-13','RRRR-MM-DD'),1,3,2,1);
Insert into CHOX.RENT (ID,DAYSFROM,DAYSTO,OPERATOR_ID,CLIENT_ID,CARS_ID,INSURANCE_ID) values (5,to_date('2021-08-11','RRRR-MM-DD'),to_date('2021-08-13','RRRR-MM-DD'),1,1,6,2);
Insert into CHOX.RENT (ID,DAYSFROM,DAYSTO,OPERATOR_ID,CLIENT_ID,CARS_ID,INSURANCE_ID) values (6,to_date('2021-09-10','RRRR-MM-DD'),to_date('2021-09-13','RRRR-MM-DD'),1,5,5,1);
Insert into CHOX.RENT (ID,DAYSFROM,DAYSTO,OPERATOR_ID,CLIENT_ID,CARS_ID,INSURANCE_ID) values (7,to_date('2021-09-01','RRRR-MM-DD'),to_date('2021-09-14','RRRR-MM-DD'),1,5,8,2);
--------------------------------------------------------
--  DDL for Index CLIENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHOX"."CLIENT_PK" ON "CHOX"."CLIENT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MODEL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHOX"."MODEL_PK" ON "CHOX"."MODEL" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index CARS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHOX"."CARS_PK" ON "CHOX"."CARS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MAKE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHOX"."MAKE_PK" ON "CHOX"."MAKE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PAYMENT__IDXV1
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHOX"."PAYMENT__IDXV1" ON "CHOX"."PAYMENT" ("RENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index INSURANCE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHOX"."INSURANCE_PK" ON "CHOX"."INSURANCE" ("INSURANCE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index CLASS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHOX"."CLASS_PK" ON "CHOX"."CLASS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index RENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHOX"."RENT_PK" ON "CHOX"."RENT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index OPERATOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHOX"."OPERATOR_PK" ON "CHOX"."OPERATOR" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index CATEGORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHOX"."CATEGORY_PK" ON "CHOX"."CATEGORY" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PAYMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHOX"."PAYMENT_PK" ON "CHOX"."PAYMENT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table OPERATOR
--------------------------------------------------------

  ALTER TABLE "CHOX"."OPERATOR" ADD CONSTRAINT "OPERATOR_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CHOX"."OPERATOR" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PAYMENT
--------------------------------------------------------

  ALTER TABLE "CHOX"."PAYMENT" ADD CONSTRAINT "PAYMENT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CHOX"."PAYMENT" MODIFY ("RENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CHOX"."PAYMENT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table INSURANCE
--------------------------------------------------------

  ALTER TABLE "CHOX"."INSURANCE" ADD CONSTRAINT "INSURANCE_PK" PRIMARY KEY ("INSURANCE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CHOX"."INSURANCE" MODIFY ("INSURANCE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RENT
--------------------------------------------------------

  ALTER TABLE "CHOX"."RENT" MODIFY ("INSURANCE_ID" NOT NULL ENABLE);
  ALTER TABLE "CHOX"."RENT" ADD CONSTRAINT "RENT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CHOX"."RENT" MODIFY ("CARS_ID" NOT NULL ENABLE);
  ALTER TABLE "CHOX"."RENT" MODIFY ("CLIENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CHOX"."RENT" MODIFY ("OPERATOR_ID" NOT NULL ENABLE);
  ALTER TABLE "CHOX"."RENT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MODEL
--------------------------------------------------------

  ALTER TABLE "CHOX"."MODEL" ADD CONSTRAINT "MODEL_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CHOX"."MODEL" MODIFY ("MAKE_ID" NOT NULL ENABLE);
  ALTER TABLE "CHOX"."MODEL" MODIFY ("CLASS_ID" NOT NULL ENABLE);
  ALTER TABLE "CHOX"."MODEL" MODIFY ("CATEGORY_ID" NOT NULL ENABLE);
  ALTER TABLE "CHOX"."MODEL" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CLIENT
--------------------------------------------------------

  ALTER TABLE "CHOX"."CLIENT" ADD CONSTRAINT "CLIENT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CHOX"."CLIENT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CLASS
--------------------------------------------------------

  ALTER TABLE "CHOX"."CLASS" ADD CONSTRAINT "CLASS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CHOX"."CLASS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "CHOX"."CATEGORY" ADD CONSTRAINT "CATEGORY_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CHOX"."CATEGORY" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CARS
--------------------------------------------------------

  ALTER TABLE "CHOX"."CARS" ADD CONSTRAINT "CARS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CHOX"."CARS" MODIFY ("MODEL_ID" NOT NULL ENABLE);
  ALTER TABLE "CHOX"."CARS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MAKE
--------------------------------------------------------

  ALTER TABLE "CHOX"."MAKE" ADD CONSTRAINT "MAKE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CHOX"."MAKE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CARS
--------------------------------------------------------

  ALTER TABLE "CHOX"."CARS" ADD CONSTRAINT "CARS_MODEL_FK" FOREIGN KEY ("MODEL_ID")
	  REFERENCES "CHOX"."MODEL" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MODEL
--------------------------------------------------------

  ALTER TABLE "CHOX"."MODEL" ADD CONSTRAINT "MODEL_CATEGORY_FK" FOREIGN KEY ("CATEGORY_ID")
	  REFERENCES "CHOX"."CATEGORY" ("ID") ENABLE;
  ALTER TABLE "CHOX"."MODEL" ADD CONSTRAINT "MODEL_CLASS_FK" FOREIGN KEY ("CLASS_ID")
	  REFERENCES "CHOX"."CLASS" ("ID") ENABLE;
  ALTER TABLE "CHOX"."MODEL" ADD CONSTRAINT "MODEL_MAKE_FK" FOREIGN KEY ("MAKE_ID")
	  REFERENCES "CHOX"."MAKE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PAYMENT
--------------------------------------------------------

  ALTER TABLE "CHOX"."PAYMENT" ADD CONSTRAINT "PAYMENT_RENT_FK" FOREIGN KEY ("RENT_ID")
	  REFERENCES "CHOX"."RENT" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RENT
--------------------------------------------------------

  ALTER TABLE "CHOX"."RENT" ADD CONSTRAINT "RENT_CARS_FK" FOREIGN KEY ("CARS_ID")
	  REFERENCES "CHOX"."CARS" ("ID") ENABLE;
  ALTER TABLE "CHOX"."RENT" ADD CONSTRAINT "RENT_CLIENT_FK" FOREIGN KEY ("CLIENT_ID")
	  REFERENCES "CHOX"."CLIENT" ("ID") ENABLE;
  ALTER TABLE "CHOX"."RENT" ADD CONSTRAINT "RENT_INSURANCE_FK" FOREIGN KEY ("INSURANCE_ID")
	  REFERENCES "CHOX"."INSURANCE" ("INSURANCE_ID") ENABLE;
  ALTER TABLE "CHOX"."RENT" ADD CONSTRAINT "RENT_OPERATOR_FK" FOREIGN KEY ("OPERATOR_ID")
	  REFERENCES "CHOX"."OPERATOR" ("ID") ENABLE;
