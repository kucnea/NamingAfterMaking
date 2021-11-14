package com.web.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.free.Free;
import com.web.entity.free.FreeComment;
import com.web.entity.player.Player;
import com.web.repository.FreeCommentRepository;

@Service
@Transactional(rollbackFor = Exception.class)
public class FreeCommentService {

	@Autowired FreeCommentRepository freeCommentRepository;
	
	/* 리스트 조회 */
	public List<FreeComment> searchByFreeIdx(int freeIdx){
		
		List<FreeComment> list = freeCommentRepository.findByFree_FreeIdxOrderByFreeCmtIdx(freeIdx);
		
		return list;
	}


	/* 댓글 작성 */
	public void write(FreeComment freeComment, Free free, Player player) {
		
		if(freeComment!=null && free!=null && player!=null) {
			freeComment.setFree(free);
			freeComment.setPlayer(player);
			freeCommentRepository.save(freeComment);
		}else {
		}
		
	}
	
	/* 한 건 삭제 */
	public void delete(int freeCmtIdx) {
		freeCommentRepository.delete(freeCmtIdx);
	}

	/* 댓글 수정 */
	public void update(FreeComment freeComment) {
		FreeComment update = freeCommentRepository.findOne(freeComment.getFreeCmtIdx());
		update.setFreeCmtContent(freeComment.getFreeCmtContent());
		update.setFreeCmtWTime(new Date());
		freeCommentRepository.save(update);
	}
	
	
}
