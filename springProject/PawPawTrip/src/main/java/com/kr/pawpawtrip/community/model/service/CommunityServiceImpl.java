package com.kr.pawpawtrip.community.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kr.pawpawtrip.community.model.mapper.CommunityMapper;
import com.kr.pawpawtrip.community.model.vo.Community;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService {
	private final CommunityMapper communityMapper;

	@Override
	public List<Community> getNoticeList() {
		
		return communityMapper.selectNoticeList();
	}

}
