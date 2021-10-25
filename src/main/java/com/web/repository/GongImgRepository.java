package com.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.entity.gong.GongImg;

public interface GongImgRepository extends JpaRepository<GongImg, Integer>{
	
	List<GongImg> findByGong_GongIdxOrderByGongImgIdx(int gongIdx);
}
