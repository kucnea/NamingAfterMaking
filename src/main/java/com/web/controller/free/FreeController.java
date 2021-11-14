package com.web.controller.free;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;

import com.web.entity.free.Free;
import com.web.entity.free.FreeComment;
import com.web.entity.free.FreeImg;
import com.web.entity.player.Player;
import com.web.service.FreeCommentService;
import com.web.service.FreeImgService;
import com.web.service.FreeService;

@Controller
@RequestMapping("/free/")
public class FreeController {

	@Autowired FreeService freeService;
	@Autowired FreeCommentService freeCmtService;
	@Autowired FreeImgService freeImgService;
	@Autowired private ServletContext ctx;
	
	//파일 저장 경로 ( 로컬용 )
	final String webPath = "/static/upload";
	//파일 저장 경로 ( 호스팅용 )
//	final String webPath = "/var/webapps/upload/forNAM"; //외부 경로 저장 성공.
	
	
	@RequestMapping("freelist")
	public String freeBoard(Model model,
			@RequestParam("page") @Nullable Integer page, 
			@RequestParam("size") @Nullable Integer size,
			@RequestParam("searchObject") @Nullable String searchObject,
			@RequestParam("searchTarget") @Nullable String searchTarget) {	//url과 method명을 맞추는 것이 관리에 용이
	
		System.out.println("freeList stage");
		
		if(page==null) page=1;
		if(size==null) size=10;
		
		page-=1;
		Page<Free> pages = null;
		
		if(searchObject!=null) pages = freeService.searchListByObject(page,size,searchObject,searchTarget);
		else pages = freeService.searchList(page, size);
		
		if(page<0) page=0;
		else if(page>pages.getTotalPages()) page=pages.getTotalPages();
		
		model.addAttribute("maxPage",pages.getTotalPages());
		model.addAttribute("page1",page+1);
		model.addAttribute("size1",size);
		
		List<Free> list = pages.getContent();
		if(list.size()!=0) model.addAttribute("list", list);
		else model.addAttribute("msg", "조회된 결과가 없습니다.");
		
		return "free.freeList";
	}
	
	@RequestMapping("freewrite")
	public String freeWrite(Model model) {
		
		
		
		return "free.freeWrite";
	}
	
