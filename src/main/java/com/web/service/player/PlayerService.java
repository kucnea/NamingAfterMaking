package com.web.service.player;

import java.sql.SQLException;
import java.util.List;

import com.web.controller.player.Player;


public interface PlayerService {

	List<Player> getList() throws ClassNotFoundException, SQLException;
	Player getOne() throws ClassNotFoundException, SQLException;
	public int getCount() throws ClassNotFoundException, SQLException;
	public int insert(Player player) throws SQLException, ClassNotFoundException;
	public int update(Player player) throws SQLException, ClassNotFoundException;
	int delete(int pId) throws ClassNotFoundException, SQLException;
	
}
