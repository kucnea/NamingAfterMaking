package com.web.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.entity.player.Player;
import com.web.service.PlayerService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired PlayerService playerService;
	
	@RequestMapping("adminpage")
	public String adminPage(Model model) {
	
		return "admin.adminPage";
	}
	
	
	@RequestMapping("playersearch")
	public String playerSearch(
			Model model,
			@RequestParam("searchId") @Nullable String searchId
			) {
		
		System.out.println("playerSearch stage : "+searchId);
		if(searchId != null) {
			Player player = playerService.searchPId(searchId);
			if(player != null) {
				System.out.println("player.getPId() : "+player.getPId());
				model.addAttribute("player1", player);
			}
		}
		
		return "admin.adminPage";
	}
	
	@PostMapping("playerupdate")
	public String playerUpdaute(Model model) {
		
		String searchId = (String) model.getAttribute("updateId");
		String searchPw = (String) model.getAttribute("updatePw");
		String searchNick = (String) model.getAttribute("updateNick");
		String searchStatus = (String) model.getAttribute("updateStatus");
		int searchIdx = (int) model.getAttribute("updateIdx");
		Player player = null;
		if(model.getAttribute("updateIdx") == null) {
//			player = playerService.searchPId(searchId);
		}
		
		return "";
	}
	
}
