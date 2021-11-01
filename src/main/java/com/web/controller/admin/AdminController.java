package com.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@RequestMapping("adminpage")
	public String adminPage(Model model) {
	
		return "admin.adminPage";
	}
	
}
