package com.web.entity.free;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
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
@Table(name="FREE")
@SequenceGenerator(						// 오라클 사용시
		name = "FREE_SEQ_GENERATOR",
		sequenceName = "FREE_SEQ",
		initialValue = 1, allocationSize = 1)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Free {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "FREE_SEQ_GENERATOR") // 오라클 사용시
//	@GeneratedValue(strategy=GenerationType.IDENTITY)	// MySQL 사용시
//	@EmbeddedId									//이거는 시퀀스 자동증가를 사용할 수 없음.
	private int freeIdx;
	
	private String freeTitle;
	@Lob
	private String freeContent;
	private int freeCnt = 0;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date freeWTime = new Date();
	
	@ManyToOne
	@JoinColumn(name="pIdx", referencedColumnName = "pIdx") // 추가하면 컬럼하나가 더 적게 join할 수 있대서 했는데 결과가 동일..
	private Player player;	
	
	@OneToMany(mappedBy = "free", fetch = FetchType.EAGER, cascade=CascadeType.REMOVE)
	private Set<FreeComment> freeComment;
	
	@OneToMany(mappedBy = "free", fetch = FetchType.EAGER, cascade=CascadeType.REMOVE)
	private Set<FreeImg> freeImg;
	
	
}
