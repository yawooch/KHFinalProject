﻿
-- 사용자 계정 생성하는 구문
-- [표현법] CREATE USER 계정명 IDENTIFIED BY 비밀번호;
-- CREATE USER C##PAWPAW IDENTIFIED BY PAWPAW;

-- SELECT * FROM DBA_USERS
 -- WHERE USERNAME = 'C##PAWPAW';

-- 생성한 사용자 계정에게 최소한의 권한(데이터관리, 접속) 부여
-- GRANT RESOURCE, CONNECT TO C##PAWPAW;

-- 테이블이 저장되는 공간인 테이블스페이스 할당
--ALTER USER C##PAWPAW DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;
-- COMMIT;


-- 112.156.11.186
-- 8087


CREATE TABLE "MEMBER" (
    "MEMBER_NO"         NUMBER          NOT NULL,
    "MEMBER_ID"         VARCHAR2(30)        NULL,
    "MEMBER_PW"         VARCHAR2(100)       NULL,
    "MEMBER_ROLE"       VARCHAR2(15)        NULL,
    "MEMBER_PHONE"      VARCHAR2(20)        NULL,
    "MEMBER_EMAIL"      VARCHAR2(50)        NULL,
    "MEMBER_BIRTH"      NUMBER              NULL,
    "MEMBER_PET_NAME"   VARCHAR2(30)        NULL,
    "MEMBER_PET_TYPE"   VARCHAR2(30)        NULL,
    "MEMBER_STATUS"     VARCHAR2(2)         NULL,
    "MEMBER_ED"         DATE                NULL,
    "MEMBER_MD"         DATE                NULL,
    "MRKT_AGREE_YN"     VARCHAR2(2)         NULL,
    "RECV_AGREE_YN"     VARCHAR2(2)         NULL,
    "LOCA_AGREE_YN"     VARCHAR2(2)         NULL
);
COMMENT ON TABLE  "MEMBER" IS '회원';
COMMENT ON COLUMN "MEMBER"."MEMBER_NO"       IS '회원번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_ID"       IS '회원아이디';
COMMENT ON COLUMN "MEMBER"."MEMBER_PW"       IS '비밀번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_ROLE"     IS '회원타입';
COMMENT ON COLUMN "MEMBER"."MEMBER_PHONE"    IS '핸드폰번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL"    IS '이메일';
COMMENT ON COLUMN "MEMBER"."MEMBER_BIRTH"    IS '생년월일';
COMMENT ON COLUMN "MEMBER"."MEMBER_PET_NAME" IS '반려동물이름';
COMMENT ON COLUMN "MEMBER"."MEMBER_PET_TYPE" IS '반려동물종류';
COMMENT ON COLUMN "MEMBER"."MEMBER_STATUS"   IS '회원상태';
COMMENT ON COLUMN "MEMBER"."MEMBER_ED"       IS '회원가입일';
COMMENT ON COLUMN "MEMBER"."MEMBER_MD"       IS '정보수정일';
COMMENT ON COLUMN "MEMBER"."MRKT_AGREE_YN"   IS '마케팅동의여부';
COMMENT ON COLUMN "MEMBER"."RECV_AGREE_YN"   IS '수신동의여부';
COMMENT ON COLUMN "MEMBER"."LOCA_AGREE_YN"   IS '위치동의여부';
CREATE TABLE "COMMUNITY" (
    "COMMUNITY_NO"          NUMBER          NOT NULL,
    "COMMUNITY_CATEGORY"    VARCHAR2(10)        NULL,
    "COMMUNITY_TITLE"       VARCHAR2(100)       NULL,
    "COMMUNITY_CONTENT"     VARCHAR2(500)       NULL,
    "COMMUNITY_ED"          DATE                NULL,
    "COMMUNITY_STATUS"      VARCHAR2(2)         NULL,
    "COMMUNITY_COUNT"       NUMBER              NULL,
    "COMMUNITY_O_FILENAME"  VARCHAR2(100)       NULL,
    "COMMUNITY_R_FILENAME"  VARCHAR2(100)       NULL
);
COMMENT ON TABLE  "COMMUNITY"  IS '커뮤니티';
COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_NO"         IS '커뮤니티번호';
COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_CATEGORY"   IS '커뮤니티분류';
COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_TITLE"      IS '커뮤니티제목';
COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_CONTENT"    IS '커뮤니티내용';
COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_ED"         IS '커뮤니티등록일';
COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_STATUS"     IS '커뮤니티상태';
COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_COUNT"      IS '조회수';
COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_O_FILENAME" IS '첨부파일원래이름';
COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_R_FILENAME" IS '첨부파일변경이름';

