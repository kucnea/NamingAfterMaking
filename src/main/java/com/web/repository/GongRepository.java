package com.web.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.web.entity.gong.Gong;

public interface GongRepository extends JpaRepository<Gong, Integer>{
	
	Page<Gong> findAll(Pageable pageable);
	
	//containing : 검색, IgnoreCase : 대소문자 구분 없이 검색
	Page<Gong> findByGongTitleContaining(String gongTitle, Pageable pageable);
	Page<Gong> findByGongContentContaining(String gongContent, Pageable pageable);
	Page<Gong> findByGongTitleAndGongContentContaining(String gonTitleAndGongContent,Pageable pageable);
	Page<Gong> findByPlayer_PNickContaining(String pNick,Pageable pageable);
//	List<Gong> findByGongTitleContaining(String gongTitle, Pageable pageable);
//	List<Gong> findByGongContentContaining(String gongContent, Pageable pageable);
//	List<Gong> findByGongTitleAndGongContentContaining(String gonTitleAndGongContent,Pageable pageable);
//	List<Gong> findByPlayer_PNickContaining(String pNick,Pageable pageable);
	
}
