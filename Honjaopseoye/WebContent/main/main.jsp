<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>	
<%
	String smem_name = null;
		List<Map<String, Object>> memList = (List<Map<String, Object>>) session.getAttribute("memList");
	if ((List<Map<String, Object>>)memList != null) {
		smem_name = memList.get(0).get("MEM_NAME").toString();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>메인</title>
</head>
<body>
		<% 
			if(smem_name==null || smem_name==""){
		%>	
			<%@ include file="../include/logout_top.jsp" %>
		<% 	
			}else if(smem_name!=null || smem_name!=""){
		%>
			<%@ include file="../include/top.jsp" %>
		<% 	
			}
		%>


<!--  -->

  <button id="btn1" style="width:910px; height:900px;"><img src="./1.png" style="width:950px; height:900px;"></button>
  <button type="button" id="btn2" style="width:910px; height:900px;"><img src="./2.jpg"style="width:950px; height:900px;"></button>

<!--  -->

<%@ include file="../../include/bottom.jsp" %>
</body>
</html>