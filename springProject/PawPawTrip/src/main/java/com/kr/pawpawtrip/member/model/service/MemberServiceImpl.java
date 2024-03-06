package com.kr.pawpawtrip.member.model.service;

import javax.management.RuntimeErrorException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kr.pawpawtrip.member.model.mapper.MemberMapper;
import com.kr.pawpawtrip.member.model.vo.Member;


// mvc에서 service 역할하는 빈을 만드는 어노테이션
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	
	@Override
	public Member login(String memberId, String memberPw) {
		Member member = null;
		
		member = mapper.selectMemberById(memberId);
		
		if (member == null || !member.getMemberPw().equals(memberPw)) {
			return null;
		}
		
		return member;
	}

	
	@Override
	@Transactional // 에러가 생기면 자동 롤백 
	public int save(Member member) {
		int result = 0;
		
		if(member.getMemberNo() > 0) {
			// update
		} else {
			// insert
			result = mapper.insertMember(member);
		}
		
//		if(true) {
//			throw new RuntimeException("에러 발생");
//		}
		
		return result;
	}
	
}
