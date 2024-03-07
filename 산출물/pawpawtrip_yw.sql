-- 커뮤니티 테이블
CREATE SEQUENCE SEQ_COMM_NO;

ALTER TABLE COMMUNITY MODIFY COMMUNITY_CATEGORY VARCHAR2(30);
ALTER TABLE COMMUNITY MODIFY COMMUNITY_CONTENT VARCHAR2(4000);
ALTER TABLE COMMUNITY ADD NOTICE_IMPORTANT_YN VARCHAR2(3) DEFAULT 'N';
ALTER TABLE COMMUNITY ADD COMMUNITY_WRITER_NO NUMBER;
ALTER TABLE COMMUNITY MODIFY COMMUNITY_ED DEFAULT SYSDATE;
ALTER TABLE COMMUNITY MODIFY COMMUNITY_STATUS DEFAULT 'Y';

COMMENT ON COLUMN "COMMUNITY"."NOTICE_IMPORTANT_YN" IS '공지사항중요여부';
COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_WRITER_NO" IS '커뮤니티작성자';

-- 조회
SELECT COUNT(*) FROM COMMUNITY;

SELECT * FROM COMMUNITY;

SELECT * FROM COMMUNITY
ORDER BY COMMUNITY_ED DESC;

SELECT C.COMMUNITY_NO,
       C.COMMUNITY_CATEGORY,
       C.COMMUNITY_TITLE,
       M.MEMBER_ID,
       C.COMMUNITY_COUNT,
       C.COMMUNITY_ED
FROM COMMUNITY C
JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
WHERE C.COMMUNITY_STATUS = 'Y' 
AND M.MEMBER_ID != 'admin';





SELECT RNUM, COMMUNITY_NO, COMMUNITY_CATEGORY, COMMUNITY_TITLE, MEMBER_ID, COMMUNITY_COUNT, COMMUNITY_ED
FROM (
    SELECT ROWNUM AS RNUM, COMMUNITY_NO, COMMUNITY_CATEGORY, COMMUNITY_TITLE, MEMBER_ID, COMMUNITY_COUNT, COMMUNITY_ED
    FROM(
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y' 
        AND M.MEMBER_ID != 'admin'
        ORDER BY C.COMMUNITY_ED ASC
    )
) ORDER BY RNUM DESC




-----------------------------------------------------------------------------------
-- 자유 게시판 조회(중요 공지사항 포함)
WITH BOARD AS 
(  
    SELECT ROWNUM AS RNUM, COMMUNITY_NO, COMMUNITY_CATEGORY, COMMUNITY_TITLE, MEMBER_ID, COMMUNITY_COUNT, COMMUNITY_ED, NOTICE_IMPORTANT_YN
    FROM (
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.COMMUNITY_CATEGORY IN ('[수다]', '[마이펫 자랑]')
        
        UNION
        
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.NOTICE_IMPORTANT_YN = 'Y'
        ORDER BY NOTICE_IMPORTANT_YN ASC, COMMUNITY_ED ASC
    )
    
)
SELECT RNUM,
       COMMUNITY_NO,
       COMMUNITY_CATEGORY,
       COMMUNITY_TITLE,
       MEMBER_ID,
       COMMUNITY_COUNT,
       COMMUNITY_ED,
       NOTICE_IMPORTANT_YN
FROM BOARD
ORDER BY RNUM DESC;

