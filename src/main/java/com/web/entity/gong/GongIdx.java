package com.web.entity.gong;

import java.io.Serializable;

import javax.persistence.Embeddable;

import lombok.EqualsAndHashCode;

@EqualsAndHashCode
@Embeddable
public class GongIdx implements Serializable{
	
	private int pIdx;
	private int gongIdx;
}
