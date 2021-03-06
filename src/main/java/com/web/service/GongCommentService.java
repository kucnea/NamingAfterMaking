package com.web.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.gong.Gong;
import com.web.entity.gong.GongComment;
import com.web.entity.player.Player;
import com.web.repository.GongCommentRepository;

@Service
@Transactional(rollbackFor = Exception.class)
public class GongCommentService {

	@Autowired GongCommentRepository gongCommentRepository;
	
	
	
	/* 리스트 조회 */
	public List<GongComment> searchByGongIdx(int gongIdx){
		
		List<GongComment> list = gongCommentRepository.findByGong_GongIdxOrderByGongCmtIdx(gongIdx);
		
		return list;
	}


	/* 댓글 작성 */
	public void write(GongComment gongComment, Gong gong, Player player) {
		
		if(gongComment!=null && gong!=null && player!=null) {
			gongComment.setGong(gong);
			gongComment.setPlayer(player);
			gongCommentRepository.save(gongComment);
		}else {
		}
		
	}
	
	/* 한 건 삭제 */
	public void delete(int gongCmtIdx) {
		gongCommentRepository.delete(gongCmtIdx);
	}

	/* 댓글 수정 */
	public void update(GongComment gongComment) {
		GongComment update = gongCommentRepository.findOne(gongComment.getGongCmtIdx());
		update.setGongCmtContent(gongComment.getGongCmtContent());
		update.setGongCmtWTime(new Date());
		gongCommentRepository.save(update);
	}
	


}
