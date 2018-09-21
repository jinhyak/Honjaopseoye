<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%
	String s_name = null;
	String s_id = null;
	String s_pw = null;
		List<Map<String, Object>> memList = (List<Map<String, Object>>) session.getAttribute("memList");
	if (memList != null) {
		s_name = memList.get(0).get("MEM_NAME").toString();
		s_id = memList.get(0).get("MEM_ID").toString();
		s_pw = memList.get(0).get("MEM_PW").toString();
	}
%>
<html>
<head>
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	var s_name = '<%=s_name%>';
	var s_id = '<%=s_id%>'
	var s_pw = '<%=s_pw%>'
	function login() {
		//alert(s_name);
		//alert("로그인");
		var id = $("#mem_id").val()
		var pw = $("#mem_pw").val()
		
		if(id==null||id==""){
			alert("아이디를 입력해주세요.");
			$("#mem_id").focus();
			return false;
		}else if(pw==null||pw==""){
			alert("비밀번호를 입력해주세요.");
			$("#mem_pw").focus();
			return false;
		}else{
			$("#f_login").submit();
			return true;
		}
		
	}
</script>

</head>
<body>
<%@include file="../../include/include/subtop.jsp" %>

<div class="ui container" style="height:800px;margin-top:70px">
	<div style="height: 100px;"></div>
	<div align="center">
		<a href="../result/Outline.jsp" class="ui medium image">
			<img src="../../image/logo.png">
		</a>
	</div>
	<div style="height: 50px;"></div>
	<form id="f_login" name="f_login" action="../../member/empty/select.test" method="post">
		<div style="text-align: center; padding-bottom: 10px;">
			<div class="ui container">
				<div class="ui big icon input">
					<input type="text" id="mem_id" name="mem_id" placeholder="아이디" style="width: 400px; height: 50px;">
				</div>
			</div>
		</div>
		<div style="text-align: center; padding-bottom: 10px;">
			<div class="ui container">
				<div class="ui big icon input">
					<input type="text" id="mem_pw" name="mem_pw" placeholder="비밀번호" style="width: 400px; height: 50px;">
				</div>
			</div>
		</div>	
			<div style="text-align: center; padding-left: 3px; padding-top: 10px;">
				<div class="ui container">
					<div class="ui big icon input">
						<button class="ui gray button" type="button" id="btn_login" name="btn_login" onClick="login()" style="width: 400px; height: 50px;">로그인</button>
					</div>
				</div>
			</div>
	</form>
	<div style="height: 30px;"></div>
	<div class="six wide tablet eight text wide computer column" style="text-align: center; padding-bottom: 20px;">
		<div class="ui big icon input">
			<a href="../join/gaip.jsp" style="border-right: solid thin; padding-right: 7px; margin-right: 7px; margin-left: 7px">회원가입</a>
			<a href="javascript:alert('ID찾기')" style="border-right: solid thin; padding-right: 7px; margin-right: 7px;">ID찾기</a>
			<a href="javascript:alert('비번찾기')">비번찾기</a>
		</div>
	</div>
	<div class="ui container" style="text-align: center;width:222px">
		<div class="row">
			<img src="../../image/naver_Id.PNG" width="222px" style="padding-bottom: 5px;">
		</div>
		<div class="row" style="text-align: center;">
			<a id="kakao-login-btn" style="justify-content:center;"></a>
		</div>
	</div>
	<a href="http://developers.kakao.com/logout"></a>
	<script type='text/javascript'>
	//<![CDATA[
	
		Kakao.init('2e932cab0576b49285b3e1a591eb63f1');
	
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				alert(JSON.stringify(authObj));
				alert(authObj);
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
		//]]>
	</script>
</div>
	<%@include file="../../include/bottom.jsp" %>
</body>
</html>