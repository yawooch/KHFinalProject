package com.kr.pawpawtrip.community.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kr.pawpawtrip.common.util.MultipartFileUtil;
import com.kr.pawpawtrip.common.util.PageInfo;
import com.kr.pawpawtrip.community.model.service.CommunityService;
import com.kr.pawpawtrip.community.model.vo.Community;
import com.kr.pawpawtrip.member.model.vo.Member;

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
		
		// 공지사항 리스트 조회
		noticeList = communityService.getNoticeList();
		
//		System.out.println(noticeList);
		
		modelAndView.addObject("noticeList", noticeList);
		modelAndView.setViewName("community/notice");
		
		return modelAndView;
	}
	
//	자유 게시판
	@GetMapping("/community/board")
	public ModelAndView board(ModelAndView modelAndView, 
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "") String select,
			@RequestParam(defaultValue = "") String search) {
		
		// 전체 리스트 조회(검색기능 포함)
		List<Community> boardList = null;
		// 페이징 처리
		PageInfo pageInfo = null;
		// 전체 리스트 수
		int listCount = 0;
		// 검색 파라미터 request scope에 저장하기 위한 HashMap
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("select", select);
		map.put("search", search);
		
		listCount = communityService.getBoardCount(select, search);
		pageInfo = new PageInfo(page, 5, listCount, 15);
		
		// 자유게시판 리스트 조회(수다, 마이펫 자랑 포함)
		boardList = communityService.getBoardList(pageInfo, select, search);
		
		log.info("Board List - {}", boardList);
		
		modelAndView.addObject("searchInfoMap", map);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("boardList", boardList);
		modelAndView.setViewName("community/board");
		
		return modelAndView;
	}
	
//	자유 게시판 > 수다
	@GetMapping("/community/board/talk")
	public ModelAndView talk(ModelAndView modelAndView,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "") String select,
			@RequestParam(defaultValue = "") String search) {
		
		// 수다 리스트 조회(검색기능 포함)
		List<Community> boardTalkList = null;
		// 페이징 처리
		PageInfo pageInfo = null;
		// 전체 리스트 수
		int listCount = 0;
		// 검색 파라미터 request scope에 저장하기 위한 HashMap
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("select", select);
		map.put("search", search);
		
		listCount = communityService.getBoardTalkCount(select, search);
		pageInfo = new PageInfo(page, 5, listCount, 15);
		
		// 수다 리스트 조회
		boardTalkList = communityService.getBoardTalkList(pageInfo, select, search);
		
		log.info("Board TalkList - {}", boardTalkList);
		
		modelAndView.addObject("searchInfoMap", map);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("boardTalkList", boardTalkList);
		modelAndView.setViewName("community/board/talk");
		
		return modelAndView;
	}
	
//	자유 게시판 > 마이펫 자랑
	@GetMapping("/community/board/mypet")
	public ModelAndView mypet(
			ModelAndView modelAndView,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "") String select,
			@RequestParam(defaultValue = "") String search) {
		
		// 마이펫 리스트 조회(검색기능 포함)
		List<Community> boardMypetList = null;
		// 페이징 처리
		PageInfo pageInfo = null;
		// 전체 리스트 수
		int listCount = 0;
		// 검색 파라미터 request scope에 저장하기 위한 HashMap
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("select", select);
		map.put("search", search);
		
		listCount = communityService.getBoardMypetCount(select, search);
		pageInfo = new PageInfo(page, 5, listCount, 15);
		
		// 마이펫 리스트 조회
		boardMypetList = communityService.getBoardMypetList(pageInfo, select, search);
		
		log.info("Board MypetList - {}", boardMypetList);
		
		modelAndView.addObject("searchInfoMap", map);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("boardMypetList", boardMypetList);
		modelAndView.setViewName("community/board/mypet");
		
		return modelAndView;
	}
	
//	자유 게시판(수다) 상세
	@GetMapping("/community/board/talkdetail")
	public ModelAndView talkDetail(
			ModelAndView modelAndView,
			@RequestParam int no) {
		
		Community community = null;
		
		community = communityService.getBoardNo(no);
		
		log.info("Board TalkDetail - {}", community);
		
		modelAndView.addObject("community", community);
		modelAndView.setViewName("community/board/talkdetail");
		
		return modelAndView;
	}
	
//	자유 게시판(마이펫 자랑) 상세
	@GetMapping("/community/board/mypetdetail")
	public ModelAndView mypetDetail(
			ModelAndView modelAndView,
			@RequestParam int no) {
		
		Community community = null;
		
		community = communityService.getBoardNo(no);
		
		log.info("Board MypetDetail - {}", community);
		
		modelAndView.addObject("community", community);
		modelAndView.setViewName("community/board/mypetdetail");
		
		return modelAndView;
	}
	
