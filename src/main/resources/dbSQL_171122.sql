create sequence IMG_SEQ
/

create table CONCERT
(
	MT20ID VARCHAR2(15) not null
		primary key,
	PRFNM VARCHAR2(150) default NULL not null,
	PRFPDFROM VARCHAR2(10) not null,
	PRFPDTO VARCHAR2(10) not null,
	FCLTYNM VARCHAR2(100) not null,
	PRFCAST VARCHAR2(100) not null,
	PRFCREW VARCHAR2(100) not null,
	PRFRUNTIME VARCHAR2(20) not null,
	PRFAGE VARCHAR2(20) not null,
	ENTRPSNM VARCHAR2(150) default NULL not null,
	PCSEGUIDANCE VARCHAR2(200) default NULL not null,
	GENRENM VARCHAR2(50) not null,
	MT10ID VARCHAR2(10) not null,
	DTGUIDANCE VARCHAR2(200) default NULL not null
)
/

create table PLACE
(
	FCLTYNM VARCHAR2(150) default NULL not null,
	MT10ID VARCHAR2(10) not null
		primary key,
	MT13CNT VARCHAR2(10) NOT NULL ,
	FCLTYCHARTR VARCHAR2(20) NOT NULL ,
	OPENDE VARCHAR2(4) NOT NULL ,
	SEATSCALE VARCHAR2(10),
	TELNO VARCHAR2(20),
	RELATEURL VARCHAR2(200) default NULL,
	ADRES VARCHAR2(200) default NULL not null,
	SIDONM VARCHAR2(20) not null,
	LA VARCHAR2(100) not null,
	LO VARCHAR2(100) default NULL not null
)
/


alter table CONCERT
	add constraint FK_CONCERT_MT10ID
		foreign key (MT10ID) references PLACE
			on delete cascade
/

create table MEMBER
(
	ID VARCHAR2(20) not null
		primary key,
	PASSWORD VARCHAR2(65) not null,
	EMAIL VARCHAR2(100) not null,
	CERTKEY VARCHAR2(36) not null,
	CERTIFY NUMBER(1) default 0 not null,
	GRADE NUMBER(1) DEFAULT 1 NOT NULL
)
/


create table BOXOFFICE
(
	AREA VARCHAR2(20) not null,
	PRFDTCNT VARCHAR2(10) not null,
	NMRS VARCHAR2(20) not null,
	PRFPD VARCHAR2(100) not null,
	CATE VARCHAR2(50) not null,
	PRFPLCNM VARCHAR2(50) not null,
	PRFNM VARCHAR2(100) not null,
	RNUM VARCHAR2(10) not null,
	MT20ID VARCHAR2(15) not null
		constraint FK_BOXOFFICE_MT20ID
			references CONCERT
				on delete cascade,
	constraint PK_BOXOFFICE
		primary key (CATE, RNUM)
)
/

create table IMAGE
(
	IMAGENUM NUMBER not null
		primary key,
	MT20ID VARCHAR2(15) not null
		constraint IMAGE_CONCERT_MT20ID_FK
			references CONCERT
				on delete cascade,
	IMAGEURL VARCHAR2(250) not null,
	IMAGETYPE NUMBER(1) not null,
	UPLOADDATE VARCHAR2(6) default TO_CHAR(TO_DATE(SYSDATE), 'YYMMDD')
)
/

