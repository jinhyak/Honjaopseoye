<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>  
<%@ include file="../../include/include/commonUI.jsp"%>
<% 
   String smem_id = null;
   String smem_name = null;
   if(session.getAttribute("idSearch")!=null){
      List<Map<String, Object>> sid = (List<Map<String, Object>>)session.getAttribute("idSearch");
      smem_id = sid.get(0).get("MEM_ID").toString();
      smem_name = sid.get(0).get("MEM_NAME").toString();
   }
%>       
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function btn_login(){
		location.href="./login.jsp";
	}
</script>
<script type="text/javascript">
	function btn_pwSearch(){
		location.href="./pwSearch.jsp"
	}
</script>
<title>Insert title here</title>
</head>
<body>
         <div class="column" style="width: 100%; height:100%; justify-content: center; margin-top: 100px">
            <div class="ui field" style="justify-content:center">
              
                  <div class="ui center aligned one column grid">
                     <div class="center aligned column">
                        <div class="ui segment">
                           <div class="ui large header"><font size="6">아이디 확인</font><p>
                           <hr style="width:1000px; vertical-align:middle; align-content:center" color="dddddd">
                           <p>
                           	<h3 style="padding-top:5px">입력하신 정보와 일치하는 아이디는 다음과 같습니다.</h3>
                           </div>
                        </div>
                     </div>
                     <div class="center aligned column" style="height:25%; vertical-align:middle;">
                        <div class="ui segment" style="width: 100%; padding-top:30px;">
                          	<font size="6"> <%= smem_name %>님의 아이디는&nbsp;&nbsp;<font size="10" face="arial" color="#f7786b"><%= smem_id %>&nbsp;</font>입니다.</font>
                        <div style="margin-top:50px;">
                        	 <button class="ui gray button" onClick="btn_login()" style="width:250px; height:50px" onClick="btn_find()">로그인</button>
                        	 <button class="ui gray button" onClick="btn_pwSearch()" style="width:250px; height:50px" onClick="btn_find()">비밀번호찾기</button>
                        </div>
                        </div>
                     </div>
                  </div>
               
            </div>
         </div>
</body>
</html>