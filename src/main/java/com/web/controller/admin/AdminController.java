package com.web.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String playerSearch(Model model) {
		
		String searchId = (String) model.getAttribute("searchId");
		
		if(searchId != null) {
			Player player = playerService.searchPId(searchId);
			if(player != null) {
				model.addAttribute("searchP");
			}
		}
		
		return "redirect:adminPage";
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
