CREATE SEQUENCE IMG_SEQ
/

CREATE SEQUENCE CONCERT_MT20ID_SEQ
/

CREATE TABLE CONCERT
(
  MT20ID       VARCHAR2(15)               NOT NULL
    PRIMARY KEY,
  PRFNM        VARCHAR2(150) DEFAULT NULL NOT NULL,
  PRFPDFROM    VARCHAR2(10)               NOT NULL,
  PRFPDTO      VARCHAR2(10)               NOT NULL,
  FCLTYNM      VARCHAR2(100)              NOT NULL,
  PRFCAST      VARCHAR2(100)              NOT NULL,
  PRFCREW      VARCHAR2(100)              NOT NULL,
  PRFRUNTIME   VARCHAR2(20)               NOT NULL,
  PRFAGE       VARCHAR2(20)               NOT NULL,
  ENTRPSNM     VARCHAR2(150) DEFAULT NULL NOT NULL,
  PCSEGUIDANCE VARCHAR2(200) DEFAULT NULL NOT NULL,
  GENRENM      VARCHAR2(50)               NOT NULL,
  MT10ID       VARCHAR2(10)               NOT NULL,
  DTGUIDANCE   VARCHAR2(200) DEFAULT NULL NOT NULL
)
/

CREATE TABLE PLACE
(
  FCLTYNM     VARCHAR2(150) DEFAULT NULL NOT NULL,
  MT10ID      VARCHAR2(10)               NOT NULL
    PRIMARY KEY,
  MT13CNT     VARCHAR2(10)               NOT NULL,
  FCLTYCHARTR VARCHAR2(25)               NOT NULL,
  OPENDE      VARCHAR2(4)                NOT NULL,
  SEATSCALE   VARCHAR2(10),
  TELNO       VARCHAR2(20),
  RELATEURL   VARCHAR2(200) DEFAULT NULL,
  ADRES       VARCHAR2(200) DEFAULT NULL NOT NULL,
  SIDONM      VARCHAR2(20)               NOT NULL,
  LA          VARCHAR2(100)              NOT NULL,
  LO          VARCHAR2(100) DEFAULT NULL NOT NULL
)
/


ALTER TABLE CONCERT
  ADD CONSTRAINT FK_CONCERT_MT10ID
FOREIGN KEY (MT10ID) REFERENCES PLACE
ON DELETE CASCADE
/

CREATE TABLE MEMBER
(

  ID            VARCHAR2(20)        NOT NULL
    PRIMARY KEY,
  PASSWORD      VARCHAR2(65)        NOT NULL,
  EMAIL         VARCHAR2(100)       NOT NULL,
  CERTKEY       VARCHAR2(36)        NOT NULL,
  CERTIFY       NUMBER(1) DEFAULT 0 NOT NULL,
  profile       VARCHAR(100),
  GRADE         NUMBER(1) DEFAULT 1 NOT NULL,
  ADDRESS       VARCHAR2(100)       NOT NULL,
  DETAILADDRESS VARCHAR2(100)       NOT NULL,
  la VARCHAR2(100) NULL,
  lo VARCHAR2(100) NULL

)
/

alter table member modify(profile default '/resources/images/profile/img2.png');
/

ALTER TABLE member ADD (la VARCHAR2(100) NULL, lo VARCHAR2(100) NULL);

CREATE TABLE BOXOFFICE
(
  AREA     VARCHAR2(20)  NOT NULL,
  PRFDTCNT VARCHAR2(10)  NOT NULL,
  NMRS     VARCHAR2(20)  NOT NULL,
  PRFPD    VARCHAR2(100) NOT NULL,
  CATE     VARCHAR2(50)  NOT NULL,
  PRFPLCNM VARCHAR2(50)  NOT NULL,
  PRFNM    VARCHAR2(100) NOT NULL,
  RNUM     NUMBER        NOT NULL,
  CATECODE VARCHAR2(5)   NOT NULL,
  MT20ID   VARCHAR2(15)  NOT NULL
    CONSTRAINT FK_BOXOFFICE_MT20ID
    REFERENCES CONCERT
    ON DELETE CASCADE,
  CONSTRAINT PK_BOXOFFICE
  PRIMARY KEY (CATE, RNUM)
)
/

