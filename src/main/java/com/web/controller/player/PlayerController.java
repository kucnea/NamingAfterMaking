package com.web.controller.player;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.entity.player.Player;


@Controller
@RequestMapping("/player/")
public class PlayerController {

	
	
	
	//엔티티 팩토리 싱글톤
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpaoracle");

	
	
	
	
	
	@RequestMapping("login")
	public String loginPage() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "player.login";
	}
	
	
	
	@PostMapping("logedin")
	public String logedIn(@ModelAttribute("player") Player player,Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.setAttribute("pId", player.getpId());
		
		System.out.println("logedin Player stage // pId : "+player.getpId()+", pPw : "+player.getpPw());
		
		
		EntityManager em = emf.createEntityManager();
		EntityTransaction tx = em.getTransaction();

		
		
		int flag = 0;	// 1 로그인 성공, 2 실패
		try {

            tx.begin(); //트랜잭션 시작
            
            //비즈니스 로직
//            Player searchPlayer = em.find(Player.class, pId);
//            if(searchPlayer != null) {
//            	if(pPw.equals(searchPlayer.getpPw())) {
//            		
//            		session.setAttribute("player", searchPlayer);
//            		model.addAttribute("msg",searchPlayer.getpNick()+"용사와 함께 해주세요!");
//            		flag = 1;
//            	}else {
//            		
//            		model.addAttribute("msg","아이디와 비밀번호를 확인해주세요.");
//            		
//            		flag = 2;
//            	}
//            }else {
//            	model.addAttribute("msg","아이디와 비밀번호를 확인해주세요.");
//            	flag = 2;
//            }
//            Player player = em.           
            
            
            
            
            tx.commit();//트랜잭션 커밋

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback(); //트랜잭션 롤백
        } finally {
            em.close(); //엔티티 매니저 종료
        }
		
		if(flag==1) return "error.unknown";
		else if(flag==2) return "error.404";
		return "player.logedin";
	}
	
	@RequestMapping("join")
	public String joinPage() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "player.join";
	}
	
	@PostMapping("create")
	public String create(@ModelAttribute("player") Player player,Model model) {
		
		System.out.println("insert Player stage : "+player.toString());
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
