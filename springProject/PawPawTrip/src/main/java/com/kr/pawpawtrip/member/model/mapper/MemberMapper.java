package com.kr.pawpawtrip.member.model.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kr.pawpawtrip.member.model.vo.Member;

@Mapper
public interface MemberMapper {
//	@Select("SELECT COUNT(*) FROM MEMBER")
//	int selectCount();
	
	Member selectMemberById(@Param("memberId") String memberId);
	
	int insertMember(Member member);

	Member findKakao(HashMap<String, Object> userInfo);

	int insertKakao(HashMap<String, Object> userInfo);
	
	int updateMember(Member member);
	
	int updateStatus(@Param("memberNo") int memberNo, @Param("memberStatus") String memberStatus);
	
	
	

}
