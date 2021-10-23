package com.web.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.web.entity.gong.Gong;

public interface GongRepository extends JpaRepository<Gong, Integer>{
	
	Page<Gong> findAll(Pageable pageable);
	
}
