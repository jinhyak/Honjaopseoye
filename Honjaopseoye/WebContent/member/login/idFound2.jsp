<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>    
<% 
   String smem_id = null;
   String smem_name = null;
   if(session.getAttribute("e_idSearch")!=null){
      List<Map<String, Object>> sid = (List<Map<String, Object>>)session.getAttribute("e_idSearch");
      smem_id = sid.get(0).get("MEM_ID").toString();
      smem_name = sid.get(0).get("MEM_NAME").toString();
   }
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <%= smem_name %>님의 아이디는 <%= smem_id %>&nbsp;입니다.
</body>
</html>