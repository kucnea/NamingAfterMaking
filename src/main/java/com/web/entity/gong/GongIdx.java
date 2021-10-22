package com.web.entity.gong;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import lombok.EqualsAndHashCode;

@EqualsAndHashCode
@Embeddable
public class GongIdx implements Serializable{
	
	private int pIdx;
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "GONG_SEQ_GENERATOR")
	private int gongIdx;
}
