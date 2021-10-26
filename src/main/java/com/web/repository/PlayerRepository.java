package com.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.entity.player.Player;

public interface PlayerRepository extends JpaRepository<Player, Integer>{
	Player findByPId(String pId);
	Player findByPNick(String pNick);
}
