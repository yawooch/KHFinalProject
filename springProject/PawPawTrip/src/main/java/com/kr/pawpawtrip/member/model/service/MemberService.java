package com.kr.pawpawtrip.member.model.service;

import com.kr.pawpawtrip.member.model.vo.Member;

public interface MemberService {

	Member login(String memberId, String memberPw);

	int save(Member member);
	
}