	@PostMapping("freesubmit")
	public String freeSubmit( 
			@ModelAttribute("free") Free free,
			@RequestParam("file") @Nullable MultipartFile file,
			HttpServletRequest request,
			Model model) {
		
		System.out.println("free submit stage");
		
		FreeImg freeImg = new FreeImg();
		System.out.println(file);
		//이미지파일
		if(file.getSize()!=0) {
			UUID uuidTemp = UUID.randomUUID();
			String imgId = uuidTemp.toString().replace("-", "");
		
			long fileSize = file.getSize();
			String fileOriName = file.getOriginalFilename();
			String fileUseName = imgId+file.getOriginalFilename();
			String filePath = "";
			
			System.out.printf("fileOriName : %s, fileSize : %d\n", fileOriName, fileSize);
			System.out.printf("fileUseName : %s\n", fileUseName);
			
			//파일 저장 경로 ( 로컬용 ) //final로 걸어둠.
//			String webPath = "/static/upload";
			//파일 저장 경로 ( 호스팅용 )
			
			//로컬
//			String realPath = ctx.getRealPath(webPath);
//			System.out.println("realPath : "+realPath);
			//호스팅
			String realPath = webPath;
			
			//업로드하기위한 경로 없을경우
			File savePath = new File(realPath);
			if(!savePath.exists()) savePath.mkdirs();
			
			//separator : 파일구분자, 윈도우는 \\ 리눅스는 / 로 사용하는걸 구분지어줌.
			realPath += File.separator + fileUseName;
			filePath = realPath;
			File saveFile = new File(realPath);
			
			try {
				file.transferTo(saveFile);
				freeImg.setFreeFileOriName(fileOriName);
				freeImg.setFreeFileUseName(fileUseName);
				freeImg.setFreeFilePath(filePath);
				freeImg.setFreeFileSize(fileSize);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
		//글만 저장
		HttpSession session = request.getSession();
		Player player = (Player) session.getAttribute("player");
		free.setFreeContent(free.getFreeContent().replace("\r\n", "<br>"));
		Free result = freeService.write(free,player);
		//그림 포함
		if(file.getSize()!=0) freeImgService.save(freeImg,result);
		
		if(result!=null) {
			return "redirect:freelist";	
		}else {
			return "free.freeWrite";
		}
		
	}
	
	@RequestMapping("freedetail")
	public String freeDetail(
			@RequestParam("freeIdx") int freeIdx,
			@RequestParam("page") @Nullable Integer page, 
			@RequestParam("size") @Nullable Integer size,
			Model model) {
		
		System.out.println("freeIdx : "+freeIdx);
		
		//읽기전 조회수 증가 처리, model에 저장
		Free free = freeService.searchOne(freeIdx);
		free.setFreeCnt(free.getFreeCnt()+1);		
		freeService.update(free);
		free = freeService.searchOne(freeIdx);
		free.setFreeContent(free.getFreeContent().replace("\r\n", "<br>"));
		model.addAttribute("free",free);

		//댓글
		List<FreeComment> cmt = freeCmtService.searchByFreeIdx(freeIdx);
		model.addAttribute("cmt", cmt);
		//댓글갯수
		int cmtCnt = cmt.size();
		model.addAttribute("cmtCnt", cmtCnt);
		
		//이전글, 다음글
		Free free1 = freeService.searchOne(freeIdx-1);
		Free free2 = freeService.searchOne(freeIdx+1);
		
		//프로퍼티 관리
		if(free1!=null) model.addAttribute("free1",free1);
		if(free2!=null) model.addAttribute("free2",free2);
		if(page!=null) model.addAttribute("page1",page);
		else model.addAttribute("page1",1);
		if(size!=null) model.addAttribute("size1",size);
		else model.addAttribute("size1",10);
		
		return "free.freeDetail";
	}
	
	@RequestMapping("freeupdate")
	public String freeUpdate(@RequestParam("freeIdx") int freeIdx, Model model) {
		
		Free free = freeService.searchOne(freeIdx);
		model.addAttribute("free",free);
		
		return "free.freeUpdate";
	}
	
	
	@PostMapping("freeupdatesubmit")
	public String freeUpdateSubmit(
			@ModelAttribute("free") Free free,
			@RequestParam("file") @Nullable MultipartFile file,
			HttpServletRequest request,
			Model model) {
		
		HttpSession session = request.getSession();
		Player player = (Player) session.getAttribute("player");
		
		System.out.println("freeUpdateSubmit Stage");
		System.out.println("free toString : "+free.toString());
		
		FreeImg freeImg = new FreeImg();
		System.out.println(file);
		//이미지파일
		if(file.getSize()!=0) {
			UUID uuidTemp = UUID.randomUUID();
			String imgId = uuidTemp.toString().replace("-", "");
		
			long fileSize = file.getSize();
			String fileOriName = file.getOriginalFilename();
			String fileUseName = imgId+file.getOriginalFilename();
			String filePath = "";
			
			System.out.printf("fileOriName : %s, fileSize : %d\n", fileOriName, fileSize);
			System.out.printf("fileUseName : %s\n", fileUseName);
			
//			//파일 저장 경로 ( 호스팅시 수정 필요 ) //final로 걸어둠
//			String webPath = "/static/upload";
			
			//로컬
//			String realPath = ctx.getRealPath(webPath);
//			System.out.println("realPath : "+realPath);
			
			//호스팅
			String realPath = webPath;
			
			
			//업로드하기위한 경로 없을경우
			File savePath = new File(realPath);
			if(!savePath.exists()) savePath.mkdirs();
			
			//separator : 파일구분자, 윈도우는 \\ 리눅스는 / 로 사용하는걸 구분지어줌.
			realPath += File.separator + fileUseName;
			filePath = realPath;
			File saveFile = new File(realPath);
			
			try {
				file.transferTo(saveFile);
				freeImg.setFreeFileOriName(fileOriName);
				freeImg.setFreeFileUseName(fileUseName);
				freeImg.setFreeFilePath(filePath);
				freeImg.setFreeFileSize(fileSize);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
//		List<GongImg> list = new ArrayList<GongImg>();
//		list.add(gongImg);
//		gong.setGongImg(list);
		free.setFreeContent(free.getFreeContent().replace("\r\n", "<br>"));
		Free result = freeService.update(free);
		
		System.out.println("===file null Test===");
		System.out.println(file);
		System.out.println("===gongImg null Test===");
		System.out.println(freeImg);
		System.out.println("===gong null Test===");
//		System.out.println(result); 오버플로우 발생.
		
		if(file.getSize()!=0) freeImgService.update(freeImg,result);
//		Gong gongUpdated = gongService.searchOne(gong.getGongIdx()); gongService로 옮김.
//		gongUpdated.setGongTitle(gong.getGongTitle());
//		gongUpdated.setGongContent(gong.getGongContent());
//		gongUpdated.setGongWTime(new Date());
//		gongService.update(gongUpdated);
//		gongUpdated = gongService.searchOne(gong.getGongIdx());
//		model.addAttribute("gong",gongUpdated);
		
		
		
		return "redirect:freedetail?freeIdx="+free.getFreeIdx();
	}
	
	@RequestMapping("freedelete")
	public String freeDelete(@RequestParam("freeIdx") int freeIdx) {
		
		freeService.delete(freeIdx);
		
		return "redirect:freelist";
	}
	
	@PostMapping("freecmtsubmit")
	public String freeCmtSubmit(
			@ModelAttribute("freeComment") FreeComment freeComment,
			@RequestParam("freeIdx") int freeIdx,
			HttpServletRequest request,
			Model model) {
		
		System.out.println("freeComment_freeCmtContent : "+freeComment.getFreeCmtContent());
		HttpSession session = request.getSession();
		Player player = (Player) session.getAttribute("player");
		
		Free free = freeService.searchOne(freeIdx);
		freeCmtService.write(freeComment, free, player);
		
		
		return "redirect:freedetail?freeIdx="+freeIdx;
	}
	
	@RequestMapping("freecmtdelete")
	public String freeCmtDelete(
			@RequestParam("freeIdx") int freeIdx,
			@RequestParam("freeCmtIdx") int freeCmtIdx) {
		
		freeCmtService.delete(freeCmtIdx);
		
		return "redirect:freedetail?gongIdx="+freeIdx;
	}
	
	@RequestMapping("freecmtupdate")
	public String freeCmtUpate(
			@RequestParam("freeIdx") int freeIdx,
			@ModelAttribute("freeComment") FreeComment freeComment) {
		
		System.out.println("freeCmtUpdate stage");
		System.out.println("freeComment.getFreeCmtContent() : "+freeComment.getFreeCmtContent());
		freeCmtService.update(freeComment);
		
		return "redirect:freedetail?freeIdx="+freeIdx;
	}
	
}
