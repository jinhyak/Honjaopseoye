<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@include file="../../include/include/commonUI.jsp" %>
<title>Insert title here</title>
</head>
<body>
<div class="ui center aligned container" style="width:800px;heigth:800px;top-margin:200px">
	<table class="ui table" style="width:100%;height:100%">
		<thead>
		 <tr>
			<td>
				<h3>채팅하기</h3>
			</td>		 
		 </tr>
		</thead>
		<tbody id = "msg_form" style="width:500px;heigth:800px;">
		 <tr>
		 	<td>
		 	</td>
		 </tr>
		</tbody>
		<tfoot>
			<tr>
  			  <td>
			 	<div class="ui form">
				  <div class="field">
				    <label>메시지 보내기</label>
				    <textarea rows="2"></textarea>
				  </div>
			 	</div>
			  </td>
			</tr>
		
		</tfoot>
	</table>
</div>
</body>
</html>