CREATE TABLE "STAY" (
    "STAY_CONTENTID"       NUMBER       NOT NULL,
    "STAY_ADDRESS"         VARCHAR2(100)    NULL,
    "STAY_DETAIL_ADDRESS"  VARCHAR2(30)     NULL,
    "STAY_TITLE"           VARCHAR2(100)    NULL,
    "AREACODE"             NUMBER           NULL,
    "STAY_CATEGORY1"       VARCHAR2(30)     NULL,
    "STAY_CATEGORY2"       VARCHAR2(30)     NULL,
    "STAY_CATEGORY3"       VARCHAR2(30)     NULL,
    "STAY_CONTENTTYPEID"   NUMBER           NULL,
    "STAY_CREATETIME"      DATE             NULL,
    "STAY_MODIFYTIME"      DATE             NULL,
    "STAY_IMAGE"           VARCHAR2(1000)   NULL,
    "MAPX"                 NUMBER           NULL,
    "MAPY"                 NUMBER           NULL,
    "MAPLEVEL"             NUMBER           NULL,
    "STAY_TEL"             VARCHAR2(30)     NULL,
    "SIGUNGUCODE"          NUMBER           NULL
);
COMMENT ON TABLE  "STAY" IS '숙박';
COMMENT ON COLUMN "STAY"."STAY_CONTENTID"      IS '콘텐츠아이디';
COMMENT ON COLUMN "STAY"."STAY_ADDRESS"        IS '숙박주소';
COMMENT ON COLUMN "STAY"."STAY_DETAIL_ADDRESS" IS '숙박상세주소';
COMMENT ON COLUMN "STAY"."STAY_TITLE"          IS '숙소명';
COMMENT ON COLUMN "STAY"."AREACODE"            IS '지역코드';
COMMENT ON COLUMN "STAY"."STAY_CATEGORY1"      IS '숙박대분류';
COMMENT ON COLUMN "STAY"."STAY_CATEGORY2"      IS '숙박중분류';
COMMENT ON COLUMN "STAY"."STAY_CATEGORY3"      IS '숙박소분류';
COMMENT ON COLUMN "STAY"."STAY_CONTENTTYPEID"  IS '콘텐츠타입아이디';
COMMENT ON COLUMN "STAY"."STAY_CREATETIME"     IS '등록일';
COMMENT ON COLUMN "STAY"."STAY_MODIFYTIME"     IS '수정일';
COMMENT ON COLUMN "STAY"."STAY_IMAGE"          IS '대표이미지';
COMMENT ON COLUMN "STAY"."MAPX"                IS 'X좌표';
COMMENT ON COLUMN "STAY"."MAPY"                IS 'Y좌표';
COMMENT ON COLUMN "STAY"."MAPLEVEL"            IS '축척';
COMMENT ON COLUMN "STAY"."STAY_TEL"            IS '숙박전화번호';
COMMENT ON COLUMN "STAY"."SIGUNGUCODE"         IS '시군구코드';
CREATE TABLE "TRIP" (
    "TRIP_CONTENTID"      NUMBER      NOT NULL,
    "TRIP_ADDRESS"        VARCHAR2(100)   NULL,
    "TRIP_TITLE"          VARCHAR2(100)   NULL,
    "AREACODE"            NUMBER          NULL,
    "TRIP_CATEGORY1"      VARCHAR2(30)    NULL,
    "TRIP_CATEGORY2"      VARCHAR2(30)    NULL,
    "TRIP_CATEGORY3"      VARCHAR2(30)    NULL,
    "TRIP_CONTENTTYPEID"  NUMBER          NULL,
    "TRIP_CREATETIME"     DATE            NULL,
    "TRIP_MODIFYTIME"     DATE            NULL,
    "TRIP_IMAGE"          VARCHAR2(1000)  NULL,
    "MAPX"                NUMBER          NULL,
    "MAPY"                NUMBER          NULL,
    "MAPLEVEL"            NUMBER          NULL,
    "TRIP_TEL"            VARCHAR2(30)    NULL,
    "SIGUNGUCODE"         NUMBER          NULL
);
COMMENT ON TABLE  "TRIP" IS '여행';
COMMENT ON COLUMN "TRIP"."TRIP_CONTENTID"     IS '콘텐츠아이디';
COMMENT ON COLUMN "TRIP"."TRIP_ADDRESS"       IS '여행지주소';
COMMENT ON COLUMN "TRIP"."TRIP_TITLE"         IS '여행지명';
COMMENT ON COLUMN "TRIP"."AREACODE"           IS '지역코드';
COMMENT ON COLUMN "TRIP"."TRIP_CATEGORY1"     IS '여행대분류';
COMMENT ON COLUMN "TRIP"."TRIP_CATEGORY2"     IS '여행중분류';
COMMENT ON COLUMN "TRIP"."TRIP_CATEGORY3"     IS '여행소분류';
COMMENT ON COLUMN "TRIP"."TRIP_CONTENTTYPEID" IS '콘텐츠타입아이디';
COMMENT ON COLUMN "TRIP"."TRIP_CREATETIME"    IS '등록일';
COMMENT ON COLUMN "TRIP"."TRIP_MODIFYTIME"    IS '수정일';
COMMENT ON COLUMN "TRIP"."TRIP_IMAGE"         IS '이미지';
COMMENT ON COLUMN "TRIP"."MAPX"               IS 'X좌표';
COMMENT ON COLUMN "TRIP"."MAPY"               IS 'Y좌표';
COMMENT ON COLUMN "TRIP"."MAPLEVEL"           IS '축척';
COMMENT ON COLUMN "TRIP"."TRIP_TEL"           IS '여행전화번호';
COMMENT ON COLUMN "TRIP"."SIGUNGUCODE"        IS '시군구코드';


