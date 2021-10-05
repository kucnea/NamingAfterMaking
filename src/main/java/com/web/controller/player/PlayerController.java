package com.web.controller.player;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.player.Player;

@Controller
@RequestMapping("/player/")
public class PlayerController {

//	@Autowired(required=false)
//	private PlayerService playerSerivce;
	
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpaoracle");
	
	
	@RequestMapping("login")
	public String loginPage() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "player.login";
	}
	
	@RequestMapping("join")
	public String joinPage() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "player.join";
	}
	
	@PostMapping("create")
	public String create(@ModelAttribute("player") Player player,Model model) {
		
		System.out.println("input player to join : "+player.toString());
		model.addAttribute("player",player);
		
		EntityManager em = emf.createEntityManager();
		EntityTransaction tx = em.getTransaction();
		
		try {

            tx.begin(); //트랜잭션 시작
            
            //비즈니스 로직
            em.persist(player);
            
            
            tx.commit();//트랜잭션 커밋

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback(); //트랜잭션 롤백
        } finally {
            em.close(); //엔티티 매니저 종료
        }
//		emf.close(); //엔티티 매니저 팩토리 종료
		
		
		return "player.joinComplete";
	}

	
	@RequestMapping("appointment")
	public String appointment() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "player.memberAppointment";
	}
}
