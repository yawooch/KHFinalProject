package com.kr.pawpawtrip.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	int selectCount();

}
