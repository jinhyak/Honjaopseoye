<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String s_name = null;
		List<Map<String, Object>> memList2 = (List<Map<String, Object>>) session.getAttribute("memList");
	if (session.getAttribute("memList") != null) {
		s_name = memList2.get(0).get("MEM_NAME").toString();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="../include/commonUI.jsp" %>
<title>상단</title>
<%@include file="./commonUI.jsp" %>
<title>상단</title>
<style>
</style>
</head>
<body>
<div class="ui inverted vertical masthead center aligned segment" style="position-top: fixed">
    <div class="ui container">
      <div class="ui large secondary inverted pointing menu">
        <a class="toc item">
          <i class="sidebar icon"></i>
        </a>
	        <a class="active item" href="../notice/notice.jsp">공지사항</a>
	        <a class="item" href="../notice/qna.jsp">Q&A</a>
	        <a class="item" href="#">혼밥하자</a>
	        <a class="item" href="#">인사하자</a>
	        <div class="ui grid">
	        <div class="four wide two wide large screen one wide widescreen column"></div>
	        <div class="four wide two wide large screen one wide widescreen column">
        </div>
	        <div class="four wide two wide large screen one wide widescreen column">
	        </div>
        <div class="four wide two wide large screen one wide widescreen column"></div>
       </div>
        <div class="right item">
       <!-- 나중에 컨테이너 처리 할거임 -->
       		<div class="ui text container"> 
       	  <%=s_name%>님 환영합니다.
          <a class="ui inverted button" href="javascript:logout()">로그아웃</a>
          <a class="ui inverted button" href="../member/meminfo/mlist.jsp">정보수정</a>
        	</div>
        </div>
      </div>
    </div>
    <div class="ui text container">
      <h1 class="ui inverted header">
       <br>
        <br>
         <br>
          <br>
        혼밥 혼술 입니당
      </h1>
      <br>
       <br>
    </div>
</div>
<script type="text/javascript">
	function logout(){
		$.ajax({
			 url:"../member/login/result/logout.jsp"
			,success:function(data){
				location.href="../main/main.jsp"
			}
		})
			
	}
</script>
</body>
</html>