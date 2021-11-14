package com.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.entity.free.FreeImg;

public interface FreeImgRepository extends JpaRepository<FreeImg, Integer>{
	
	List<FreeImg> findByFree_FreeIdxOrderByFreeImgIdx(int freeIdx);
}
