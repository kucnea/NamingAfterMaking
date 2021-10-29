package com.web.service;

import java.text.SimpleDateFormat;
import java.util.Date;

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
		if(p!=null) {
			System.out.println("player pass : "+player.getPPw());
			System.out.println("p pass : "+p.getPPw());
			if(player.getPPw().equals(p.getPPw())) return p;	
		}else return null;
		
		return null;
	}

	/* 로그아웃 */
	public void logout() {
		
		
		
	}

	public String validId(String pId) {
		String old = pId;
		System.out.println("player Service validPId Stage");
		
		pId = pId.toLowerCase()
				.replaceAll(" ", "")
				.trim()
				.replaceAll("[^0-9a-z-_]", "") 							// -, _이 두개 제외하고 제거
				.replaceAll("[-]{2,}", "-")
				.replaceAll("[_]{2,}", "_");
		if(pId=="") pId+="a";
		if(pId.startsWith("-")) pId = pId.substring(1, pId.length());
		if(pId.endsWith("-")) pId = pId.substring(1, pId.length());  	// 처음과 마지막에는 - 사용불가
		if(pId.isEmpty()) pId = "a";
		if(pId.length()>=13) pId = pId.substring(0, 12);
		if(pId.endsWith("-")) pId = pId.substring(1, pId.length());
		while(pId.length()<=3) {
			pId = pId + pId.substring(pId.length()-1);
		}
		
		if(playerRepository.findByPId(pId)==null) {
			if(old.equals(pId)) {
				return pId;		// 중복 X, 규약에 맞음 = 사용가능
			}else {
				return "@"+pId; // 중복 X, 규약에 안맞음 = 추천 Id제공
			}
		}else {
			while(playerRepository.findByPId(pId)!=null) {
				SimpleDateFormat format = new SimpleDateFormat("yyMMdd");
				Date date = new Date();
				String dS = format.format(date);
				System.out.println("valid() stage dateFormat yyMMdd : "+dS);
				if(pId.length()<6) pId = pId+dS;
				else {
					if(12-pId.length()>0) {
						dS.substring(0,12-pId.length());
						pId += dS;
					}else {
						pId = pId.substring(0,pId.length()-2);
						int t = 0;
						pId += t;
						t++;
						if(t==99) return "$";	// 입력한 Id에서 99가지 이상의 추천아이디 알고리즘이 있었으나 사용가능한 아이디가 없음.
					}
				}
			}
			return "#"+pId; // 중복 O, 규약에 안맞음 = 추천 Id제공
			
		}
	}
	
	
	public String validPNick(String pNick) {
		
		String old = pNick;
		System.out.println("player Service validPNick Stage");
		
		pNick = pNick
				.replaceAll(" ", "")
				.trim()
				.replaceAll("[^가-힣0-9a-zA-Z-_]", "") 							// -, _이 두개 제외하고 제거
				.replaceAll("[-]{2,}", "-")
				.replaceAll("[_]{2,}", "_");
		if(pNick=="") pNick+="a";
		if(pNick.isEmpty()) pNick = "a";
		if(pNick.length()>=11) pNick = pNick.substring(0, 10);
		
		if(playerRepository.findByPNick(pNick)==null) {
			if(old.equals(pNick)) {
				return pNick;		// 중복 X, 규약에 맞음 = 사용가능
			}else {
				return "@"+pNick; // 중복 X, 규약에 안맞음 = 추천 Id제공
			}
		}else {
			while(playerRepository.findByPNick(pNick)!=null) {
				SimpleDateFormat format = new SimpleDateFormat("yyMMdd");
				Date date = new Date();
				String dS = format.format(date);
				System.out.println("valid() stage dateFormat yyMMdd : "+dS);
				if(pNick.length()<5) pNick = pNick+dS;
				else {
					if(10-pNick.length()>0) {
						dS.substring(0,10-pNick.length());
						pNick += dS;
					}else {
						pNick = pNick.substring(0,pNick.length()-2);
						int t = 0;
						pNick += t;
						t++;
						if(t==99) return "$";	// 입력한 Id에서 99가지 이상의 추천아이디 알고리즘이 있었으나 사용가능한 아이디가 없음.
					}
				}
			}
			return "#"+pNick; // 중복 O, 규약에 안맞음 = 추천 Id제공
	}
	
	
}
	
}
