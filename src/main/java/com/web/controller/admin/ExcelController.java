package com.web.controller.admin;

import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.entity.location.Location;
import com.web.service.LocationService;

@Controller
@RequestMapping("/excel/")
public class ExcelController {

	@Autowired LocationService locationService;
	
	@PostMapping("downloadexcelfile")
	public String downloadExcelFile(Model model) {
	
		List<Location> list = locationService.findAll();
		
		if(list!=null) {
			String[] locName = new String[list.size()];
			int[] locChar = new int[list.size()];
			int[] locFront = new int[list.size()];
			int[] locBack = new int[list.size()];
			
			for (int i = 0; i < list.size(); i++) {
				locName[i] = list.get(i).getLocName();
				locChar[i] = list.get(i).getLocChar();
				locFront[i] = list.get(i).getLocFront();
				locBack[i] = list.get(i).getLocBack();
			}
			
			list = locationService.makeLocationList(locName, locChar, locFront, locBack);
			
			SXSSFWorkbook workBook = locationService.excelFileDownloadProcess(list); 
			
			model.addAttribute("locale",Locale.KOREA);
			model.addAttribute("workBook",workBook);
			
			return "excelDownloadView";
		}else {
			String[] locName = {"이 것은", "LocationDB가 없을때", "나오는", "예시입니다."};
			int[] locChar = {1, 1, 2, 2};
			int[] locFront = {1, 2, 3, 3};
			int[] locBack = {0, 0, 1, 2};
			
			list = locationService.makeLocationList(locName, locChar, locFront, locBack);
			
			SXSSFWorkbook workBook = locationService.excelFileDownloadProcess(list); 
			
			model.addAttribute("locale",Locale.KOREA);
			model.addAttribute("workBook",workBook);
			
			return "excelDownloadView";
		}
		
	}
	
	@PostMapping("uploadexcelfile")
	public String uploadExcelFile(MultipartHttpServletRequest request, Model model) {
		
		MultipartFile file = null;
		Iterator<String> iterator = request.getFileNames();

		if(iterator.hasNext()) {
			file = request.getFile(iterator.next());
		}
		
		List<Location> list = locationService.uploadExcelFile(file);
		
		for (int i = 0; i < list.size(); i++) {
			Location location = list.get(i);
			locationService.update(location);
		}
		
		model.addAttribute("list", list);
		
		return "jsonView";
	}
	
	
	
}
