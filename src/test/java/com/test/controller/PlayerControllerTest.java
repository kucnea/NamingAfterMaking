package com.test.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

import org.junit.Test;

import com.web.controller.player.PlayerController;

public class PlayerControllerTest {

	
	@Test
	public void player() throws Exception {
		standaloneSetup(new PlayerController()).build()
		.perform(get("/player/join"))
		.andExpect(status().isOk());
	}

}
