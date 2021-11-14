package com.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.entity.free.FreeComment;

public interface FreeCommentRepository extends JpaRepository<FreeComment, Integer>{
	
	List<FreeComment> findByFree_FreeIdxOrderByFreeCmtIdx(int freeIdx);
}
