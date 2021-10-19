package com.web.entity.gong;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.web.entity.player.Player;

import lombok.EqualsAndHashCode;
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

//	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "GONG_SEQ_GENERATOR") // 오라클 사용시
	@EmbeddedId
	private GongIdx gongIdx;
	
	private String GongTitle;
	private String GongContent;
	private int GongCnt;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date GongWTime;

	//연관관계
	@ManyToOne
	@MapsId("pIdx")
	@JoinColumn(name="pIdx", referencedColumnName = "pIdx") // 추가하면 컬럼하나가 더 적게 join할 수 있대서 했는데 결과가 동일..
	private Player player;									// referencedColumnName을 정해야 정확하게 maaping이 되고,
															// 그래야 여러컬럼을 join해도 순서가 맞게 될 수 있음.
//	@EqualsAndHashCode	//예제는 여기에 동일하게 넣던데 왜 안되지
//	@Embeddable
//	public static class GongIdx implements Serializable{
//
//		private int pIdx;
//		private int gongIdx;
//	}
}