-----------------------------------------------------------------------------------
-- 전체 게시글 수 조회
WITH BOARD AS 
(  
    SELECT ROWNUM AS RNUM, COMMUNITY_NO, COMMUNITY_CATEGORY, COMMUNITY_TITLE, MEMBER_ID, COMMUNITY_COUNT, COMMUNITY_ED, NOTICE_IMPORTANT_YN
    FROM (
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.COMMUNITY_CATEGORY IN ('[수다]', '[마이펫 자랑]')
        
        UNION
        
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.NOTICE_IMPORTANT_YN = 'Y'
        ORDER BY NOTICE_IMPORTANT_YN ASC, COMMUNITY_ED ASC
    )
    
)
SELECT COUNT(*)
FROM BOARD;
-----------------------------------------------------------------------------------
-- 수다 게시글 수 조회
WITH BOARD AS 
(  
    SELECT ROWNUM AS RNUM, COMMUNITY_NO, COMMUNITY_CATEGORY, COMMUNITY_TITLE, MEMBER_ID, COMMUNITY_COUNT, COMMUNITY_ED, NOTICE_IMPORTANT_YN
    FROM (
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.COMMUNITY_CATEGORY IN ('[수다]', '[마이펫 자랑]')
        
        UNION
        
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.NOTICE_IMPORTANT_YN = 'Y'
        ORDER BY NOTICE_IMPORTANT_YN ASC, COMMUNITY_ED ASC
    )
    
)
SELECT COUNT(*)
FROM BOARD
WHERE COMMUNITY_CATEGORY IN ('[수다]', '[공지사항]');
-----------------------------------------------------------------------------------
-- 마이펫 게시글 수 조회
WITH BOARD AS 
(  
    SELECT ROWNUM AS RNUM, COMMUNITY_NO, COMMUNITY_CATEGORY, COMMUNITY_TITLE, MEMBER_ID, COMMUNITY_COUNT, COMMUNITY_ED, NOTICE_IMPORTANT_YN
    FROM (
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.COMMUNITY_CATEGORY IN ('[수다]', '[마이펫 자랑]')
        
        UNION
        
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.NOTICE_IMPORTANT_YN = 'Y'
        ORDER BY NOTICE_IMPORTANT_YN ASC, COMMUNITY_ED ASC
    )
    
)
SELECT COUNT(*)
FROM BOARD
WHERE COMMUNITY_CATEGORY IN ('[마이펫 자랑]', '[공지사항]');

-----------------------------------------------------------------------------------
-- 게시글 조회(검색 기능)
WITH BOARD AS 
(  
    SELECT ROWNUM AS RNUM, COMMUNITY_NO, COMMUNITY_CATEGORY, COMMUNITY_TITLE, MEMBER_ID, COMMUNITY_COUNT, COMMUNITY_ED, NOTICE_IMPORTANT_YN
    FROM (
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.COMMUNITY_CATEGORY IN ('[수다]', '[마이펫 자랑]')
        
        UNION
        
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.NOTICE_IMPORTANT_YN = 'Y'
        ORDER BY NOTICE_IMPORTANT_YN ASC, COMMUNITY_ED ASC
    )
    
)
SELECT RNUM,
       COMMUNITY_NO,
       COMMUNITY_CATEGORY,
       COMMUNITY_TITLE,
       MEMBER_ID,
       COMMUNITY_COUNT,
       COMMUNITY_ED,
       NOTICE_IMPORTANT_YN
FROM BOARD
WHERE COMMUNITY_TITLE LIKE '%92%'
AND COMMUNITY_CATEGORY LIKE '%수%'
ORDER BY RNUM DESC;
-----------------------------------------------------------------------------------
-- 수다 조회(검색 기능)
WITH BOARD AS 
(  
    SELECT ROWNUM AS RNUM, COMMUNITY_NO, COMMUNITY_CATEGORY, COMMUNITY_TITLE, MEMBER_ID, COMMUNITY_COUNT, COMMUNITY_ED, NOTICE_IMPORTANT_YN
    FROM (
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.COMMUNITY_CATEGORY IN ('[수다]', '[마이펫 자랑]')
        
        UNION
        
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.NOTICE_IMPORTANT_YN = 'Y'
        ORDER BY NOTICE_IMPORTANT_YN ASC, COMMUNITY_ED ASC
    )
    
)
SELECT RNUM,
       COMMUNITY_NO,
       COMMUNITY_CATEGORY,
       COMMUNITY_TITLE,
       MEMBER_ID,
       COMMUNITY_COUNT,
       COMMUNITY_ED,
       NOTICE_IMPORTANT_YN
FROM BOARD
--WHERE COMMUNITY_TITLE LIKE '%92%'
--AND COMMUNITY_CATEGORY LIKE '%수%'
--AND COMMUNITY_CATEGORY IN ('[수다]', '[공지사항]')
WHERE COMMUNITY_CATEGORY IN ('[수다]', '[공지사항]')
ORDER BY RNUM DESC;

