<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	List<Map<String,Object>> list = (List<Map<String,Object>>)request.getAttribute("list");
	if(list!=null&&list.size()!=0){
		for(int i = 0 ; i<list.size();i++){
		}
	}
%>