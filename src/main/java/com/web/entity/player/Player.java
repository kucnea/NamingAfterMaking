package com.web.entity.player;

import javax.persistence.*;

import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name="Player")
@SequenceGenerator(						// 오라클 사용시
		name = "Player_SEQ_GENERATOR",
		sequenceName = "Player_SEQ",
		initialValue = 1, allocationSize = 1)
public class Player {
	
	//jpa에게 테이블 자동생성하는건 책 124p,145p를 참고하자.
	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)  // MYSQL 사용시
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Player_SEQ_GENERATOR") // 오라클 사용시
	private int pIdx;
	
	@Column(nullable = false, length = 16)
	private String pId;
	
	@Column(nullable = false, length = 16)
	private String pNick;
	
	@Column(nullable = false, length = 16)
	private String pPw;

	private Integer pLv = 1;
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
	private int pStatus;
	
	@Column(length = 1)
	private int pAgree;
	
	
	
	
	
	
	
	public int getpIdx() {
		return pIdx;
	}
	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getpNick() {
		return pNick;
	}
	public void setpNick(String pNick) {
		this.pNick = pNick;
	}
	public String getpPw() {
		return pPw;
	}
	public void setpPw(String pPw) {
		this.pPw = pPw;
	}
	public int getpLv() {
		return pLv;
	}
	public void setpLv(int pLv) {
		this.pLv = pLv;
	}
	public String getpClass() {
		return pClass;
	}
	public void setpClass(String pClass) {
		this.pClass = pClass;
	}
	public float getpHp() {
		return pHp;
	}
	public void setpHp(float pHp) {
		this.pHp = pHp;
	}
	public float getpMp() {
		return pMp;
	}
	public void setpMp(float pMp) {
		this.pMp = pMp;
	}
	public float getpAtk() {
		return pAtk;
	}
	public void setpAtk(float pAtk) {
		this.pAtk = pAtk;
	}
	public int getpAtkElm() {
		return pAtkElm;
	}
	public void setpAtkElm(int pAtkElm) {
		this.pAtkElm = pAtkElm;
	}
	public float getpDef() {
		return pDef;
	}
	public void setpDef(float pDef) {
		this.pDef = pDef;
	}
	public int getpDefElm() {
		return pDefElm;
	}
	public void setpDefElm(int pDefElm) {
		this.pDefElm = pDefElm;
	}
	public int getpLuck() {
		return pLuck;
	}
	public void setpLuck(int pLuck) {
		this.pLuck = pLuck;
	}
	public int getpSpd() {
		return pSpd;
	}
	public void setpSpd(int pSpd) {
		this.pSpd = pSpd;
	}
	public int getpLocation() {
		return pLocation;
	}
	public void setpLocation(int pLocation) {
		this.pLocation = pLocation;
	}
	public int getpEHelmet() {
		return pEHelmet;
	}
	public void setpEHelmet(int pEHelmet) {
		this.pEHelmet = pEHelmet;
	}
	public int getpEArmor() {
		return pEArmor;
	}
	public void setpEArmor(int pEArmor) {
		this.pEArmor = pEArmor;
	}
	public int getpEWeapon() {
		return pEWeapon;
	}
	public void setpEWeapon(int pEWeapon) {
		this.pEWeapon = pEWeapon;
	}
	public int getpEGloves() {
		return pEGloves;
	}
	public void setpEGloves(int pEGloves) {
		this.pEGloves = pEGloves;
	}
	public int getpEShoes() {
		return pEShoes;
	}
	public void setpEShoes(int pEShoes) {
		this.pEShoes = pEShoes;
	}
	public float getpGold() {
		return pGold;
	}
	public void setpGold(float pGold) {
		this.pGold = pGold;
	}
	public int getpLegendaryPoint() {
		return pLegendaryPoint;
	}
	public void setpLegendaryPoint(int pLegendaryPoint) {
		this.pLegendaryPoint = pLegendaryPoint;
	}
	public float getpPVPWin() {
		return pPVPWin;
	}
	public void setpPVPWin(float pPVPWin) {
		this.pPVPWin = pPVPWin;
	}
	public float getpPVPLose() {
		return pPVPLose;
	}
	public void setpPVPLose(float pPVPLose) {
		this.pPVPLose = pPVPLose;
	}
	public int getpStatus() {
		return pStatus;
	}
	public void setpStatus(int pStatus) {
		this.pStatus = pStatus;
	}
	public int getpAgree() {
		return pAgree;
	}
	public void setpAgree(int pAgree) {
		this.pAgree = pAgree;
	}
	@Override
	public String toString() {
		return "Player [pIdx=" + pIdx + ", pId=" + pId + ", pNick=" + pNick + ", pPw=" + pPw + ", pLv=" + pLv
				+ ", pClass=" + pClass + ", pHp=" + pHp + ", pMp=" + pMp + ", pAtk=" + pAtk + ", pAtkElm=" + pAtkElm
				+ ", pDef=" + pDef + ", pDefElm=" + pDefElm + ", pLuck=" + pLuck + ", pSpd=" + pSpd + ", pLocation="
				+ pLocation + ", pEHelmet=" + pEHelmet + ", pEArmor=" + pEArmor + ", pEWeapon=" + pEWeapon
				+ ", pEGloves=" + pEGloves + ", pEShoes=" + pEShoes + ", pGold=" + pGold + ", pLegendaryPoint="
				+ pLegendaryPoint + ", pPVPWin=" + pPVPWin + ", pPVPLose=" + pPVPLose + ", pStatus=" + pStatus
				+ ", pAgree=" + pAgree + "]";
	}
	
	
	
}