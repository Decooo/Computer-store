--------------------------------------------------------
--  File created - czwartek-maj-25-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type CATEGORY_TABLE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "JAKUB"."CATEGORY_TABLE" as table of category_type;

/
--------------------------------------------------------
--  DDL for Type CATEGORY_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "JAKUB"."CATEGORY_TYPE" as object(
categoryID Number(10),
categoryName varchar2(50),
categoryDescription varchar2(255));

/
--------------------------------------------------------
--  DDL for Sequence CART_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JAKUB"."CART_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence CATEGORY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JAKUB"."CATEGORY_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence CLIENT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JAKUB"."CLIENT_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence HIBERNATE_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "JAKUB"."HIBERNATE_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence ORDERDETAILS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JAKUB"."ORDERDETAILS_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence ORDERS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JAKUB"."ORDERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence PRODUCT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JAKUB"."PRODUCT_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence USERS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JAKUB"."USERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 83 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------

  CREATE TABLE "JAKUB"."CART" 
   (	"CARTID" NUMBER(10,0), 
	"USERID" NUMBER(10,0), 
	"PRODUCTID" NUMBER(10,0), 
	"QUANTITY" NUMBER(4,0), 
	"TOTALPRICE" NUMBER(10,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "JAKUB"."CATEGORY" 
   (	"CATEGORYID" NUMBER(10,0), 
	"CATEGORYNAME" VARCHAR2(50 BYTE), 
	"CATEGORYDESCRIPTION" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CLIENT
--------------------------------------------------------

  CREATE TABLE "JAKUB"."CLIENT" 
   (	"CLIENTID" NUMBER(10,0), 
	"FIRSTNAME" VARCHAR2(50 BYTE), 
	"LASTNAME" VARCHAR2(50 BYTE), 
	"EMAILADDRESS" VARCHAR2(255 BYTE), 
	"STREET" VARCHAR2(50 BYTE), 
	"NUMBERHOUSE" VARCHAR2(20 BYTE), 
	"POSTCODE" VARCHAR2(6 BYTE), 
	"CITY" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ORDERDETAILS
--------------------------------------------------------

  CREATE TABLE "JAKUB"."ORDERDETAILS" 
   (	"ORDERDETAILSID" NUMBER(10,0), 
	"ORDERID" NUMBER(10,0), 
	"PRODUCTID" NUMBER(10,0), 
	"QUANTITY" NUMBER(4,0), 
	"PRICE" NUMBER(10,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "JAKUB"."ORDERS" 
   (	"ORDERID" NUMBER(10,0), 
	"ORDERDATE" DATE, 
	"USERID" NUMBER(10,0), 
	"TOTALPRICE" NUMBER(10,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "JAKUB"."PRODUCT" 
   (	"PRODUCTID" NUMBER(10,0), 
	"PRODUCTNAME" VARCHAR2(50 BYTE), 
	"PRODUCTPRICE" NUMBER(10,2), 
	"PRODUCTDESCRIPTION" VARCHAR2(255 BYTE), 
	"CATEGORYID" NUMBER(10,0), 
	"PICTURE" BLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("PICTURE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "JAKUB"."USERS" 
   (	"USERID" NUMBER(10,0), 
	"USERNAME" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(32 BYTE), 
	"CLIENTID" NUMBER(10,0), 
	"USERROLE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into JAKUB.CART
SET DEFINE OFF;
Insert into JAKUB.CART (CARTID,USERID,PRODUCTID,QUANTITY,TOTALPRICE) values ('74','23','63','1','729');
Insert into JAKUB.CART (CARTID,USERID,PRODUCTID,QUANTITY,TOTALPRICE) values ('86','46','2','1','51,9');
Insert into JAKUB.CART (CARTID,USERID,PRODUCTID,QUANTITY,TOTALPRICE) values ('40','73','2','1','51,9');
Insert into JAKUB.CART (CARTID,USERID,PRODUCTID,QUANTITY,TOTALPRICE) values ('41','73','1','1','87');
Insert into JAKUB.CART (CARTID,USERID,PRODUCTID,QUANTITY,TOTALPRICE) values ('71','23','2','2','51,9');
Insert into JAKUB.CART (CARTID,USERID,PRODUCTID,QUANTITY,TOTALPRICE) values ('72','23','3','0','107');
Insert into JAKUB.CART (CARTID,USERID,PRODUCTID,QUANTITY,TOTALPRICE) values ('70','23','1','5','87');
Insert into JAKUB.CART (CARTID,USERID,PRODUCTID,QUANTITY,TOTALPRICE) values ('80','46','65','1','279,99');
Insert into JAKUB.CART (CARTID,USERID,PRODUCTID,QUANTITY,TOTALPRICE) values ('78','46','62','1','648');
Insert into JAKUB.CART (CARTID,USERID,PRODUCTID,QUANTITY,TOTALPRICE) values ('84','3','64','1','248,99');
Insert into JAKUB.CART (CARTID,USERID,PRODUCTID,QUANTITY,TOTALPRICE) values ('85','3','63','1','729');
REM INSERTING into JAKUB.CATEGORY
SET DEFINE OFF;
Insert into JAKUB.CATEGORY (CATEGORYID,CATEGORYNAME,CATEGORYDESCRIPTION) values ('3','Myszki','Myszki komputerowe w najlepszych cenach.');
Insert into JAKUB.CATEGORY (CATEGORYID,CATEGORYNAME,CATEGORYDESCRIPTION) values ('4','Klawiatury','Klawiatury przewodowe i bezprzewodow od renomowanych producentów.');
Insert into JAKUB.CATEGORY (CATEGORYID,CATEGORYNAME,CATEGORYDESCRIPTION) values ('5','Sluchawki','Sluchawki przewodowe oraz bezprzewodowe. Dostepne modele wszystkich renomowanych producentów. Dostêpne w najlepszy cenach na rynku.');
Insert into JAKUB.CATEGORY (CATEGORYID,CATEGORYNAME,CATEGORYDESCRIPTION) values ('21','Monitory','Najlepsze monitory w technologii 4K');
REM INSERTING into JAKUB.CLIENT
SET DEFINE OFF;
Insert into JAKUB.CLIENT (CLIENTID,FIRSTNAME,LASTNAME,EMAILADDRESS,STREET,NUMBERHOUSE,POSTCODE,CITY) values ('68','test','test','test','Hermanowa','324','36-020','Tyczyn');
Insert into JAKUB.CLIENT (CLIENTID,FIRSTNAME,LASTNAME,EMAILADDRESS,STREET,NUMBERHOUSE,POSTCODE,CITY) values ('1','Hubert','Ptak','ptakh@gmail.com','Kraczkowa','124','37-124','Kraczkowa');
Insert into JAKUB.CLIENT (CLIENTID,FIRSTNAME,LASTNAME,EMAILADDRESS,STREET,NUMBERHOUSE,POSTCODE,CITY) values ('2','Bogdan','Sroka','srokab@gmail.com','Malawa','457','36-007','Krasne');
Insert into JAKUB.CLIENT (CLIENTID,FIRSTNAME,LASTNAME,EMAILADDRESS,STREET,NUMBERHOUSE,POSTCODE,CITY) values ('3','Eryk','Wrona','wronae@gmail.com','Albigowa','874','37-122','Albigowa');
Insert into JAKUB.CLIENT (CLIENTID,FIRSTNAME,LASTNAME,EMAILADDRESS,STREET,NUMBERHOUSE,POSTCODE,CITY) values ('4','Patryk','Kruk','krukp@gmail.com','Albigowa','123','37-122','Albigowa');
Insert into JAKUB.CLIENT (CLIENTID,FIRSTNAME,LASTNAME,EMAILADDRESS,STREET,NUMBERHOUSE,POSTCODE,CITY) values ('6','Piotr','Kozyra','kozyrap@gmail.com','Albigowa','457','37-122','Albigowa');
Insert into JAKUB.CLIENT (CLIENTID,FIRSTNAME,LASTNAME,EMAILADDRESS,STREET,NUMBERHOUSE,POSTCODE,CITY) values ('91','Jan','Brzechwa','janb@gmail.com','Hermanowa, 345, 345','345','36-020','Tyczyn');
REM INSERTING into JAKUB.ORDERDETAILS
SET DEFINE OFF;
Insert into JAKUB.ORDERDETAILS (ORDERDETAILSID,ORDERID,PRODUCTID,QUANTITY,PRICE) values ('22','24','1','1','87');
Insert into JAKUB.ORDERDETAILS (ORDERDETAILSID,ORDERID,PRODUCTID,QUANTITY,PRICE) values ('23','24','2','1','51,9');
Insert into JAKUB.ORDERDETAILS (ORDERDETAILSID,ORDERID,PRODUCTID,QUANTITY,PRICE) values ('5','1','1','1','87');
Insert into JAKUB.ORDERDETAILS (ORDERDETAILSID,ORDERID,PRODUCTID,QUANTITY,PRICE) values ('6','2','3','2','107');
Insert into JAKUB.ORDERDETAILS (ORDERDETAILSID,ORDERID,PRODUCTID,QUANTITY,PRICE) values ('24','25','1','2','87');
Insert into JAKUB.ORDERDETAILS (ORDERDETAILSID,ORDERID,PRODUCTID,QUANTITY,PRICE) values ('25','25','62','1','648');
Insert into JAKUB.ORDERDETAILS (ORDERDETAILSID,ORDERID,PRODUCTID,QUANTITY,PRICE) values ('26','25','3','1','107');
Insert into JAKUB.ORDERDETAILS (ORDERDETAILSID,ORDERID,PRODUCTID,QUANTITY,PRICE) values ('27','25','64','1','248,99');
Insert into JAKUB.ORDERDETAILS (ORDERDETAILSID,ORDERID,PRODUCTID,QUANTITY,PRICE) values ('28','26','2','2','51,9');
Insert into JAKUB.ORDERDETAILS (ORDERDETAILSID,ORDERID,PRODUCTID,QUANTITY,PRICE) values ('29','26','64','1','248,99');
Insert into JAKUB.ORDERDETAILS (ORDERDETAILSID,ORDERID,PRODUCTID,QUANTITY,PRICE) values ('30','26','3','1','107');
REM INSERTING into JAKUB.ORDERS
SET DEFINE OFF;
Insert into JAKUB.ORDERS (ORDERID,ORDERDATE,USERID,TOTALPRICE) values ('24',to_date('17/05/17','RR/MM/DD'),'23','138,9');
Insert into JAKUB.ORDERS (ORDERID,ORDERDATE,USERID,TOTALPRICE) values ('1',to_date('17/03/16','RR/MM/DD'),'1','87');
Insert into JAKUB.ORDERS (ORDERID,ORDERDATE,USERID,TOTALPRICE) values ('2',to_date('17/03/16','RR/MM/DD'),'2','107');
Insert into JAKUB.ORDERS (ORDERID,ORDERDATE,USERID,TOTALPRICE) values ('25',to_date('17/05/23','RR/MM/DD'),'46','1142,65');
Insert into JAKUB.ORDERS (ORDERID,ORDERDATE,USERID,TOTALPRICE) values ('26',to_date('17/05/23','RR/MM/DD'),'3','459,79');
REM INSERTING into JAKUB.PRODUCT
SET DEFINE OFF;
Insert into JAKUB.PRODUCT (PRODUCTID,PRODUCTNAME,PRODUCTPRICE,PRODUCTDESCRIPTION,CATEGORYID) values ('1','Logitech M510
','87','Pe³nowymiarowa, laserowa mysz bezprzewodowa oferuje komfort i dodatkowe przyciski, dziêki którym mo¿na pracowaæ nie tylko wydajniej, ale i wygodniej.','3');
Insert into JAKUB.PRODUCT (PRODUCTID,PRODUCTNAME,PRODUCTPRICE,PRODUCTDESCRIPTION,CATEGORYID) values ('2','Logitech M325','51,9','Bezprzewodowa, optyczna mysz do laptopa','3');
Insert into JAKUB.PRODUCT (PRODUCTID,PRODUCTNAME,PRODUCTPRICE,PRODUCTDESCRIPTION,CATEGORYID) values ('3','Logitech K400','107','Najwy¿szej jakoœci klawiatura bezprzewodowa. Mega wygodna w u¿ytkowaniu. A do tego panel dotykowy zastêpuj¹cy myszkê!','4');
Insert into JAKUB.PRODUCT (PRODUCTID,PRODUCTNAME,PRODUCTPRICE,PRODUCTDESCRIPTION,CATEGORYID) values ('64','S³uchawka Bluetooth PLANTRONIC','248,99','Plantronics Voyager Legend to pierwszy prawdziwie inteligentny   zestaw s³uchawkowy Bluetooth. Technologia Smart Sensor   pozwala na automatyczne odbieranie po³¹czeñ.','5');
Insert into JAKUB.PRODUCT (PRODUCTID,PRODUCTNAME,PRODUCTPRICE,PRODUCTDESCRIPTION,CATEGORYID) values ('65','JABRA MOVE BLUE s³uchawki bezprzewodowe','279,99','Harmonijna skandynawska konstrukcja i krystalicznie czysty cyfrowy dŸwiêk oraz idealne dopasowanie dziêki bardzo lekkiemu, wygodnemu pa³¹kowi.','5');
Insert into JAKUB.PRODUCT (PRODUCTID,PRODUCTNAME,PRODUCTPRICE,PRODUCTDESCRIPTION,CATEGORYID) values ('63','Monitor BENQ LED 22','729','Monitor GL2250 spe³nia wymagania programu ENERGY STAR ® dla monitorów komputerowych, wersja 5.0. Teraz mo¿esz cieszyæ siê oszczêdnoœci¹ energii i pieniêdzy.','21');
Insert into JAKUB.PRODUCT (PRODUCTID,PRODUCTNAME,PRODUCTPRICE,PRODUCTDESCRIPTION,CATEGORYID) values ('62','Monitor LCD DELL U2410','648','Dell Ultrasharp U2410 to wysokiej klasy monitor rekomendowany do zastosowañ profesjonalnych oraz dla wymagaj¹cych u¿ytkowników.','21');
REM INSERTING into JAKUB.USERS
SET DEFINE OFF;
Insert into JAKUB.USERS (USERID,USERNAME,PASSWORD,CLIENTID,USERROLE) values ('23','admin','admin','1','administrator');
Insert into JAKUB.USERS (USERID,USERNAME,PASSWORD,CLIENTID,USERROLE) values ('46','test','test','68','client');
Insert into JAKUB.USERS (USERID,USERNAME,PASSWORD,CLIENTID,USERROLE) values ('1','hubert','hubert','1','client');
Insert into JAKUB.USERS (USERID,USERNAME,PASSWORD,CLIENTID,USERROLE) values ('2','bogdan','bogdan','2','client');
Insert into JAKUB.USERS (USERID,USERNAME,PASSWORD,CLIENTID,USERROLE) values ('3','eryk','eryk','3','client');
Insert into JAKUB.USERS (USERID,USERNAME,PASSWORD,CLIENTID,USERROLE) values ('4','patryk','patryk','4','client');
Insert into JAKUB.USERS (USERID,USERNAME,PASSWORD,CLIENTID,USERROLE) values ('9','piotr','piotr','6','client');
Insert into JAKUB.USERS (USERID,USERNAME,PASSWORD,CLIENTID,USERROLE) values ('73','ewa','ewa','91','client');
--------------------------------------------------------
--  DDL for Index ORDERDETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JAKUB"."ORDERDETAILS_PK" ON "JAKUB"."ORDERDETAILS" ("ORDERDETAILSID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CART_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JAKUB"."CART_PK" ON "JAKUB"."CART" ("CARTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JAKUB"."USERS_PK" ON "JAKUB"."USERS" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CATEGORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JAKUB"."CATEGORY_PK" ON "JAKUB"."CATEGORY" ("CATEGORYID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CLIENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JAKUB"."CLIENT_PK" ON "JAKUB"."CLIENT" ("CLIENTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ORDERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JAKUB"."ORDERS_PK" ON "JAKUB"."ORDERS" ("ORDERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JAKUB"."PRODUCT_PK" ON "JAKUB"."PRODUCT" ("PRODUCTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "JAKUB"."ORDERS" ADD CONSTRAINT "ORDERS_PK" PRIMARY KEY ("ORDERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "JAKUB"."ORDERS" MODIFY ("USERID" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."ORDERS" MODIFY ("ORDERDATE" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."ORDERS" MODIFY ("ORDERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "JAKUB"."CATEGORY" ADD CONSTRAINT "CATEGORY_PK" PRIMARY KEY ("CATEGORYID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "JAKUB"."CATEGORY" MODIFY ("CATEGORYDESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."CATEGORY" MODIFY ("CATEGORYNAME" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."CATEGORY" MODIFY ("CATEGORYID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "JAKUB"."USERS" MODIFY ("USERROLE" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."USERS" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."USERS" MODIFY ("CLIENTID" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."USERS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "JAKUB"."USERS" MODIFY ("USERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "JAKUB"."PRODUCT" ADD CONSTRAINT "PRODUCT_PK" PRIMARY KEY ("PRODUCTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "JAKUB"."PRODUCT" MODIFY ("CATEGORYID" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."PRODUCT" MODIFY ("PRODUCTDESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."PRODUCT" MODIFY ("PRODUCTPRICE" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."PRODUCT" MODIFY ("PRODUCTNAME" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."PRODUCT" MODIFY ("PRODUCTID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDERDETAILS
--------------------------------------------------------

  ALTER TABLE "JAKUB"."ORDERDETAILS" ADD CONSTRAINT "ORDERDETAILS_PK" PRIMARY KEY ("ORDERDETAILSID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "JAKUB"."ORDERDETAILS" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."ORDERDETAILS" MODIFY ("QUANTITY" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."ORDERDETAILS" MODIFY ("PRODUCTID" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."ORDERDETAILS" MODIFY ("ORDERID" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."ORDERDETAILS" MODIFY ("ORDERDETAILSID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "JAKUB"."CART" ADD CONSTRAINT "CART_PK" PRIMARY KEY ("CARTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "JAKUB"."CART" MODIFY ("TOTALPRICE" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."CART" MODIFY ("QUANTITY" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."CART" MODIFY ("PRODUCTID" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."CART" MODIFY ("USERID" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."CART" MODIFY ("CARTID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CLIENT
--------------------------------------------------------

  ALTER TABLE "JAKUB"."CLIENT" ADD CONSTRAINT "CLIENT_PK" PRIMARY KEY ("CLIENTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "JAKUB"."CLIENT" MODIFY ("CITY" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."CLIENT" MODIFY ("POSTCODE" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."CLIENT" MODIFY ("NUMBERHOUSE" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."CLIENT" MODIFY ("STREET" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."CLIENT" MODIFY ("EMAILADDRESS" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."CLIENT" MODIFY ("LASTNAME" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."CLIENT" MODIFY ("FIRSTNAME" NOT NULL ENABLE);
  ALTER TABLE "JAKUB"."CLIENT" MODIFY ("CLIENTID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "JAKUB"."CART" ADD CONSTRAINT "CARTPRODUCTID" FOREIGN KEY ("PRODUCTID")
	  REFERENCES "JAKUB"."PRODUCT" ("PRODUCTID") ENABLE;
  ALTER TABLE "JAKUB"."CART" ADD CONSTRAINT "CARTUSERID" FOREIGN KEY ("USERID")
	  REFERENCES "JAKUB"."USERS" ("USERID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERDETAILS
--------------------------------------------------------

  ALTER TABLE "JAKUB"."ORDERDETAILS" ADD CONSTRAINT "ORDERID" FOREIGN KEY ("ORDERID")
	  REFERENCES "JAKUB"."ORDERS" ("ORDERID") ENABLE;
  ALTER TABLE "JAKUB"."ORDERDETAILS" ADD CONSTRAINT "PRODUCTID" FOREIGN KEY ("PRODUCTID")
	  REFERENCES "JAKUB"."PRODUCT" ("PRODUCTID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "JAKUB"."ORDERS" ADD CONSTRAINT "USERID" FOREIGN KEY ("USERID")
	  REFERENCES "JAKUB"."USERS" ("USERID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "JAKUB"."PRODUCT" ADD CONSTRAINT "CATEGORYID" FOREIGN KEY ("CATEGORYID")
	  REFERENCES "JAKUB"."CATEGORY" ("CATEGORYID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "JAKUB"."USERS" ADD CONSTRAINT "CLIENTID" FOREIGN KEY ("CLIENTID")
	  REFERENCES "JAKUB"."CLIENT" ("CLIENTID") ENABLE;
--------------------------------------------------------
--  DDL for Trigger CART_AUTONUMERATION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "JAKUB"."CART_AUTONUMERATION" 
 BEFORE INSERT ON cart
 FOR EACH ROW
    BEGIN
      :new.cartID:=CART_SEQ.nextval;
    END;
/
ALTER TRIGGER "JAKUB"."CART_AUTONUMERATION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CATEGORY_AUTONUMERATION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "JAKUB"."CATEGORY_AUTONUMERATION" 
 BEFORE INSERT ON category
 FOR EACH ROW
    BEGIN
      :new.categoryID:=CATEGORY_SEQ.nextval;
    END;
/
ALTER TRIGGER "JAKUB"."CATEGORY_AUTONUMERATION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CLIENT_AUTONUMERATION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "JAKUB"."CLIENT_AUTONUMERATION" 
 BEFORE INSERT ON CLIENT
 FOR EACH ROW
    BEGIN
      :new.clientID:=CLIENT_SEQ.nextval;
    END;
/
ALTER TRIGGER "JAKUB"."CLIENT_AUTONUMERATION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDERDETAILS_AUTONUMERATION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "JAKUB"."ORDERDETAILS_AUTONUMERATION" 
 BEFORE INSERT ON orderDetails
 FOR EACH ROW
    BEGIN
      :new.orderDetailsID:=ORDERDETAILS_SEQ.nextval;
    END;
/
ALTER TRIGGER "JAKUB"."ORDERDETAILS_AUTONUMERATION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDERS_AUTONUMERATION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "JAKUB"."ORDERS_AUTONUMERATION" 
 BEFORE INSERT ON orders
 FOR EACH ROW
    BEGIN
      :new.orderID:=ORDERS_SEQ.nextval;
    END;
/
ALTER TRIGGER "JAKUB"."ORDERS_AUTONUMERATION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRODUCT_AUTONUMERATION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "JAKUB"."PRODUCT_AUTONUMERATION" 
 BEFORE INSERT ON product
 FOR EACH ROW
    BEGIN
      :new.productID:=PRODUCT_SEQ.nextval;
    END;
/
ALTER TRIGGER "JAKUB"."PRODUCT_AUTONUMERATION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERS_AUTONUMERATION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "JAKUB"."USERS_AUTONUMERATION" 
 BEFORE INSERT ON users
 FOR EACH ROW
    BEGIN
      :new.userID:=USERS_SEQ.nextval;
    END;
/
ALTER TRIGGER "JAKUB"."USERS_AUTONUMERATION" ENABLE;
--------------------------------------------------------
--  DDL for Function ADD_QUANTITY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "JAKUB"."ADD_QUANTITY" (
      c_id IN cart.quantity%type)
    RETURN INTEGER
  AS
    myresult cart.quantity%type;
  BEGIN
    SELECT cart.quantity INTO myresult FROM cart WHERE cart.cartID= c_id;
    IF myresult != 0 THEN
      myresult  := myresult +1;
    END IF;
    DBMS_OUTPUT.PUT_LINE('myresult = ' || myresult);
    update_quantity(myresult,c_id);
    RETURN myresult;
  END add_quantity;

/
--------------------------------------------------------
--  DDL for Function CALCULATE_REBATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "JAKUB"."CALCULATE_REBATE" (
      c_userid IN cart.userid%type,
      amount OUT cart.totalPrice%type)
    RETURN NUMBER
  AS
    rebate NUMBER;
  BEGIN
    SELECT SUM(totalPrice*quantity) INTO amount FROM cart WHERE userid=c_userID;
    IF amount    <500 THEN
      rebate    :=0;
    elsif amount>=500 AND amount<3000 THEN
      rebate    :=amount*0.03;
    elsif amount>=3000 AND amount<5000 THEN
      rebate    :=amount*0.05;
    elsif amount>=5000 AND amount<8000 THEN
      rebate    :=amount*0.08;
    elsif amount>=8000 THEN
      rebate    :=amount*0.1;
    END IF;
    RETURN rebate;
  END CALCULATE_REBATE;

/
--------------------------------------------------------
--  DDL for Function GET_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "JAKUB"."GET_DATE" 
    RETURN DATE
  AS
  BEGIN
    RETURN sysdate;
  END GET_DATE;

/
--------------------------------------------------------
--  DDL for Function REDUCE_QUANTITY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "JAKUB"."REDUCE_QUANTITY" (
      c_id IN cart.quantity%type)
    RETURN INTEGER
  AS
    myresult cart.quantity%type;
  BEGIN
    SELECT cart.quantity INTO myresult FROM cart WHERE cart.cartID= c_id;
    IF myresult > 0 THEN
      myresult  := myresult -1;
    END IF;
    DBMS_OUTPUT.PUT_LINE('myresult = ' || myresult);
    update_quantity(myresult,c_id);
    RETURN myresult;
  END reduce_quantity;

/
--------------------------------------------------------
--  DDL for Package P_CART
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "JAKUB"."P_CART" 
AS
  PROCEDURE add_product_to_cart(
      userID     IN cart.userID%type,
      productID  IN cart.productID%type,
      quantity   IN cart.quantity%type,
      totalprice IN cart.quantity%type);
  PROCEDURE clear_cart(
      c_id IN cart.userid%type);
  PROCEDURE delete_product_from_cart(
      c_id IN cart.cartid%type);
  PROCEDURE get_amount(
      c_userID IN cart.userID%type,
      c_totalPrice OUT cart.totalPrice%type);
  PROCEDURE update_quantity(
      c_quantity IN cart.quantity%type,
      c_id       IN cart.cartid%type );
  FUNCTION add_quantity(
      c_id IN cart.quantity%type)
    RETURN INTEGER;
  FUNCTION CALCULATE_REBATE(
      c_userid IN cart.userid%type,
      amount OUT cart.totalPrice%type)
    RETURN NUMBER;
  FUNCTION GET_DATE
    RETURN DATE;
  FUNCTION reduce_quantity(
      c_id IN cart.quantity%type)
    RETURN INTEGER;
END P_CART;

/
--------------------------------------------------------
--  DDL for Package P_CATEGORY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "JAKUB"."P_CATEGORY" 
AS
  PROCEDURE update_category(
      c_id   IN category.categoryid%type,
      c_name IN category.categoryName%type,
      c_desc IN category.categorydescription%type);
  PROCEDURE delete_category(
      c_id IN category.categoryid%type);
  PROCEDURE addcategory(
      c_categoryName        IN VARCHAR2,
      c_categoryDescription IN VARCHAR2 DEFAULT NULL);
  PROCEDURE find_category_by_id(
      c_id IN category.categoryid%type,
      c_name OUT category.categoryname%type,
      c_desc OUT category.categorydescription%type );
  PROCEDURE get_all_category(
      catID OUT category.categoryID%type,
      catName OUT category.categoryname%type,
      catDesc OUT category.categorydescription%type);
END P_CATEGORY;

/
--------------------------------------------------------
--  DDL for Package P_ORDERS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "JAKUB"."P_ORDERS" 
AS
  PROCEDURE add_orders(
      o_userid IN orders.userid%type,
      o_price  IN orders.totalprice%type,
      o_orderid OUT orders.orderid%type );
  PROCEDURE add_orderdetail(
      o_orderid   IN orderdetails.orderid%type,
      o_productid IN orderdetails.productid%type,
      o_quantity  IN orderdetails.quantity%type,
      o_price     IN orderdetails.price%type);
END P_ORDERS;

/
--------------------------------------------------------
--  DDL for Package P_PRODUCT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "JAKUB"."P_PRODUCT" 
AS
  PROCEDURE add_product(
      p_name  IN product.productname%type,
      p_desc  IN product.productdescription%type,
      p_price IN product.productprice%type,
      picture IN product.picture%type,
      cat     IN product.categoryid%type);
  PROCEDURE delete_product(
      p_id IN product.productid%type);
  PROCEDURE find_product_by_id(
      p_id IN product.productid%type,
      p_name OUT product.productname%type,
      p_desc OUT product.productdescription%type,
      p_price OUT product.productprice%type,
      p_picture OUT product.picture%type,
      p_cat OUT product.categoryid%type);
  PROCEDURE update_product(
      p_id      IN product.productid%type,
      p_name    IN product.productname%type,
      p_desc    IN product.productdescription%type,
      p_price   IN product.productprice%type,
      p_picture IN product.picture%type,
      p_cat     IN product.categoryid%type);
  END P_PRODUCT;

/
--------------------------------------------------------
--  DDL for Package P_USERS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "JAKUB"."P_USERS" 
AS
  PROCEDURE add_client(
      c_firstname    IN client.firstname%TYPE,
      c_lastname     IN client.lastname%TYPE,
      c_emailaddress IN client.emailaddress%TYPE,
      c_street       IN client.street%TYPE,
      c_numberhouse  IN client.numberhouse%TYPE,
      c_postcode     IN client.postcode%TYPE,
      c_city         IN client.city%TYPE,
      c_clientID OUT client.clientID%TYPE,
      u_username IN users.username%TYPE,
      u_password IN users.password%TYPE);
  PROCEDURE GET_USER(
      U_USERNAME IN OUT VARCHAR2,
      U_ID OUT NUMBER ,
      U_PASSWORD OUT VARCHAR2 ,
      U_CLIENTID OUT NUMBER ,
      U_ROLE OUT VARCHAR2 );
  PROCEDURE get_user_id(
      u_id OUT users.userid%type,
      u_username IN users.username%type);
  PROCEDURE find_users_by_id(
      u_id IN users.userID%type,
      u_username OUT users.username%type);
END P_USERS;

/
--------------------------------------------------------
--  DDL for Package Body P_CART
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "JAKUB"."P_CART" 
AS
PROCEDURE add_product_to_cart(
    userID     IN cart.userID%type,
    productID  IN cart.productID%type,
    quantity   IN cart.quantity%type,
    totalprice IN cart.quantity%type)
AS
BEGIN
  INSERT
  INTO cart
    (
      userID,
      productID,
      quantity,
      totalprice
    )
    VALUES
    (
      userID,
      productID,
      quantity,
      totalprice
    );
END add_product_to_cart;
PROCEDURE clear_cart
  (
    c_id IN cart.userid%type
  )
AS
BEGIN
  DELETE FROM cart WHERE userID=c_id;
END;
PROCEDURE delete_product_from_cart(
    c_id IN cart.cartid%type)
AS
BEGIN
  DELETE FROM cart WHERE cartid=c_id;
END;
PROCEDURE get_amount(
    c_userID IN cart.userID%type,
    c_totalPrice OUT cart.totalPrice%type)
AS
BEGIN
  SELECT SUM(totalPrice*quantity)
  INTO c_totalPrice
  FROM cart
  WHERE userid=c_userID;
END get_amount;
PROCEDURE update_quantity(
    c_quantity IN cart.quantity%type,
    c_id       IN cart.cartid%type )
AS
BEGIN
  UPDATE cart SET quantity =c_quantity WHERE cartID =c_id;
END;
FUNCTION add_quantity(
    c_id IN cart.quantity%type)
  RETURN INTEGER
AS
  myresult cart.quantity%type;
BEGIN
  SELECT cart.quantity INTO myresult FROM cart WHERE cart.cartID= c_id;
  IF myresult != 0 THEN
    myresult  := myresult +1;
  END IF;
  DBMS_OUTPUT.PUT_LINE('myresult = ' || myresult);
  update_quantity(myresult,c_id);
  RETURN myresult;
END add_quantity;
FUNCTION CALCULATE_REBATE(
    c_userid IN cart.userid%type,
    amount OUT cart.totalPrice%type)
  RETURN NUMBER
AS
  rebate NUMBER;
BEGIN
  SELECT SUM(totalPrice*quantity) INTO amount FROM cart WHERE userid=c_userID;
  IF amount    <500 THEN
    rebate    :=0;
  elsif amount>=500 AND amount<3000 THEN
    rebate    :=amount*0.03;
  elsif amount>=3000 AND amount<5000 THEN
    rebate    :=amount*0.05;
  elsif amount>=5000 AND amount<8000 THEN
    rebate    :=amount*0.08;
  elsif amount>=8000 THEN
    rebate    :=amount*0.1;
  END IF;
  RETURN rebate;
END CALCULATE_REBATE;
FUNCTION GET_DATE
    RETURN DATE
  AS
  BEGIN
    RETURN sysdate;
  END GET_DATE;
FUNCTION reduce_quantity(
    c_id IN cart.quantity%type)
  RETURN INTEGER
AS
  myresult cart.quantity%type;
BEGIN
  SELECT cart.quantity INTO myresult FROM cart WHERE cart.cartID= c_id;
  IF myresult > 0 THEN
    myresult := myresult -1;
  END IF;
  DBMS_OUTPUT.PUT_LINE('myresult = ' || myresult);
  update_quantity(myresult,c_id);
  RETURN myresult;
END reduce_quantity;
END P_CART;

/
--------------------------------------------------------
--  DDL for Package Body P_CATEGORY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "JAKUB"."P_CATEGORY" 
AS
PROCEDURE update_category(
    c_id   IN category.categoryid%type,
    c_name IN category.categoryName%type,
    c_desc IN category.categorydescription%type)
AS
BEGIN
  UPDATE category
  SET categoryname     =c_name,
    categorydescription=c_desc
  WHERE categoryID     =c_id;
END update_category;
PROCEDURE delete_category(
    c_id IN category.categoryid%type)
AS
BEGIN
  DELETE FROM category WHERE categoryID=c_id;
END delete_category;
PROCEDURE addcategory(
    c_categoryName        IN VARCHAR2,
    c_categoryDescription IN VARCHAR2 DEFAULT NULL)
AS
BEGIN
  INSERT
  INTO category
    (
      categoryName,
      categoryDescription
    )
    VALUES
    (
      c_categoryName,
      c_categoryDescription
    );
END addcategory;

PROCEDURE find_category_by_id
  (
    c_id IN category.categoryid%type,
    c_name OUT category.categoryname%type,
    c_desc OUT category.categorydescription%type
  )
IS
BEGIN
  SELECT categoryname,
    categorydescription
  INTO c_name,
    c_desc
  FROM category
  WHERE categoryid=c_id;
END;
PROCEDURE get_all_category(
    catID OUT category.categoryID%type,
    catName OUT category.categoryname%type,
        catDesc OUT category.categorydescription%type)
IS
  CURSOR KURSOR
  IS
    SELECT * FROM category;
BEGIN
  OPEN kursor;
  LOOP
    FETCH kursor INTO catID,catName,catDesc;
    EXIT
  WHEN kursor%notfound;
    dbms_output.put_line('Id_ kategorii: '||catID||' nazwa: '|| catName||' opis: '|| catDesc);
  END LOOP;
  CLOSE kursor;
END;
END P_CATEGORY;

/
--------------------------------------------------------
--  DDL for Package Body P_ORDERS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "JAKUB"."P_ORDERS" 
AS
PROCEDURE add_orders(
    o_userid IN orders.userid%type,
    o_price  IN orders.totalprice%type,
    o_orderid OUT orders.orderid%type )
AS
BEGIN
  INSERT
  INTO orders
    (
      orderdate,
      userid,
      totalprice
    )
    VALUES
    (
      get_date(),
      o_userid,
      o_price
    )
  RETURNING orderid
  INTO o_orderid;
END add_orders;
PROCEDURE add_orderdetail
  (
    o_orderid   IN orderdetails.orderid%type,
    o_productid IN orderdetails.productid%type,
    o_quantity  IN orderdetails.quantity%type,
    o_price     IN orderdetails.price%type
  )
IS
BEGIN
  INSERT
  INTO orderdetails
    (
      orderid,
      productid,
      quantity,
      price
    )
    VALUES
    (
      o_orderid,
      o_productid,
      o_quantity,
      o_price
    );
END ;
END P_ORDERS;

/
--------------------------------------------------------
--  DDL for Package Body P_PRODUCT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "JAKUB"."P_PRODUCT" 
AS
PROCEDURE add_product(
    p_name  IN product.productname%type,
    p_desc  IN product.productdescription%type,
    p_price IN product.productprice%type,
    picture IN product.picture%type,
    cat     IN product.categoryid%type)
AS
BEGIN
  INSERT
  INTO product
    (
      productname,
      productDescription,
      productprice,
      picture,
      categoryid
    )
    VALUES
    (
      p_name,
      p_desc,
      p_price,
      picture,
      cat
    );
END add_product;
PROCEDURE delete_product
  (
    p_id IN product.productid%type
  )
AS
BEGIN
  DELETE FROM cart WHERE productID=p_id;
  DELETE FROM product WHERE productID=p_id;
END;
PROCEDURE find_product_by_id(
    p_id IN product.productid%type,
    p_name OUT product.productname%type,
    p_desc OUT product.productdescription%type,
    p_price OUT product.productprice%type,
    p_picture OUT product.picture%type,
    p_cat OUT product.categoryid%type)
IS
BEGIN
  SELECT productname,
    productdescription,
    productprice,
    picture,
    categoryid
  INTO p_name,
    p_desc,
    p_price,
    p_picture,
    p_cat
  FROM product
  WHERE productid=p_id;
END;
PROCEDURE update_product(
    p_id      IN product.productid%type,
    p_name    IN product.productname%type,
    p_desc    IN product.productdescription%type,
    p_price   IN product.productprice%type,
    p_picture IN product.picture%type,
    p_cat     IN product.categoryid%type)
AS
BEGIN
  UPDATE product
  SET productname     =p_name,
    productdescription=p_desc,
    productprice      =p_price,
    picture           =p_picture,
    categoryid        =p_cat
  WHERE productID     =p_id;
END;
END P_PRODUCT;

/
--------------------------------------------------------
--  DDL for Package Body P_USERS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "JAKUB"."P_USERS" 
AS
PROCEDURE add_client(
    c_firstname    IN client.firstname%TYPE,
    c_lastname     IN client.lastname%TYPE,
    c_emailaddress IN client.emailaddress%TYPE,
    c_street       IN client.street%TYPE,
    c_numberhouse  IN client.numberhouse%TYPE,
    c_postcode     IN client.postcode%TYPE,
    c_city         IN client.city%TYPE,
    c_clientID OUT client.clientID%TYPE,
    u_username IN users.username%TYPE,
    u_password IN users.password%TYPE)
AS
BEGIN
  INSERT
  INTO client
    (
      firstname,
      lastname,
      emailaddress,
      street,
      numberhouse,
      postcode,
      city
    )
    VALUES
    (
      c_firstname,
      c_lastname,
      c_emailaddress,
      c_street,
      c_numberhouse,
      c_postcode,
      c_city
    )
  RETURNING CLIENTID
  INTO c_clientID;
  INSERT
  INTO users
    (
      username,
      password,
      CLIENTID,
      USERROLE
    )
    VALUES
    (
      u_username,
      u_password,
      c_clientID,
      'client'
    );
END add_client;
PROCEDURE GET_USER
  (
    U_USERNAME IN OUT VARCHAR2,
    U_ID OUT NUMBER ,
    U_PASSWORD OUT VARCHAR2 ,
    U_CLIENTID OUT NUMBER ,
    U_ROLE OUT VARCHAR2
  )
AS
BEGIN
  SELECT userID,
    username,
    password,
    clientID,
    userRole
  INTO u_id,
    u_username,
    u_password,
    u_clientID,
    u_role
  FROM users
  WHERE username=u_username;
EXCEPTION
WHEN no_data_found THEN
  dbms_output.put_line('No such customer!');
END GET_USER;
PROCEDURE get_user_id(
    u_id OUT users.userid%type,
    u_username IN users.username%type)
IS
BEGIN
  SELECT userID INTO u_id FROM users WHERE username=u_username;
EXCEPTION
WHEN no_data_found THEN
  u_id:=-1;
END;
PROCEDURE find_users_by_id(
    u_id IN users.userID%type,
    u_username OUT users.username%type)
IS
BEGIN
  SELECT username INTO u_username FROM users WHERE userID=u_id;
END;
END P_USERS;

/
--------------------------------------------------------
--  DDL for Procedure ADDCATEGORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."ADDCATEGORY" (
    c_categoryName        IN VARCHAR2,
    c_categoryDescription IN VARCHAR2 DEFAULT NULL)
IS
BEGIN
  INSERT
  INTO category
    (
      categoryName,
      categoryDescription
    )
    VALUES
    (
      c_categoryName,
      c_categoryDescription
    );
END addcategory;

/
--------------------------------------------------------
--  DDL for Procedure ADD_CLIENT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."ADD_CLIENT" (
    c_firstname    IN client.firstname%TYPE,
    c_lastname     IN client.lastname%TYPE,
    c_emailaddress IN client.emailaddress%TYPE,
    c_street       IN client.street%TYPE,
    c_numberhouse  IN client.numberhouse%TYPE,
    c_postcode     IN client.postcode%TYPE,
    c_city         IN client.city%TYPE,
    c_clientID OUT client.clientID%TYPE,
    u_username IN users.username%TYPE,
    u_password IN users.password%TYPE)
IS
BEGIN
  INSERT
  INTO client
    (
      firstname,
      lastname,
      emailaddress,
      street,
      numberhouse,
      postcode,
      city
    )
    VALUES
    (
      c_firstname,
      c_lastname,
      c_emailaddress,
      c_street,
      c_numberhouse,
      c_postcode,
      c_city
    )
  RETURNING CLIENTID
  INTO c_clientID;
  INSERT
  INTO users
    (
      username,
      password,
      CLIENTID,
      USERROLE
    )
    VALUES
    (
      u_username,
      u_password,
      c_clientID,
      'client'
    );
END;

/
--------------------------------------------------------
--  DDL for Procedure ADD_ORDERDETAIL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."ADD_ORDERDETAIL" (
    o_orderid   IN orderdetails.orderid%type,
    o_productid IN orderdetails.productid%type,
    o_quantity IN orderdetails.quantity%type,
    o_price IN orderdetails.price%type)
IS
BEGIN
  INSERT
  INTO orderdetails
    (
      orderid,
      productid,
      quantity,
      price
    )
    VALUES
    (
      o_orderid,
      o_productid,
      o_quantity,
      o_price
    );
END ;

/
--------------------------------------------------------
--  DDL for Procedure ADD_ORDERS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."ADD_ORDERS" (
    o_userid IN orders.userid%type,
    o_price  IN orders.totalprice%type,
    o_orderid OUT orders.orderid%type )
IS
BEGIN
  INSERT
  INTO orders
    (
      orderdate,
      userid,
      totalprice
    )
    VALUES
    (
      get_date(),
      o_userid,
      o_price
    )
  RETURNING orderid
  INTO o_orderid;
END ;

/
--------------------------------------------------------
--  DDL for Procedure ADD_PRODUCT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."ADD_PRODUCT" (
    p_name  IN product.productname%type,
    p_desc  IN product.productdescription%type,
    p_price IN product.productprice%type,
    picture IN product.picture%type,
    cat     IN product.categoryid%type)
IS
BEGIN
  INSERT
  INTO product
    (
      productname,
      productDescription,
      productprice,
      picture,
      categoryid
    )
    VALUES
    (
      p_name,
      p_desc,
      p_price,
      picture,
      cat
    );
END ;

/
--------------------------------------------------------
--  DDL for Procedure ADD_PRODUCT_TO_CART
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."ADD_PRODUCT_TO_CART" (
    userID     IN cart.userID%type,
    productID  IN cart.productID%type,
    quantity   IN cart.quantity%type,
    totalprice IN cart.quantity%type)
IS
BEGIN
  INSERT
  INTO cart
    (
      userID,
      productID,
      quantity,
      totalprice
    )
    VALUES
    (
      userID,
      productID,
      quantity,
      totalprice
    );
END ;

/
--------------------------------------------------------
--  DDL for Procedure CLEAR_CART
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."CLEAR_CART" (
    c_id IN cart.userid%type)
AS
BEGIN
  DELETE FROM cart WHERE userID=c_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure DELETE_CATEGORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."DELETE_CATEGORY" (
    c_id IN category.categoryid%type)
AS
BEGIN
  DELETE FROM category WHERE categoryID=c_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure DELETE_PRODUCT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."DELETE_PRODUCT" (
    p_id IN product.productid%type)
AS
BEGIN
  DELETE FROM cart WHERE productID=p_id;
  DELETE FROM product WHERE productID=p_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure DELETE_PRODUCT_FROM_CART
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."DELETE_PRODUCT_FROM_CART" (
    c_id IN cart.cartid%type)
AS
BEGIN
  DELETE FROM cart WHERE cartid=c_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure FIND_CATEGORY_BY_ID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."FIND_CATEGORY_BY_ID" (
    c_id IN category.categoryid%type,
    c_name OUT category.categoryname%type,
    c_desc OUT category.categorydescription%type)
IS
BEGIN
  SELECT categoryname,
    categorydescription
  INTO c_name,
    c_desc
  FROM category
  WHERE categoryid=c_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure FIND_PRODUCT_BY_ID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."FIND_PRODUCT_BY_ID" (
    p_id IN product.productid%type,
    p_name OUT product.productname%type,
    p_desc OUT product.productdescription%type,
    p_price OUT product.productprice%type,
    p_picture OUT product.picture%type,
    p_cat OUT product.categoryid%type)
IS
BEGIN
  SELECT productname,
    productdescription,
    productprice,
    picture,
    categoryid
  INTO p_name,
    p_desc,
    p_price,
    p_picture,
    p_cat
  FROM product
  WHERE productid=p_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure FIND_USERS_BY_ID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."FIND_USERS_BY_ID" (
    u_id IN users.userID%type,
    u_username OUT users.username%type)
IS
BEGIN
  SELECT username
  INTO u_username
  FROM users
  WHERE userID=u_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure GET_ALL_CATEGORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."GET_ALL_CATEGORY" (
    catID OUT category.categoryID%type,
    catName OUT category.categoryname%type,
        catDesc OUT category.categorydescription%type)
IS
  CURSOR KURSOR
  IS
    SELECT * FROM category;
BEGIN
  OPEN kursor;
  LOOP
    FETCH kursor INTO catID,catName,catDesc;
    EXIT
  WHEN kursor%notfound;
    dbms_output.put_line('Id_ kategorii: '||catID||' nazwa: '|| catName||' opis: '|| catDesc);
  END LOOP;
  CLOSE kursor;
END;

/
--------------------------------------------------------
--  DDL for Procedure GET_AMOUNT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."GET_AMOUNT" (
      c_userID in cart.userID%type,
      c_totalPrice OUT cart.totalPrice%type)
AS
  BEGIN
Select sum(totalPrice*quantity) INTO c_totalPrice From cart where userid=c_userID;
  END get_amount;

/
--------------------------------------------------------
--  DDL for Procedure GET_USER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."GET_USER" 
  (
      U_USERNAME IN OUT VARCHAR2,
      U_ID OUT NUMBER
    , U_PASSWORD OUT VARCHAR2
    , U_CLIENTID OUT NUMBER
    , U_ROLE OUT varchar2
  ) AS
  BEGIN
    SELECT userID,username,password,clientID,userRole into u_id, u_username, u_password, u_clientID, u_role from users where username=u_username;

    EXCEPTION
    WHEN no_data_found THEN
    dbms_output.put_line('No such customer!');

  END GET_USER;

/
--------------------------------------------------------
--  DDL for Procedure GET_USER_ID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."GET_USER_ID" (
    u_id OUT users.userid%type,
    u_username IN users.username%type)
IS
BEGIN
  SELECT userID INTO u_id FROM users WHERE username=u_username;
EXCEPTION
WHEN no_data_found THEN
  u_id:=-1;
END;

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_CATEGORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."UPDATE_CATEGORY" (
    c_id   IN category.categoryid%type,
    c_name IN category.categoryName%type,
    c_desc IN category.categorydescription%type)
AS
BEGIN
  UPDATE category
  SET categoryname     =c_name,
    categorydescription=c_desc
  WHERE categoryID     =c_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_PRODUCT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."UPDATE_PRODUCT" (
    p_id      IN product.productid%type,
    p_name    IN product.productname%type,
    p_desc    IN product.productdescription%type,
    p_price   IN product.productprice%type,
    p_picture IN product.picture%type,
    p_cat     IN product.categoryid%type)
AS
BEGIN
  UPDATE product
  SET productname     =p_name,
    productdescription=p_desc,
    productprice      =p_price,
    picture           =p_picture,
    categoryid        =p_cat
  WHERE productID     =p_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_QUANTITY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "JAKUB"."UPDATE_QUANTITY" (
    c_quantity IN cart.quantity%type,
    c_id       IN cart.cartid%type )
AS
BEGIN
  UPDATE cart SET quantity =c_quantity WHERE cartID =c_id;
END;

/
