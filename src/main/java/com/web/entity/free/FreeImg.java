package com.web.entity.free;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.web.entity.gong.Gong;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="FREEIMG")
@SequenceGenerator(						// 오라클 사용시
		name = "FREEIMG_SEQ_GENERATOR",
		sequenceName = "FREEIMG_SEQ",
		initialValue = 1, allocationSize = 1)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class FreeImg {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "FREEIMG_SEQ_GENERATOR") // 오라클 사용시
//	@GeneratedValue(strategy=GenerationType.IDENTITY)	// MySQL 사용시
	private int freeImgIdx;

	private String freeFileOriName;
	private String freeFileUseName;
	private String freeFilePath;
	private Long freeFileSize;
	
	@ManyToOne
	@JoinColumn(name="freeIdx", referencedColumnName = "freeIdx")
	private Free free;
}
