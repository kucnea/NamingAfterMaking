package com.web.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.web.entity.location.Location;

@Service
@Transactional(rollbackFor = Exception.class)
public class LocationService {

	public List<Location> makeLocationList(String[] locName, int[] locChar, int[] locFront, int[] locBack) {
		
		ArrayList<Location> list = new ArrayList<Location>();
		for (int i = 0; i < locName.length; i++) {
			
			Location location = new Location(i, locName[i], locChar[i], locFront[i], locBack[i]);
			list.add(location);
			
		}
		
		return list;
	}

	public SXSSFWorkbook makeSimpleLocationExcelWorkbook(List<Location> list) {
		
		SXSSFWorkbook workBook = new SXSSFWorkbook();
		
		//시트생성
		SXSSFSheet sheet = workBook.createSheet("Location");
		
		//시트 열 너비 설정
		sheet.setColumnWidth(0, 1500);
		sheet.setColumnWidth(0, 4500);
		sheet.setColumnWidth(0, 1500);
		sheet.setColumnWidth(0, 1500);
		sheet.setColumnWidth(0, 1500);
		
		//헤더 행 생성
		Row headerRow = sheet.createRow(0);
		//해당 행의 첫번째 열 셀 생성
		Cell headerCell = headerRow.createCell(0);
		headerCell.setCellValue("locIdx");
		//해당 행의 두번째 열 셀 생성
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("locName");
		//해당 행의 세번째 열 생성
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("locChar");
		//네번째
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("locFront");
		//다섯번째
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("locBack");
		
		// 표 내용 행 및 셀 생성
		Row bodyRow = null;
		Cell bodyCell = null;
		for (int i = 0; i < list.size(); i++) {
			Location location = list.get(i);
			
			//행 생성
			bodyRow = sheet.createRow(i+1);
			//locIdx 표시
			bodyCell = bodyRow.createCell(0);
			bodyCell.setCellValue(location.getLocIdx());
			//locName 표시
			bodyCell = bodyRow.createCell(1);
			bodyCell.setCellValue(location.getLocName());
			//locChar 표시
			bodyCell = bodyRow.createCell(2);
			bodyCell.setCellValue(location.getLocChar());
			//locFront
			bodyCell = bodyRow.createCell(3);
			bodyCell.setCellValue(location.getLocFront());
			//locBack
			bodyCell = bodyRow.createCell(4);
			bodyCell.setCellValue(location.getLocBack());
			
		}
		
		return workBook;
		
	}
	
	public SXSSFWorkbook excelFileDownloadProcess(List<Location> list) {
		return makeSimpleLocationExcelWorkbook(list);
	}

	
	
	public List<Location> uploadExcelFile(MultipartFile excelfile) {
		
		List<Location> list = new ArrayList<Location>();
		
		try {
			OPCPackage opcPackage = OPCPackage.open(excelfile.getInputStream());
			XSSFWorkbook workBook = new XSSFWorkbook(opcPackage);
			
			//첫번째 시트 불러오기
			XSSFSheet sheet = workBook.getSheetAt(0);
			
			for (int i = 0; i < sheet.getLastRowNum()+1; i++) {
				Location location = new Location();
				XSSFRow row = sheet.getRow(i);
				
				//행이 존재하지 않으면 패스
				if(row == null) continue;
				
				//첫번째 열 받아오기
				XSSFCell cell = row.getCell(0);
				if(cell != null) location.setLocIdx((int) cell.getNumericCellValue());
				//두번째 열
				cell = row.getCell(1);
				if(cell != null) location.setLocName(cell.getStringCellValue());
				//
				cell = row.getCell(2);
				if(cell != null) location.setLocChar((int) cell.getNumericCellValue());
				//
				cell = row.getCell(3);
				if(cell != null) location.setLocFront((int) cell.getNumericCellValue());
				//
				cell = row.getCell(4);
				if(cell != null) location.setLocBack((int) cell.getNumericCellValue());
				
				list.add(location);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