-----------------------------------------------------------------------------------
-- 마이펫 조회(검색 기능)
WITH BOARD AS 
(  
    SELECT ROWNUM AS RNUM, COMMUNITY_NO, COMMUNITY_CATEGORY, COMMUNITY_TITLE, MEMBER_ID, COMMUNITY_COUNT, COMMUNITY_ED, NOTICE_IMPORTANT_YN
    FROM (
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.COMMUNITY_CATEGORY IN ('[수다]', '[마이펫 자랑]')
        
        UNION
        
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.NOTICE_IMPORTANT_YN = 'Y'
        ORDER BY NOTICE_IMPORTANT_YN ASC, COMMUNITY_ED ASC
    )
    
)
SELECT RNUM,
       COMMUNITY_NO,
       COMMUNITY_CATEGORY,
       COMMUNITY_TITLE,
       MEMBER_ID,
       COMMUNITY_COUNT,
       COMMUNITY_ED,
       NOTICE_IMPORTANT_YN
FROM BOARD
--WHERE COMMUNITY_TITLE LIKE '%92%'
--AND COMMUNITY_CATEGORY LIKE '%수%'
--AND COMMUNITY_CATEGORY IN ('[수다]', '[공지사항]')
WHERE COMMUNITY_CATEGORY IN ('[마이펫 자랑]', '[공지사항]')
ORDER BY RNUM DESC;

-----------------------------------------------------------------------------------
-- 자유 게시판(수다) 상세 조회
WITH BOARD AS 
(  
    SELECT ROWNUM AS RNUM, COMMUNITY_NO, COMMUNITY_CATEGORY, COMMUNITY_TITLE, MEMBER_ID, COMMUNITY_COUNT, COMMUNITY_ED, NOTICE_IMPORTANT_YN
    FROM (
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.COMMUNITY_CATEGORY IN ('[수다]', '[마이펫 자랑]')
        
        UNION
        
        SELECT C.COMMUNITY_NO,
               C.COMMUNITY_CATEGORY,
               C.COMMUNITY_TITLE,
               M.MEMBER_ID,
               C.COMMUNITY_COUNT,
               C.COMMUNITY_ED,
               C.NOTICE_IMPORTANT_YN
        FROM COMMUNITY C
        JOIN MEMBER M ON (C.COMMUNITY_WRITER_NO = M.MEMBER_NO)
        WHERE C.COMMUNITY_STATUS = 'Y'
        AND C.NOTICE_IMPORTANT_YN = 'Y'
        ORDER BY NOTICE_IMPORTANT_YN ASC, COMMUNITY_ED ASC
    )
    
)
SELECT COMMUNITY_CATEGORY, 
       COMMUNITY_TITLE, 
       MEMBER_ID, 
       COMMUNITY_COUNT, 
       COMMUNITY_ED
FROM BOARD
WHERE COMMUNITY_NO = 113;



-- 컬럼 삭제
DELETE FROM COMMUNITY;

