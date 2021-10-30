package com.web.entity.gong;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
//@SequenceGenerator(						// 오라클 사용시
//		name = "GONG_SEQ_GENERATOR",
//		sequenceName = "GONG_SEQ",
//		initialValue = 1, allocationSize = 1)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Gong {

	@Id
//	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "GONG_SEQ_GENERATOR") // 오라클 사용시
	@GeneratedValue(strategy=GenerationType.IDENTITY)	// MySQL 사용시
//	@EmbeddedId									//이거는 시퀀스 자동증가를 사용할 수 없음.
	private int gongIdx;
	
	private String gongTitle;
	private String gongContent;
	private int gongCnt = 0;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date gongWTime = new Date();

	
	//연관관계
	@ManyToOne
//	@MapsId("pIdx")
	@JoinColumn(name="pIdx", referencedColumnName = "pIdx") // 추가하면 컬럼하나가 더 적게 join할 수 있대서 했는데 결과가 동일..
	private Player player;									// referencedColumnName을 정해야 정확하게 maaping이 되고,
															// 그래야 여러컬럼을 join해도 순서가 맞게 될 수 있음.
	
	@OneToMany(mappedBy = "gong", fetch = FetchType.EAGER, cascade=CascadeType.REMOVE)
	private Set<GongComment> gongComment;
	
	@OneToMany(mappedBy = "gong", fetch = FetchType.EAGER, cascade=CascadeType.REMOVE)
	private Set<GongImg> gongImg;
	
//	public void setPlayer(Player player) {
//		this.player = player;
//	}
//	@EqualsAndHashCode	//예제는 여기에 동일하게 넣던데 왜 안되지
//	@Embeddable
//	public static class GongIdx implements Serializable{
//
//		private int pIdx;
//		private int gongIdx;
//	}
}


