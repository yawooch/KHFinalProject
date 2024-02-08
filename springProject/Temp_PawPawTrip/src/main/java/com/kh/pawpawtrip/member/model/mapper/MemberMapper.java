package com.kh.pawpawtrip.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.pawpawtrip.member.model.vo.Member;

@Mapper
public interface MemberMapper
{
//    @Select("SELECT COUNT(*) FROM MEMBER")
//    int selectCount();
    
    Member selectMemberById(@Param("id") String userId);
    
    
    int insertMember(Member member);
}
