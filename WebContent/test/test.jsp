<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="../Semantic/js/jquery-1.12.0.js"></script>
</head>
<body>
	<input type="button" value="테스트시작" id="test">
	<input type="button" value="테스트시작" id="empty">
	<input type="button" value="테스트시작" id="avg">
	<input type="button" value="테스트시작" id="update">
<script>
	$('#test').click(function(){
		location.href = "../test/sum/select.test";
	})
		$('#empty').click(function(){
		location.href = "../test/empty/select.test";
	})
		$('#avg').click(function(){
		location.href = "../test/avg/select.test";
	})
		$('#update').click(function(){
		location.href = "../test/minus/select.test";
	})
	
</script>
</body>
</html>