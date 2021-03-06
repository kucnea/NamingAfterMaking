package com.web.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.gong.Gong;
import com.web.entity.player.Player;
import com.web.repository.GongRepository;

@Service
@Transactional(rollbackFor = Exception.class)
public class GongService {

	@Autowired GongRepository gongRepository;
	
	
	
	/* 리스트 조회 */
	public List<Gong> searchAll(){
		
		List<Gong> list = gongRepository.findAll();
		
		return list;
	}
	
	/* 게시글 작성 */
	public Gong write(Gong gong, Player player) {
		
		if(gong!=null && player!=null) {
			gong.setPlayer(player);
			
			return gongRepository.save(gong);
		}else {
			return null;
		}
		
	}

	/* 한 건 조회 */
	public Gong searchOne(int gongIdx) {
		Gong gongResult = gongRepository.findOne(gongIdx);
		
		// 조회수 올리는걸 한번에 하고 싶었는데 계속 nullPointer가 발생함.
//		System.out.println(gongResult.getGongCnt());
//		gongResult.setGongCnt(gongResult.getGongCnt()+1);
//		gongRepository.save(gongResult);
		
		return gongResult;
	}

	/* 업데이트 */
	public Gong update(Gong gong) {
		Gong gongUpdate = gongRepository.findOne(gong.getGongIdx());
		gongUpdate.setGongTitle(gong.getGongTitle());
		gongUpdate.setGongContent(gong.getGongContent());
		gongUpdate.setGongWTime(new Date());
		gongUpdate.setGongCnt(gong.getGongCnt());
		return gongRepository.save(gongUpdate);
	}

	/* 한 건 삭제*/
	public void delete(int gongIdx) {
		
		gongRepository.delete(gongIdx);
		
	}

	/* 페이징 */
	public Page<Gong> searchList(int page, int size) {
		
		PageRequest pageRequest = 
				new PageRequest(page, size, new Sort(Direction.DESC, "gongIdx"));
		
		Page<Gong> list = gongRepository.findAll(pageRequest);
		
		return list;
	}

	public Page<Gong> searchListByObject(int page, int size, String searchObject, String searchTarget) {

		PageRequest pageRequest = 
				new PageRequest(page, size, new Sort(Direction.DESC, "gongIdx"));
		
		Page<Gong> list = null;
		
		System.out.println("gongService stage searchObject : "+searchObject);
		System.out.println("gongService stage searchTarget : "+searchTarget);
		if(searchObject.equals("subject")) {
			list = gongRepository.findByGongTitleContaining(searchTarget, pageRequest);
			System.out.println("searchListByObject Object=subject stage");
		}
		else if(searchObject.equals("content")) list = gongRepository.findByGongContentContaining(searchTarget, pageRequest);
		else if(searchObject.equals("subjectContent")) list = gongRepository.findByGongTitleAndGongContentContaining(searchTarget, pageRequest);
		else if(searchObject.equals("writer")) list = gongRepository.findByPlayer_PNickContaining(searchTarget, pageRequest);
		
		return list;
	}




}