CREATE TABLE "PETINFO" (
    "PETINFO_CONTENTID" NUMBER          NOT NULL,
    "TOUR_INFO"         VARCHAR2(1000)      NULL,
    "ACMPY_TYPE_CD"     VARCHAR2(10)        NULL,
    "RELA_POSES_FCLTY"  VARCHAR2(500)       NULL,
    "RELA_FRNSH_PRDLST" VARCHAR2(100)       NULL,
    "RELA_PURC_PRDLST"  VARCHAR2(100)       NULL,
    "RELA_RNTL_PRDLST"  VARCHAR2(100)       NULL,
    "ACMPY_PSBL_CPAM"   VARCHAR2(100)       NULL,
    "ETC_ACMPY_INFO"    VARCHAR2(1000)      NULL,
    "ACMPY_NEED_MTR"    VARCHAR2(1000)      NULL
);
COMMENT ON COLUMN "PETINFO" IS '반려동물동반정보';
COMMENT ON COLUMN "PETINFO"."PETINFO_CONTENTID" IS '콘텐츠아이디';
COMMENT ON COLUMN "PETINFO"."TOUR_INFO"         IS '반려견관광정보';
COMMENT ON COLUMN "PETINFO"."ACMPY_TYPE_CD"     IS '동반구분';
COMMENT ON COLUMN "PETINFO"."RELA_POSES_FCLTY"  IS '관련구비시설';
COMMENT ON COLUMN "PETINFO"."RELA_FRNSH_PRDLST" IS '관련비치품목';
COMMENT ON COLUMN "PETINFO"."RELA_PURC_PRDLST"  IS '관련구매품목';
COMMENT ON COLUMN "PETINFO"."RELA_RNTL_PRDLST"  IS '관련렌탈품목';
COMMENT ON COLUMN "PETINFO"."ACMPY_PSBL_CPAM"   IS '동반가능동물';
COMMENT ON COLUMN "PETINFO"."ETC_ACMPY_INFO"    IS '기타동반정보';
COMMENT ON COLUMN "PETINFO"."ACMPY_NEED_MTR"    IS '동반시필요사항';

