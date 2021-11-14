package com.web.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.free.Free;
import com.web.entity.player.Player;
import com.web.repository.FreeRepository;

@Service
@Transactional(rollbackFor = Exception.class)
public class FreeService {

	@Autowired FreeRepository freeRepository;
	
	/* 리스트 조회 */
	public List<Free> searchAll(){
		
		List<Free> list = freeRepository.findAll();
		
		return list;
	}
	
	/* 게시글 작성 */
	public Free write(Free free, Player player) {
		
		if(free!=null && player!=null) {
			free.setPlayer(player);
			
			return freeRepository.save(free);
		}else {
			return null;
		}
		
	}

	/* 한 건 조회 */
	public Free searchOne(int freeIdx) {
		Free freeResult = freeRepository.findOne(freeIdx);
		
		return freeResult;
	}

	/* 업데이트 */
	public Free update(Free free) {
		Free freeUpdate = freeRepository.findOne(free.getFreeIdx());
		freeUpdate.setFreeTitle(free.getFreeTitle());
		freeUpdate.setFreeContent(free.getFreeContent());
		freeUpdate.setFreeWTime(new Date());
		freeUpdate.setFreeCnt(free.getFreeCnt());
		return freeRepository.save(freeUpdate);
	}

	/* 한 건 삭제*/
	public void delete(int freeIdx) {
		
		freeRepository.delete(freeIdx);
		
	}

	/* 페이징 */
	public Page<Free> searchList(int page, int size) {
		
		PageRequest pageRequest = 
				new PageRequest(page, size, new Sort(Direction.DESC, "freeIdx"));
		
		Page<Free> list = freeRepository.findAll(pageRequest);
		
		return list;
	}

	public Page<Free> searchListByObject(int page, int size, String searchObject, String searchTarget) {

		PageRequest pageRequest = 
				new PageRequest(page, size, new Sort(Direction.DESC, "freeIdx"));
		
		Page<Free> list = null;
		
		if(searchObject.equals("subject")) {
			list = freeRepository.findByFreeTitleContaining(searchTarget, pageRequest);
			System.out.println("searchListByObject Object=subject stage");
		}
		else if(searchObject.equals("content")) list = freeRepository.findByFreeContentContaining(searchTarget, pageRequest);
		else if(searchObject.equals("subjectContent")) list = freeRepository.findByFreeTitleAndFreeContentContaining(searchTarget, pageRequest);
		else if(searchObject.equals("writer")) list = freeRepository.findByPlayer_PNickContaining(searchTarget, pageRequest);
		
		return list;
	}
	
	
}
