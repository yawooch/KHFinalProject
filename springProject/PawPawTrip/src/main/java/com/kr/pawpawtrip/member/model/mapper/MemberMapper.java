package com.kr.pawpawtrip.member.model.mapper;

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

}