-- 커뮤니티 추가(공지사항)
INSERT INTO COMMUNITY VALUES(SEQ_COMM_NO.NEXTVAL, '공지사항', '''전국댕댕자랑'' 수상작 발표~!!!!', '안녕하세요, 기다리고 기다리시던 ⭐전국댕댕자랑⭐ 수상작을 발표합니다~!!



이번 전국댕댕자랑에 공모해주신 여러분께 다시 한 번 감사드립니다.❤️❤️', '2022-12-12', 'Y', 1236, NULL, NULL, DEFAULT);


INSERT INTO COMMUNITY VALUES(SEQ_COMM_NO.NEXTVAL, '공지사항', '2023 춘천 반려동물 페스티벌', '2023 춘천 반려동물 페스티벌 



일시 : 5월13일(토) ~ 5월14일(일) 10:00~18:00
장소 : 강원도 춘천시 남산면 충효로 437, 강아지숲



주요내용 : 독스포츠대회, 반려동물 사진전, 전문가 특별강연, 플리마켓, 참여프로그램 등

대상 : 반려인, 비반려인 누구나

링크 : https://www.ccpf.co.kr/', '	2023-05-04', 'Y', 350, NULL, NULL, DEFAULT);



INSERT INTO COMMUNITY VALUES(SEQ_COMM_NO.NEXTVAL, '공지사항', '댕댕트레킹, 프라이빗 반려견 트레킹 코스', '산을 통째로 빌렸어요!

댕댕트레킹, 프라이빗 반려견 트레킹 코스 



일시 : 2023년 5월 19일(금) ~ 21일(일)

장소 : 하늘길 트레킹 코스 + 정선 하이원 리조트



주요내용 : 6k, 4k, 3k 코스 자유 선택
보듬 훈련사와 함께 대규모 트레킹 클래스

트레킹 대장(강형욱 훈련사)과 다양한 프로그램

대상 : 보호자 3,500명 with 반려견

티켓 : 일반 참가권 49,000원 및 일부 할인적용 할인권 (숙박권 별도)

링크 : https://dangdangtrekking.com/', '2023-05-09', 'Y', 247, NULL, NULL, DEFAULT);

INSERT INTO COMMUNITY VALUES(SEQ_COMM_NO.NEXTVAL, '공지사항', '2023 영월 댕댕트레인 안내!', '참여신청 : 펫츠고 - 반려동물 동반 여행사 (petsgo.kr)

[포함사항 및 불포함사항]
■포함사항
[공통] 왕복 무궁화호 열차비 1인 2석 , 현지 연계 버스비, 식사 2식(점심, 저녁), 가이드인솔비
[A코스] 젊은달와이파크 입장료
[B코스] 한반도지형 뗏목 체험 탑승료, 반려견 꽃목걸이 체험비

■불포함사항
여행자보험, 반려견 사료', '2023-10-13', 'Y', 139, NULL, NULL, DEFAULT);

-- -- 커뮤니티 추가(자유게시판>수다)
INSERT INTO COMMUNITY VALUES(SEQ_COMM_NO.NEXTVAL, '[수다]', '[수다] 강아지 간식 추천 부탁드립니다.', '우리집 강아지는 항상 배고파요', '2023-12-28', 'Y', '27', NULL, NULL, DEFAULT, NULL);
INSERT INTO COMMUNITY VALUES(SEQ_COMM_NO.NEXTVAL, '[수다]', '오늘 저녁 뭐먹죠?', '배가 너무 고픈데 오늘 저녁 뭐먹으면 좋을까요? 메뉴 추천 받아요', '2024-01-05', 'Y', '18', NULL, NULL, DEFAULT, NULL);

BEGIN
    FOR N IN 1..52
    LOOP
        INSERT INTO COMMUNITY VALUES(SEQ_COMM_NO.NEXTVAL, '[수다]', '게시글 ' || SEQ_COMM_NO.CURRVAL , '이 게시글은 영국에서 시작해서..' ||  SEQ_COMM_NO.CURRVAL, SYSDATE, 'Y', 0, NULL, NULL, DEFAULT, NULL);
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- 게시글 수정
UPDATE COMMUNITY
SET 

--------------------------------------------------------------------------------------------------------------------------------------------------------
-- 회원 테이블
CREATE SEQUENCE SEQ_MEM_NO;

ALTER TABLE MEMBER MODIFY MEMBER_STATUS DEFAULT 'Y';
ALTER TABLE MEMBER MODIFY MEMBER_ED DEFAULT SYSDATE;
ALTER TABLE MEMBER MODIFY MEMBER_MD DEFAULT SYSDATE;

SELECT * FROM MEMBER;

-- 회원 추가
INSERT INTO MEMBER VALUES(SEQ_MEM_NO.NEXTVAL, 'lee0101', '1234', 'ROLE_USER', '01012345678', 'lee0101@naver.com', '20000101', '영길이', '시츄', 'Y', SYSDATE, SYSDATE, 'N', 'N', 'N');
INSERT INTO MEMBER VALUES(SEQ_MEM_NO.NEXTVAL, 'yang0202', '1234', 'ROLE_USER', '01078945612', 'yang0202@gmail.com', '20020311', '방맹이', '푸들', 'Y', SYSDATE, SYSDATE, 'N', 'N', 'N');
INSERT INTO MEMBER VALUES(SEQ_MEM_NO.NEXTVAL, 'kim0303', '1234', 'ROLE_USER', '01055552222', 'kim0303@daum.net', '19990621', '복실이', '프렌치 불도그', 'Y', SYSDATE, SYSDATE, 'N', 'N', 'N');
INSERT INTO MEMBER VALUES(SEQ_MEM_NO.NEXTVAL, 'song0404', '1234', 'ROLE_USER', '01098745632', 'song0404@nate.com', '19990228', '동강이', '말티즈', 'Y', SYSDATE, SYSDATE, 'N', 'N', 'N');

COMMIT;



