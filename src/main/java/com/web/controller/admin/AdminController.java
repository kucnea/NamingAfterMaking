package com.web.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String playerUpdaute(
			@ModelAttribute("player") @Nullable Player player,
			Model model) {
		
		if(player != null) {
			System.out.println("playerUpdate stage : "+player.getPId());
			Player updatePlayer = playerService.updateProfile(player);
			model.addAttribute("player1", updatePlayer);
		}
		
		return "admin.adminPage";
	}
	
}
