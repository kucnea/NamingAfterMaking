package com.web.util.excel;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.web.servlet.view.AbstractView;

public class ExcelDownloadView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		Locale locale = (Locale) model.get("locale");
		String workBookName = (String) model.get("workBookName");
		
		//이름 중복 방지
		Date date = new Date();
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyyMMdd", locale);
		SimpleDateFormat hourFormat = new SimpleDateFormat("hhmmss", locale);
		
		String day = dayFormat.format(date);
		String hour = hourFormat.format(date);
		
		String fileName = workBookName + "_" + day + "_" + hour + ".xlsx";
		
		
		//브라우저 별 파일이름 인코딩
		String browser = request.getHeader("User-Agent");
		if(browser.indexOf("MSIE") > -1) {
			fileName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+","%20");
		}else if(browser.indexOf("Trident") > -1) {
			fileName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+","%20");
		}else if(browser.indexOf("Firefox") > -1) {
			fileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
		}else if(browser.indexOf("Opera") > -1) {
			fileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
		}else if(browser.indexOf("Chrome") > -1) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < fileName.length(); i++) {
				char c = fileName.charAt(i);
				if(c > '~') {
					sb.append(URLEncoder.encode(""+c,"URF-8"));
				}else {
					sb.append(c);
				}
			}
			fileName = sb.toString();
		}else if(browser.indexOf("Safari") > -1) {
			fileName = "\"" + new String(fileName.getBytes("UTF-8"),"8859_1") + "\"";
		}else {
			fileName = "\"" + new String(fileName.getBytes("UTF-8"),"8859_1") + "\"";
		}
		
		response.setContentType("application/download;charset=utf-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream os = null;
		SXSSFWorkbook workBook = null;
		
		try {
			workBook = (SXSSFWorkbook) model.get("workBook");
			os = response.getOutputStream();
			
			//파일 생성
			workBook.write(os);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(workBook != null) {
				try {
					workBook.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			
			if(os != null) {
				try {
					os.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			
		}
		
	}

}
