package com.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.entity.player.Player;

public interface CustomPlayerRepository extends JpaRepository<Player, Long>{

	List<Player> findById(String pId);
	
}
