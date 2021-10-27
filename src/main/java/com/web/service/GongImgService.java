package com.web.service;

import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.gong.Gong;
import com.web.entity.gong.GongImg;
import com.web.repository.GongImgRepository;

@Service
@Transactional(rollbackFor = Exception.class)
public class GongImgService {

	@Autowired GongImgRepository gongImgRepository;

	public void save(GongImg gongImg,Gong gong) {
		
		gongImg.setGong(gong);
		gongImgRepository.save(gongImg);
		
	}
	
	public void update(GongImg gongImg, Gong gong) {
		// 원래 사용하던 코드
//		gongImg.setGongImgIdx(gong.getGongImg().get(0).getGongImgIdx());
		gong.getGongImg().iterator().next().getFileOriName();
		// Set으로 변경 후 사용해보는 코드
		Iterator<GongImg> i = gong.getGongImg().iterator();
		gongImg.setGongImgIdx(i.next().getGongImgIdx());
		
		GongImg update = gongImgRepository.findOne(gongImg.getGongImgIdx());

//		System.out.println("GongImgService update stage");
//		System.out.println("gongImg.getFileOriName() : "+gongImg.getFileOriName());
//		System.out.println("gongImg.getFileUseName() : "+gongImg.getFileUseName());
//		System.out.println("gongImg.getFilePath() : "+gongImg.getFilePath());
//		System.out.println("gongImg.getFileSize() : "+gongImg.getFileSize());
//		System.out.println("update : "+update);
//		삽질의 흔적..
		
		update.setFileOriName(gongImg.getFileOriName());
		update.setFileUseName(gongImg.getFileUseName());
		update.setFilePath(gongImg.getFilePath());
		update.setFileSize(gongImg.getFileSize());
		gongImgRepository.save(update);
	}
	
	
	



}
