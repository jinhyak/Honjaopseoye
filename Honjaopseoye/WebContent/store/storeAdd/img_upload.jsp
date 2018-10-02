<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	 String uploadPath = request.getRealPath("/img");
	 int size = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한
	 String name="";
	 String subject="";
	 String filename="";
	 	
	 try{
	     MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"euc-kr",new DefaultFileRenamePolicy());
	 		
	     name=multi.getParameter("name");
	     subject=multi.getParameter("subject");
	 		
	     Enumeration files = multi.getFileNames();
	     String file = (String)files.nextElement();
	     filename = multi.getFilesystemName(file);
	

	 }catch(Exception e){
	     e.printStackTrace();
	 }
%>