CREATE TABLE "AREA" (
    "AREA_CODE"     NUMBER        NOT NULL,
    "SIGUNGU_CODE"  NUMBER        NOT NULL,
    "AREA_NAME"     VARCHAR2(50)      NULL
);
COMMENT ON TABLE  "AREA" IS '지역';
COMMENT ON COLUMN "AREA"."AREA_CODE"    IS '지역코드';
COMMENT ON COLUMN "AREA"."SIGUNGU_CODE" IS '시군구코드';
COMMENT ON COLUMN "AREA"."AREA_NAME"    IS '지역시군구명';

CREATE TABLE "BIGCATEGORY" (
    "BIG_CATE_CODE" VARCHAR2(30)        NOT NULL,
    "BIG_CATE_NAME" VARCHAR2(30)        NULL
);
COMMENT ON TABLE  "BIGCATEGORY" IS '빅카테고리';
COMMENT ON COLUMN "BIGCATEGORY"."BIG_CATE_CODE" IS '카테고리코드';
COMMENT ON COLUMN "BIGCATEGORY"."BIG_CATE_NAME" IS '카테고리이름';

CREATE TABLE "MIDCATEGORY" (
    "MID_CATE_CODE" VARCHAR2(30)        NOT NULL,
    "MID_CATE_NAME" VARCHAR2(30)        NULL
);
COMMENT ON TABLE  "MIDCATEGORY" IS '미들카테고리';
COMMENT ON COLUMN "MIDCATEGORY"."MID_CATE_CODE" IS '카테고리코드';
COMMENT ON COLUMN "MIDCATEGORY"."MID_CATE_NAME" IS '카테고리이름';

CREATE TABLE "SMLCATEGORY" (
    "SML_CATE_CODE" VARCHAR2(30)        NOT NULL,
    "SML_CATE_NAME" VARCHAR2(30)        NULL
);
COMMENT ON TABLE  "SMLCATEGORY" IS '스몰카테고리';
COMMENT ON COLUMN "SMLCATEGORY"."SML_CATE_CODE" IS '카테고리코드';
COMMENT ON COLUMN "SMLCATEGORY"."SML_CATE_NAME" IS '카테고리이름';


CREATE TABLE "MEMBER_ACCS_LOG" (
    "MEMBER_NO"     NUMBER               NOT NULL,
    "Field"         VARCHAR2(20)         NOT NULL,
    "ACCESS_DATE"   DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON TABLE  "MEMBER_ACCS_LOG"               IS '회원접속내역';
COMMENT ON COLUMN "MEMBER_ACCS_LOG"."MEMBER_NO"   IS '회원번호';
COMMENT ON COLUMN "MEMBER_ACCS_LOG"."Field"       IS '접속주소';
COMMENT ON COLUMN "MEMBER_ACCS_LOG"."ACCESS_DATE" IS '접속일시';

ALTER TABLE "MEMBER"      ADD CONSTRAINT "PK_MEMBER"      PRIMARY KEY ( "MEMBER_NO"         );
ALTER TABLE "COMMUNITY"   ADD CONSTRAINT "PK_COMMUNITY"   PRIMARY KEY ( "COMMUNITY_NO"      );
ALTER TABLE "STAY"        ADD CONSTRAINT "PK_STAY"        PRIMARY KEY ( "STAY_CONTENTID"    );
ALTER TABLE "TRIP"        ADD CONSTRAINT "PK_TRIP"        PRIMARY KEY ( "TRIP_CONTENTID"    );
ALTER TABLE "PETINFO"     ADD CONSTRAINT "PK_PETINFO"     PRIMARY KEY ( "PETINFO_CONTENTID" );
ALTER TABLE "AREA"        ADD CONSTRAINT "PK_AREA"        PRIMARY KEY ( "AREA_CODE", "SIGUNGU_CODE" );
ALTER TABLE "BIGCATEGORY" ADD CONSTRAINT "PK_BIGCATEGORY" PRIMARY KEY ( "BIG_CATE_CODE"     );
ALTER TABLE "MIDCATEGORY" ADD CONSTRAINT "PK_MIDCATEGORY" PRIMARY KEY ( "MID_CATE_CODE"     );
ALTER TABLE "SMLCATEGORY" ADD CONSTRAINT "PK_SMLCATEGORY" PRIMARY KEY ( "SML_CATE_CODE"     );