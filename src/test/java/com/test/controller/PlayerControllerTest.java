package com.test.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
//import java.awt.PageAttributes.MediaType;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.controller.player.PlayerController;
import com.web.entity.player.Player;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/servlet-context.xml","file:src/main/webapp/WEB-INF/spring/service-context.xml"})
@WebAppConfiguration
public class PlayerControllerTest {

	@Autowired
	private WebApplicationContext context;
	private MockMvc mockMvc;
	private ObjectMapper mapper;
	@Autowired PlayerController playerController;
	
	@Before
	public void setUp() {
		this.mockMvc = MockMvcBuilders.standaloneSetup(playerController).build(); // test를 위한 MockMvc 객체 생성. testController 1개만 주입.
//		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.context).build();  // test를 위한 MockMvc 객체 생성. 스프링이 로드한 WebApplicationContext의 인스턴스로 작동.(standaloneSetup() 중 택 1)
		mapper = new ObjectMapper();
    }
	
	
	@Test
	public void player() throws Exception {
		standaloneSetup(new PlayerController()).build()
		.perform(get("/player/join"))
		.andExpect(status().isOk());
	}
	
	@Test
	public void login() throws Exception {
		
//		String content = mapper.writeValueAsString(new Player("id","pass"));
//		
//		mockMvc.perform(post("/player/logedin")
//				.content(content)
//				.contentType(MediaType.APPLICATION_JSON)
//				.accept(MediaType.APPLICATION_JSON))
//				.andExpect(status().isOk())
//				.andDo(print());
		
		mockMvc.perform(post("/player/logedin")
				.contentType(MediaType.APPLICATION_JSON_VALUE)
				.content(mapper.writeValueAsString(
						new Player(
								"id",
								"pass"))))
				.andExpect(status().isOk())
				.andDo(print());
				
	}

}
