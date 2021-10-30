package com.web.entity.gong;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
@Table(name="GONGCOMMENT")
//@SequenceGenerator(						// 오라클 사용시
//		name = "GONGCOMMENT_SEQ_GENERATOR",
//		sequenceName = "GONGCOMMENT_SEQ",
//		initialValue = 1, allocationSize = 1)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class GongComment {

	
	@Id
//	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "GONGCOMMENT_SEQ_GENERATOR") // 오라클 사용시
	@GeneratedValue(strategy=GenerationType.IDENTITY)	// MySQL 사용시
	private int gongCmtIdx;
	
	private String gongCmtContent;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date gongCmtWTime = new Date();
	
	@ManyToOne
	@JoinColumn(name="gongIdx", referencedColumnName = "gongIdx")
	private Gong gong;
	
	@ManyToOne
	@JoinColumn(name="pIdx", referencedColumnName = "pIdx")
	private Player player;
	
}
