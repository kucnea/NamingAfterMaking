package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
		
//		for(Gong g : list) {
//			System.out.println("받아오는 리스트 확인");
//			System.out.println("Gong : "+g.toString());
//		}
		
		return list;
	}
	
	public boolean write(Gong gong, Player player) {
		
		if(gong!=null && player!=null) {
			gong.setPlayer(player);
			gongRepository.save(gong);
			return true;
		}else {
			return false;
		}
		
	}
}
