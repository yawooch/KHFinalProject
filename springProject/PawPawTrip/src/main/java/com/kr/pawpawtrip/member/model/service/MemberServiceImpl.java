package com.kr.pawpawtrip.member.model.service;

import javax.management.RuntimeErrorException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kr.pawpawtrip.member.model.mapper.MemberMapper;
import com.kr.pawpawtrip.member.model.vo.Member;


// mvc에서 service 역할하는 빈을 만드는 어노테이션
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	@Override
	public Member login(String memberId, String memberPw) {
		Member member = mapper.selectMemberById(memberId);
		
		// 매번 다른 값으로 암호화
		System.out.println("encoder : " + encoder.encode(memberPw));
		
		System.out.println(encoder.matches(memberPw, member.getMemberPw()));
		
											// 사용자가 입력한 비밀번호, db에 저장된 번호 비교 
		if (member == null || !encoder.matches(memberPw, member.getMemberPw())) {
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
			member.setMemberPw(encoder.encode(member.getMemberPw())); // insert 전 암호화 된 패스워드를 객체에 set해줌
			
			result = mapper.insertMember(member);
		}
		
		return result;
	}


	@Override
	public Boolean isDuplicateId(String memberId) {

		// null이 아니면 true 리턴 = 아이디 중복
		return mapper.selectMemberById(memberId) != null;
	}
	
}
