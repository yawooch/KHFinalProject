package com.kr.pawpawtrip.community.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.common.util.MultipartFileUtil;
import com.kr.pawpawtrip.community.model.service.CommunityService;
import com.kr.pawpawtrip.community.model.vo.Community;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class CommunityController {
	private final CommunityService communityService;
	private final ResourceLoader resourceLoader;
	

//	공지사항
	@GetMapping("/community/notice")
	public ModelAndView notice(ModelAndView modelAndView) {
		
		List<Community> noticeList = null;
		
		noticeList = communityService.getNoticeList();
		
		System.out.println(noticeList);
		
		modelAndView.addObject("noticeList", noticeList);
		modelAndView.setViewName("community/notice");
		
		return modelAndView;
	}
	
//	자유 게시판
	@GetMapping("/community/board")
	public String board() {
		
		return "community/board";
	}
	
//	자유 게시판 > 수다
	@GetMapping("community/board/talk")
	public String talk() {
		
		return "community/board/talk";
	}
	
//	자유 게시판 > 마이펫 자랑
	@GetMapping("community/board/mypet")
	public String mypet() {
		
		return "community/board/mypet";
	}
	
//	게시글 작성
	@GetMapping("community/boardwrite")
	public String boardWrite() {
		
		return "community/boardwrite";
	}
	
	@PostMapping("community/boardwrite")
	public ModelAndView boardWrite(ModelAndView modelAndView, 
			Community community,
			@RequestParam("talkWriteFile") MultipartFile talkWriteFile) {
		
		int result = 0;
		
		// 1. 파일 업로드 확인 후 파일 저장
		// 파일을 업로드하지 않으면 로그에 true, 업로드하면 false
		log.info("isEmpty: {}", talkWriteFile.isEmpty());
		
		// 파일을 업로드하지 않으면 ""(빈문자), 업로드하면 "파일명"
		log.info("File Name : {}", talkWriteFile.getOriginalFilename());
		
		if(talkWriteFile != null && !talkWriteFile.isEmpty()) {
			String location = null;
			String renamedFileName = null;
			
			try {
				
				location = resourceLoader.getResource("resources/upload/community").getFile().getPath();
				
				renamedFileName = MultipartFileUtil.save(talkWriteFile, location);
				
				if(renamedFileName != null) {
					community.setCommunityOfileName(talkWriteFile.getOriginalFilename());
					community.setCommunityRfileName(renamedFileName);
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		// 2. 작성한 게시글 데이터베이스 저장
		// 누가 작성했는지..(일단 임의로 저장)
		community.setCommunityWriterNo(2);
		
		System.out.println("커뮤니티 : " + community);
		
		result = communityService.save(community);
		
		if(result > 0) {
			modelAndView.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			
			if(community.getCommunityCategory().equals("분류")) {
				modelAndView.addObject("msg", "카테고리를 선택해주세요.");
				modelAndView.addObject("location", "/community/boardwrite");
			} else {
				if(community.getCommunityCategory().equals("수다")) {
					// 수다 상세페이지로 이동해야 하지만 임시방편으로 "자유게시판>수다" 이동
					modelAndView.addObject("location", "/community/board/talk");
				} else if(community.getCommunityCategory().equals("마이펫 자랑")) {
					// 마이펫 자랑 상세페이지로 이동해야 하지만 임시방편으로 "자유게시판>마이펫 자랑" 이동
					modelAndView.addObject("location", "/community/board/mypet");
				}
			}
			
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
//	공지사항 상세
	@GetMapping("community/noticedetail")
	public String noticeDetail() {
		
		return "community/noticedetail";
	}
	
//	자유 게시판(수다) 상세
	@GetMapping("community/board/talkdetail")
	public String talkDetail() {
		
		return "community/board/talkdetail";
	}
	
//	자유 게시판(마이펫 자랑) 상세
	@GetMapping("community/board/mypetdetail")
	public String mypetDetail() {
		
		return "community/board/mypetdetail";
	}
}




















