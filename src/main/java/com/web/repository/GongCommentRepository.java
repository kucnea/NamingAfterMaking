package com.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.entity.gong.GongComment;

public interface GongCommentRepository extends JpaRepository<GongComment, Integer>{
	
	List<GongComment> findByGong_GongIdxOrderByGongCmtIdx(int gongIdx);
}