//	게시글 작성
	@GetMapping("/community/boardwrite")
	public String boardWrite() {
		
		return "community/boardwrite";
	}
	
	@PostMapping("/community/boardwrite")
	public ModelAndView boardWrite(
			ModelAndView modelAndView, 
			@SessionAttribute("loginMember") Member loginMember,
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
		community.setCommunityWriterNo(loginMember.getMemberNo());
		
//		System.out.println("커뮤니티 : " + community);
		
		result = communityService.save(community);
		
		if(result > 0) {
			modelAndView.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			
			if(community.getCommunityCategory().equals("[수다]")) {
				modelAndView.addObject("location", "/community/board/talkdetail?no=" + community.getCommunityNo());
			} 
			
			if(community.getCommunityCategory().equals("[마이펫 자랑]")) {
				modelAndView.addObject("location", "/community/board/mypetdetail?no=" + community.getCommunityNo());
			}
			
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
//	게시글 수정
	@GetMapping("/community/boardupdate")
	public ModelAndView boardUpdate(
			ModelAndView modelAndView,
			@RequestParam int no,
			@SessionAttribute Member loginMember) {
		
		Community community = null;
		
		community = communityService.getBoardNo(no);
		
		log.info("Board Update - {}", community);
		
		if(community != null && community.getCommunityWriterId().equals(loginMember.getMemberId())) {
			modelAndView.addObject("community", community);
			modelAndView.setViewName("community/boardupdate");
		} else {
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/community/board");
			modelAndView.setViewName("common/msg");
		}
		
		return modelAndView;
	}
	
	@PostMapping("/community/boardupdate")
	public ModelAndView boardUpdate(
			ModelAndView modelAndView, 
			@RequestParam int communityNo,
			@RequestParam String communityCategory,
			@RequestParam String communityTitle,
			@RequestParam String communityContent,
			@RequestParam MultipartFile talkWriteFile,
			@SessionAttribute Member loginMember) {
		
		int result = 0;
		Community community = null;
		
		community = communityService.getBoardNo(communityNo);
		
		System.out.println(community);
		System.out.println(community != null && community.getCommunityWriterId().equals(loginMember.getMemberId()));
		
		if(community != null && community.getCommunityWriterId().equals(loginMember.getMemberId())) {
			if(talkWriteFile != null && !talkWriteFile.isEmpty()) {
				String location = null;
				String renamedFileName = null;
				
				try {
					
					// workspace에 저장되어 있는 파일 경로
					location = resourceLoader.getResource("resources/upload/community").getFile().getPath();
					
					if(community.getCommunityRfileName() != null) {
						MultipartFileUtil.delete(location + "/" + community.getCommunityRfileName());
					}
					
					renamedFileName = MultipartFileUtil.save(talkWriteFile, location);
					
					if(renamedFileName != null) {
						community.setCommunityOfileName(talkWriteFile.getOriginalFilename());
						community.setCommunityRfileName(renamedFileName);
					}
					
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			community.setCommunityCategory(communityCategory);
			community.setCommunityTitle(communityTitle);
			community.setCommunityContent(communityContent);
			
			result = communityService.save(community);
			
			if(result > 0) {
				modelAndView.addObject("msg", "게시글 수정 성공");
				
				if(community.getCommunityCategory().equals("[수다]")) {
					modelAndView.addObject("location", "/community/board/talkdetail?no=" + community.getCommunityNo());
				}
				
				if(community.getCommunityCategory().equals("[마이펫 자랑]")) {
					modelAndView.addObject("location", "/community/board/mypetdetail?no=" + community.getCommunityNo());
				}
			} else {
				modelAndView.addObject("msg", "게시글 수정 실패");
				modelAndView.addObject("location", "/community/board");
			}
			
			
		} else {
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/community/boardupdate?no=" + community.getCommunityNo());
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
//	파일 다운로드
	@GetMapping("/community/board/fileDown")
	public ResponseEntity<Resource> fileDown(
			@RequestParam("oname") String oname, 
			@RequestParam("rname") String rname,
			@RequestHeader("user-agent") String userAgent) {
		// userAgent: 브라우저별 인코딩 처리하기 위한 매개변수

		Resource resource = null;
		String downName = null;
		
		System.out.println("oname : " + oname);
		System.out.println("rname : " + rname);

		try {
			// 1. 클라이언트로 전송할 파일을 가져온다.
			resource = resourceLoader.getResource("resources/upload/community/" + rname);

			// 2. 브라우저별 인코딩
			boolean isMISE = userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1;

			if (isMISE) {
				downName = URLEncoder.encode(oname, "UTF-8").replaceAll("\\+", "%20");

			} else {
				downName = new String(oname.getBytes("UTF-8"), "ISO-8859-1");
			}

			// 3. 응답 메세지 작성 & 클라이언트로 출력(전송)
			return ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + downName)
					.body(resource);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 에러가 발생하면 500에러(내부 서버 에러) 응답
		}

	}
	
//	공지사항 상세
	@GetMapping("community/noticedetail")
	public String noticeDetail() {
		
		return "community/noticedetail";
	}

}




















