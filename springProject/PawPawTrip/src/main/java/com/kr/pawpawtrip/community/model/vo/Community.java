package com.kr.pawpawtrip.community.model.vo;
import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Community 
{
    private int       communityNo;        // 커뮤니티 번호
    private int       communityRNUM;      // ROWNUM
    private String    communityCategory;  // 커뮤니티 분류
    private String    communityTitle;     // 커뮤니티 제목
    private String    communityContent;   // 커뮤니티 내용
    private LocalDate communityEd;        // 커뮤니티 등록일
    private String    communityStatus;    // 커뮤니티 상태
    private int       communityCount;     // 조회수
    private String    communityOfileName; // 첨부파일 원래이름
    private String    communityRfileName; // 첨부파일 변경이름
    private String    noticeImportantYN;  // 공지사항 중요 여부
    private int       communityWriterNo;  // 커뮤니티 작성자 번호
    private String    communityWriterId;  // 커뮤니티 작성자 아이디
}