package com.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.entity.player.Player;

public interface PlayerRepository extends JpaRepository<Player, Integer>{
	List<Player> findByPid(String pId);
}
