package com.web.entity.player;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.web.entity.gong.Gong;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="PLAYER")
@SequenceGenerator(						// 오라클 사용시
		name = "PLAYER_SEQ_GENERATOR",
		sequenceName = "PLAYER_SEQ",
		initialValue = 1, allocationSize = 1)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Player {
	
	//jpa에게 테이블 자동생성하는건 책 124p,145p를 참고하자.
	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)  // MYSQL 사용시
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PLAYER_SEQ_GENERATOR") // 오라클 사용시
	private int pIdx;
	
	@Column(nullable = false, length = 16)
	private String pId;
	
	@Column(name = "pNick", nullable = false, length = 16)
	private String pNick;
	
	@Column(nullable = false, length = 16)
	private String pPw;

	private int pLv = 1;
	private String pClass;
	private float pHp = 12;
	private float pMp = 15;
	private float pAtk = 3;
	private int pAtkElm;
	private float pDef = 1;
	private int pDefElm;
	private int pLuck = 7;
	private int pSpd = 1;
	private int pLocation;
	private int pEHelmet;
	private int pEArmor;
	private int pEWeapon;
	private int pEGloves;
	private int pEShoes;
	private float pGold;
	private int pLegendaryPoint;
	private float pPVPWin;
	private float pPVPLose;
	private int pStatus = 0;
	
	@Column(length = 1)
	private int pAgree;

	
	//연관관계
//	@OneToMany(cascade = CascadeType.ALL,
//				mappedBy = "player")
	@OneToMany(mappedBy = "player")
	private List<Gong> gong;
	
	
	public Player(String pId, String pPw) { 	// test를 위한 생성자
		this.pId = pId;
		this.pPw = pPw;
	}
	
	
	
	
	
	
}
