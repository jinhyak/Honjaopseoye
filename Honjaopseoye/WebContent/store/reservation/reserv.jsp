<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>예약조회</title>
</head>
<body>
<%@ include file="../../include/include/subtop.jsp" %>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui header" style="margin-left: 150px;margin-right: 150px; margin-top: 100px;margin-bottom: 100px">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="ui field">
			<div class="ui stackable column grid">
				<div class="ui column">
					<div class="ui segment">
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 말머리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<table class="ui selectable celled table">
						  <thead>
						    <tr>
							    <th>예약번호</th>
							    <th>그룹번호</th>
							    <th>방제목</th>
							    <th>가게이름</th>
							    <th>가게주소</th>
							    <th>전화번호</th>
							    <th>예약인원</th>
							    <th>예약날짜</th>
							    <th>예약시간</th>
							    <th>비고</th>
						  	</tr>
						  </thead>
						  <tbody>
						    <tr>
						      <td data-label="Name">James</td>
						      <td data-label="Age">24</td>
						      <td data-label="Job">Engineer</td>
						      <td data-label="Job">Engineer</td>
						      <td data-label="Job">Engineer</td>
						      <td data-label="Job">Engineer</td>
						      <td data-label="Job">Engineer</td>
						      <td data-label="Job">Engineer</td>
						      <td data-label="Job">Engineer</td>
						      <td data-label="Job">Engineer</td>
						    </tr>
						  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
</div>

<%@ include file="../../include/bottom.jsp"%>
</body>
</html>