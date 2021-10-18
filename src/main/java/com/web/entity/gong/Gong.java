package com.web.entity.gong;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.web.entity.player.Player;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="GONG")
@SequenceGenerator(						// 오라클 사용시
		name = "GONG_SEQ_GENERATOR",
		sequenceName = "GONG_SEQ",
		initialValue = 1, allocationSize = 1)
@NoArgsConstructor
@Getter
@Setter
@ToString
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

	//연관관계
	@ManyToOne
//	@MapsId("pIdx")
	private Player player;
	
	
	
	
	
}



