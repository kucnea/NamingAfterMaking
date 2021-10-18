package com.test.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;

import com.web.controller.player.PlayerController;
import com.web.entity.player.Player;

@RunWith(MockitoJUnitRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/servlet-context.xml","file:src/main/webapp/WEB-INF/spring/service-context.xml"})
@WebAppConfiguration
public class PlayerControllerTest {

	private MockMvc mockMvc;
	
	@Mock private Player player;
	
	@InjectMocks private PlayerController playerController;
	
	@Before
	public void setUp() {
		this.mockMvc = standaloneSetup(playerController).build();
    }
	
	
	@Test
	public void player() throws Exception {
		standaloneSetup(new PlayerController()).build()
		.perform(get("/player/join"))
		.andExpect(status().isOk());
	}
	
//	@Test
//	public void login() throws Exception {
//		
//		this.mockMvc.perform(
//				post("/player/logedin")
//					.param("pId", "id")
//					.param("pPw", "pass")
//				).andExpect(status().isOk());
//				
//	}

	@Test
	public void create() throws Exception {
		
		this.mockMvc .perform(
				post("/player/create")
					.param("pId", "id")
					.param("pName", "name")
					.param("pPw", "pass")
					.param("pAgree", "1")
				).andExpect(status().isOk());
	}
}
 