<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    

<!DOCTYPE html>
<html>

    <!-- --------------------------- <header> --------------------------------------- -->
    
	<tiles:insertAttribute name="header"/>

    <!-- --------------------------- <body> --------------------------------------- -->
    
	<tiles:insertAttribute name="body"/>
	
    <!-- ------------------- <footer> --------------------------------------- -->
    
    <!-- 테스트용 -->
	<tiles:insertAttribute name="footer"/>

</html>