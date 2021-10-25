package com.web.service;

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
	
	
	



}