CREATE TABLE IMAGE
(
  IMAGENUM   NUMBER        NOT NULL
    PRIMARY KEY,
  MT20ID     VARCHAR2(15)  NOT NULL
    CONSTRAINT IMAGE_CONCERT_MT20ID_FK
    REFERENCES CONCERT
    ON DELETE CASCADE,
  IMAGEURL   VARCHAR2(250) NOT NULL,
  IMAGETYPE  NUMBER(1)     NOT NULL,
  UPLOADDATE VARCHAR2(6) DEFAULT TO_CHAR(TO_DATE(SYSDATE), 'YYMMDD')
)
/

CREATE TABLE COMMENTS (
  COMMENTNUM     NUMBER PRIMARY KEY,
  ID             VARCHAR2(20 BYTE) NOT NULL,
  COMMENTCONTENT VARCHAR(500 BYTE) NOT NULL,
  COMMENTDATE    TIMESTAMP,
  MT20id         VARCHAR2(15 BYTE) NOT NULL,

  CONSTRAINT comment_fk FOREIGN KEY (mt20id)
  REFERENCES concert (mt20id) ON DELETE CASCADE
);


/    


CREATE SEQUENCE COMMENT_SEQ
START WITH 1
INCREMENT BY 1;


/

ALTER TABLE COMMENTS
  ADD CONSTRAINT COMMENT_MEMBER_ID FOREIGN KEY (id)
REFERENCES member (id) ON DELETE CASCADE;


/

CREATE SEQUENCE LIKES_SEQ
/

CREATE TABLE LIKES
(
  LIKENUM NUMBER       NOT NULL
    PRIMARY KEY,
  MT20ID  VARCHAR2(15) NOT NULL
    CONSTRAINT LIKES_CONCERT_MT20ID_FK
    REFERENCES CONCERT
    ON DELETE CASCADE,
  ID      VARCHAR2(20) NOT NULL
    CONSTRAINT LIKES_MEMBER_ID_FK
    REFERENCES MEMBER
    ON DELETE CASCADE
)
/

CREATE SEQUENCE BOOKMARK_SEQ
/

CREATE TABLE BOOKMARK (
  BOOKMARKNUM NUMBER       NOT NULL PRIMARY KEY,
  MT20ID      VARCHAR2(15) NOT NULL
    CONSTRAINT BOOKMARK_CONCERT_MT20ID_FK
    REFERENCES CONCERT
    ON DELETE CASCADE,
  ID          VARCHAR2(20) NOT NULL
    CONSTRAINT BOOKMARK_MEMBER_ID_FK
    REFERENCES MEMBER
    ON DELETE CASCADE
)
/
-- 지도 관련 함수

CREATE OR REPLACE FUNCTION RADIANS(nDegrees IN NUMBER)
  RETURN NUMBER DETERMINISTIC
IS
  BEGIN
    RETURN nDegrees / 57.29577951308232087679815481410517033235;
  END RADIANS;


CREATE OR REPLACE FUNCTION DISTNACE_WGS84(H_LAT IN NUMBER, H_LNG IN NUMBER, T_LAT IN NUMBER, T_LNG IN NUMBER)
  RETURN NUMBER DETERMINISTIC
IS
  BEGIN
    RETURN (6371.0 * acos(
        cos(radians(H_LAT)) * cos(radians(T_LAT /* 위도 */))
        * cos(radians(T_LNG /* 경도 */) - radians(H_LNG))
        +
        sin(radians(H_LAT)) * sin(radians(T_LAT /* 위도 */))
    ));
  END DISTNACE_WGS84;

