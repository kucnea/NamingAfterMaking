package com.web.controller.gong;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.entity.gong.Gong;
import com.web.entity.gong.GongComment;
import com.web.entity.player.Player;
import com.web.service.GongCommentService;
import com.web.service.GongService;

@Controller
@RequestMapping("/gong/")
public class GongController {

	@Autowired GongService gongService;
	@Autowired GongCommentService gongCmtService;
			   	
	
	
	@RequestMapping("gonglist")
	public String gongList(Model model,
			@RequestParam("page") Integer page, 
			@RequestParam("size") Integer size,
			@RequestParam("searchObject") @Nullable String searchObject,
			@RequestParam("searchTarget") @Nullable String searchTarget) {	//url과 method명을 맞추는 것이 관리에 용이
		
		System.out.println("gong Controller : gongList stage");
		
		//여기부터
		
//		List<Gong> list = gongService.searchAll();
//		
//		System.out.println("list의 사이즈 :"+list.size());
//		System.out.println(list.get(0).getPlayer().getPNick());
//		
//		if(list.size()!=0) model.addAttribute("list", list);
//		else model.addAttribute("msg", "조회된 결과가 없습니다.");
		
		if(page==null) page=1;
		if(size==null) size=10;
		//여기까지는 기존의 전체를 불러오는 코드. 하기는 페이징을 위해 만들 코드
		page-=1;
		Page<Gong> pages = null;
		System.out.println("gongList stage searchObject : "+searchObject);
		System.out.println("gongList stage searchTarget : "+searchTarget);
		if(searchObject!=null) pages = gongService.searchListByObject(page,size,searchObject,searchTarget);
		else pages = gongService.searchList(page, size);
		
//		Page<Gong> pages = gongService.searchList(page, size);
		if(page<0) page=0;
		else if(page>pages.getTotalPages()) page=pages.getTotalPages();
		
		System.out.println("Page의 사이즈 : "+pages.getSize());
		System.out.println("Page의 page수 : "+pages.getTotalPages());
		
		model.addAttribute("maxPage",pages.getTotalPages());
		model.addAttribute("page1",page+1);
		model.addAttribute("size1",size);
		
		List<Gong> list = pages.getContent();
		if(list.size()!=0) model.addAttribute("list", list);
		else model.addAttribute("msg", "조회된 결과가 없습니다.");
		
		//여기까지
		
		return "gong.gongList";
	}
	
	@RequestMapping("gongwrite")
	public String gongWrite(Model model) {
		
		
		
		return "gong.gongWrite";
	}
	
	@PostMapping("gongsubmit")
	public String gongSubmit(Model model, @ModelAttribute("gong") Gong gong,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Player player = (Player) session.getAttribute("player");
		boolean result = gongService.write(gong,player);
		
		if(result) {
			return "redirect:gonglist";	
		}else {
			return "gong.gongWrite";
		}
		
	}
	
	@RequestMapping("gongdetail")
	public String gongDetail(
			@RequestParam("gongIdx") int gongIdx,
			@RequestParam("page") @Nullable Integer page, 
			@RequestParam("size") @Nullable Integer size,
			Model model) {
		
		System.out.println("gongIdx : "+gongIdx);
		
		//읽기전 조회수 증가 처리, model에 저장
		Gong gong = gongService.searchOne(gongIdx);
		gong.setGongCnt(gong.getGongCnt()+1);		
		gongService.update(gong);
		gong = gongService.searchOne(gongIdx);
		model.addAttribute("gong",gong);

		//댓글
		List<GongComment> cmt = gongCmtService.searchByGongIdx(gongIdx);
		model.addAttribute("cmt", cmt);
		//댓글갯수
		int cmtCnt = cmt.size();
		model.addAttribute("cmtCnt", cmtCnt);
		
		//이전글, 다음글
		Gong gong1 = gongService.searchOne(gongIdx-1);
		Gong gong2 = gongService.searchOne(gongIdx+1);
		
		//프로퍼티 관리
		if(gong1!=null) model.addAttribute("gong1",gong1);
		if(gong2!=null) model.addAttribute("gong2",gong2);
		if(page!=null) model.addAttribute("page1",page);
		else model.addAttribute("page1",1);
		if(size!=null) model.addAttribute("size1",size);
		else model.addAttribute("size1",10);
		
		return "gong.gongDetail";
	}
	
	@RequestMapping("gongupdate")
	public String gongUpdate(@RequestParam("gongIdx") int gongIdx, Model model) {
		
		Gong gong = gongService.searchOne(gongIdx);
		model.addAttribute("gong",gong);
		
		return "gong.gongUpdate";
//		return "redirect:gongdetail?gongIdx="+gongIdx;
	}
	
	
	@PostMapping("gongupdatesubmit")
	public String gongUpdateSubmit(Model model, @ModelAttribute("gong") Gong gong,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Player player = (Player) session.getAttribute("player");
		
		System.out.println("gongUpdateSubmit Stage");
		System.out.println("gong toString : "+gong.toString());
		
		gongService.update(gong);
		
//		Gong gongUpdated = gongService.searchOne(gong.getGongIdx()); gongService로 옮김.
//		gongUpdated.setGongTitle(gong.getGongTitle());
//		gongUpdated.setGongContent(gong.getGongContent());
//		gongUpdated.setGongWTime(new Date());
//		gongService.update(gongUpdated);
//		gongUpdated = gongService.searchOne(gong.getGongIdx());
//		model.addAttribute("gong",gongUpdated);
		
		
		
		return "redirect:gongdetail?gongIdx="+gong.getGongIdx();
	}
	
	@RequestMapping("gongdelete")
	public String gongDelete(@RequestParam("gongIdx") int gongIdx) {
		
		gongService.delete(gongIdx);
		
		return "redirect:gonglist";
	}
	
	@PostMapping("gongcmtsubmit")
	public String gongCmtSubmit(
			@ModelAttribute("gongComment") GongComment gongComment,
			@RequestParam("gongIdx") int gongIdx,
			HttpServletRequest request,
			Model model) {
		
		System.out.println("gongComment_gongCmtContent : "+gongComment.getGongCmtContent());
		HttpSession session = request.getSession();
		Player player = (Player) session.getAttribute("player");
		
		Gong gong = gongService.searchOne(gongIdx);
		gongCmtService.write(gongComment, gong, player);
		
		
		return "redirect:gongdetail?gongIdx="+gongIdx;
	}
	
//	@RequestMapping("gongcmtdelete")
//	public String gongCmtDelete(
//			@RequestParam("gongIdx") int gongIdx,
//			@RequestParam("gongCmtIdx") int gongCmtIdx) {
//		
//		gongCmtService.delete(gongCmtIdx);
//		
//		return "redirect:gongdetail?gongIdx="+gongIdx;
//	}
}
