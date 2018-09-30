<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String mem_id = request.getParameter("mem_id");
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@include file="../../include/include/commonUI.jsp" %>
</head>
<body>
<div class="ui container" style="width:800px;heigth:800px;margin-top:50px">
		<div class="ui top attached segment" style="background: rgba(0,0,0,0.1)">
		  <p><h3>최근 메시지 목록</h3></p>
		</div>
		<div class="ui attached segment pushable" style="width:100%;height:400px" id="scroll">
			<div class="ui small divided list" id="boxlist">
			
			</div>
		</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
				var param = "mem_id="+'<%=mem_id%>';
				$.ajax({
					 method:"post"
					,data:param
					,url:"../../message/empty/getmsgBox.test"
					,success:function(data){
						$("#boxlist").html(data);
					}
					,error:function(data){
						alert("실패");
					}
				})
	})
</script>
</body>
</html>