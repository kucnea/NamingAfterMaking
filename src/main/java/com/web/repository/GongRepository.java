package com.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.entity.gong.Gong;

public interface GongRepository extends JpaRepository<Gong, Integer>{
//	List<Gong> findByGongIdx_pIdx(int pIdx);
}
