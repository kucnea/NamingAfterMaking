package com.web.entity.gong;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="GONG")
@SequenceGenerator(						// 오라클 사용시
		name = "GONG_SEQ_GENERATOR",
		sequenceName = "GONG_SEQ",
		initialValue = 1, allocationSize = 1)
public class Gong {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "GONG_SEQ_GENERATOR") // 오라클 사용시
	private int GongIdx;
	
	private int pIdx;
	private String GongTitle;
	private String GongContent;
	private int GongCnt;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date GongWTime;

	
	
	
	
	
	
	// Getter & Setter & ToString
	public int getGongIdx() {
		return GongIdx;
	}

	public void setGongIdx(int gongIdx) {
		GongIdx = gongIdx;
	}

	public int getpIdx() {
		return pIdx;
	}

	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
	}

	public String getGongTitle() {
		return GongTitle;
	}

	public void setGongTitle(String gongTitle) {
		GongTitle = gongTitle;
	}

	public String getGongContent() {
		return GongContent;
	}

	public void setGongContent(String gongContent) {
		GongContent = gongContent;
	}

	public int getGongCnt() {
		return GongCnt;
	}

	public void setGongCnt(int gongCnt) {
		GongCnt = gongCnt;
	}

	public Date getGongWTime() {
		return GongWTime;
	}

	public void setGongWTime(Date gongWTime) {
		GongWTime = gongWTime;
	}

	@Override
	public String toString() {
		return "Gong [GongIdx=" + GongIdx + ", pIdx=" + pIdx + ", GongTitle=" + GongTitle + ", GongContent="
				+ GongContent + ", GongCnt=" + GongCnt + ", GongWTime=" + GongWTime + "]";
	}
	
	
	
	
}
