package com.web.service.player;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.player.Player;
import com.web.repository.CustomPlayerRepository;

@Service
@Transactional(rollbackFor = Exception.class)
public class PlayerService {

	@Autowired CustomPlayerRepository playerRepository;
	
	/* 회원가입 */
	public int join(Player player) {
		
		boolean validFlag = validateDuplicatePlayer(player); // 중복 체크
		if(validFlag) {
		playerRepository.save(player);
		return player.getpIdx();
		}else {
			return -1;
		}
		
	}
	
	private boolean validateDuplicatePlayer(Player player) {
		List<Player> findPlayers = playerRepository.findById(player.getpId());
		if (!findPlayers.isEmpty()) return false;
        else return true;
	}
}
