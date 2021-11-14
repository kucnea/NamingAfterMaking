package com.web.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.web.entity.free.Free;

public interface FreeRepository extends JpaRepository<Free, Integer>{
	
	Page<Free> findAll(Pageable pageable);
	
	//containing : 검색, IgnoreCase : 대소문자 구분 없이 검색
	Page<Free> findByFreeTitleContaining(String freeTitle, Pageable pageable);
	Page<Free> findByFreeContentContaining(String freeContent, Pageable pageable);
	Page<Free> findByFreeTitleAndFreeContentContaining(String freeTitleAndFreeContent,Pageable pageable);
	Page<Free> findByPlayer_PNickContaining(String pNick,Pageable pageable);
	
}
