package com.web.entity.item;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="ITEM")
//@SequenceGenerator(						// 오라클 사용시
//		name = "LOCATION_SEQ_GENERATOR",
//		sequenceName = "LOCATION_SEQ",
//		initialValue = 1, allocationSize = 1)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Item {
	
	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)  // MYSQL 사용시
//	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "LOCATION_SEQ_GENERATOR") // 오라클 사용시
	private int itemIdx;
	
	private String itemName;
	private int itemPrice;
	private int itemKind;
	
	private int itemAtk;
	private int itemDef;
	private int itemSPd;
	private int itemLuck;
	private int itemElm;
	private int itemLeg;
	
}
