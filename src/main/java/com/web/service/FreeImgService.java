package com.web.service;

import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.entity.free.Free;
import com.web.entity.free.FreeImg;
import com.web.repository.FreeImgRepository;

@Service
@Transactional(rollbackFor = Exception.class)
public class FreeImgService {

	@Autowired FreeImgRepository freeImgRepository;
	
public void save(FreeImg freeImg,Free free) {
		
		freeImg.setFree(free);
		freeImgRepository.save(freeImg);
		
	}
	
	public void update(FreeImg freeImg, Free free) {
		free.getFreeImg().iterator().next().getFreeFileOriName();

		Iterator<FreeImg> i = free.getFreeImg().iterator();
		freeImg.setFreeImgIdx(i.next().getFreeImgIdx());
		
		FreeImg update = freeImgRepository.findOne(freeImg.getFreeImgIdx());

		
		update.setFreeFileOriName(freeImg.getFreeFileOriName());
		update.setFreeFileUseName(freeImg.getFreeFileUseName());
		update.setFreeFilePath(freeImg.getFreeFilePath());
		update.setFreeFileSize(freeImg.getFreeFileSize());
		freeImgRepository.save(update);
	}
	
}
