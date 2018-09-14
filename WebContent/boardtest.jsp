<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="./Semantic/js/jquery-1.12.0.js"></script>
<title>글문단</title>
</head>
<body>
<table id="tb"></table>
<script type="text/javascript" >
	$("#tb").datagrid(function({
		 url:"../board/empty/insert.test"
		,
	});
	
</script>
</body>
</html>