package com.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.player.Player;
import com.web.repository.PlayerRepository;

@Service
@Transactional(rollbackFor = Exception.class)
public class PlayerService {

	@Autowired PlayerRepository playerRepository;
	
	
	/* 회원가입 */
	public int join(Player player) {
		
		boolean validFlag = validateDuplicatePlayer(player); // 중복 체크
		if(!validFlag) {
		playerRepository.save(player);
		return player.getPIdx();
		}else {
			return -1;
		}
		
	}
	
	/* 중복체크 */
	private boolean validateDuplicatePlayer(Player player) {
		Player findPlayer = playerRepository.findByPId(player.getPId());
		if (findPlayer==null) return false;
        else return true;
	}
	
	/* 로그인 */
	public Player login(Player player) {

		Player p = playerRepository.findByPId(player.getPId());
		
		System.out.println("player pass : "+player.getPPw());
		System.out.println("p pass : "+p.getPPw());
		
		if(player.getPPw().equals(p.getPPw())) return p;
		else return null;
		
	}

	/* 로그아웃 */
	public void logout() {
		
		
		
	}
}
