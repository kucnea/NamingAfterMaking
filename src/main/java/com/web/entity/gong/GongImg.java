package com.web.entity.gong;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="GONGIMG")
@SequenceGenerator(						// 오라클 사용시
		name = "GONGIMG_SEQ_GENERATOR",
		sequenceName = "GONGIMG_SEQ",
		initialValue = 1, allocationSize = 1)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class GongImg {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "GONGIMG_SEQ_GENERATOR") // 오라클 사용시
//	@GeneratedValue(strategy=GenerationType.IDENTITY)	// MySQL 사용시
	private int gongImgIdx;
	
	private String fileOriName;
	private String fileUseName;
	private String filePath;
	private Long fileSize;
	
	@ManyToOne
	@JoinColumn(name="gongIdx", referencedColumnName = "gongIdx")
	private Gong gong;
}
