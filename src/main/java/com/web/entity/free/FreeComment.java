package com.web.entity.free;

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

import com.web.entity.gong.Gong;
import com.web.entity.player.Player;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="FREECOMMENT")
@SequenceGenerator(						// 오라클 사용시
		name = "FREECOMMENT_SEQ_GENERATOR",
		sequenceName = "FREECOMMENT_SEQ",
		initialValue = 1, allocationSize = 1)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class FreeComment {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "FREECOMMENT_SEQ_GENERATOR") // 오라클 사용시
//	@GeneratedValue(strategy=GenerationType.IDENTITY)	// MySQL 사용시
	private int freeCmtIdx;
	
	private String freeCmtContent;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date freeCmtWTime = new Date();
	
	@ManyToOne
	@JoinColumn(name="freeIdx", referencedColumnName = "freeIdx")
	private Free free;
	
	@ManyToOne
	@JoinColumn(name="pIdx", referencedColumnName = "pIdx")
	private Player player;
	
}
