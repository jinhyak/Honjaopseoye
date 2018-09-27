<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

 <%@ include file="../../include/include/subtop.jsp" %>
 
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui header" style="margin-left: 150px;margin-right: 150px; margin-top: 100px;margin-bottom: 100px">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<div class="ui two attached stackable column grid" style="width:100%">
		<div class="center aligned column"style="width:20%;">
			<div class="ui field" style="height:800px">
				<div class="ui segment">
					<div class="ui one column grid">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 말머리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div class="center aligned column">
						</div>
						<div class="center aligned column">
						</div>
						<div class="center aligned column">
						</div>
						<div class="center aligned column">
							<div class="ui large header">
							 	혼자옵서예
							</div>
						</div>
						<div class="right aligned column">
						</div>
						<div class="right aligned column">
						</div>
						<div class="right aligned column">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 목록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
							<div class="ui segment button" style="width:100%" onclick="location.href='./mlist.jsp'">
								<a href="#"> 회원 정보 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='./mdelete.jsp'">
								<a href="#"> 회원 탈퇴 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='./flist.jsp'">
								<a href="#"> 친구 찾기 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='./fdelete.jsp'">
								<a href="#"> 친구 관리 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='./gList.jsp'">
								<a href="#"> 그룹 관리 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='./gCreate.jsp'">
								<a href="#"> 그룹 만들기 </a>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ contents @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="column"style="width:80%;">
			<div class="ui field">
				<div class="ui segment">
					<div class="ui center aligned one column grid">
						<div class="center aligned column">
							<div class="ui segment">
								<div class="ui large header">
							 	         친구 찾기
								</div>
							</div>
						</div>
						<div class="center aligned column">
							<div class="ui segment" style="width:100%;">
							
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
								<div class="ui stackable two column grid" style="margin-top:50px;margin-bottom:50px">
									<div class="left aligned column">
										<h2 class="ui dividing header" style="margin-left:50px;">친구 목록</h2>
									</div>
									<div class="right aligned column">
										<div class="ui left icon label input" style="margin-right:40px;border:solid">
										  <input type="text" placeholder="친구를 검색하세요.." id="value" name="value">
										  <i class="users icon"></i>
										  <button class="ui label button" onclick="search()">검색</button>
										</div>
									</div>

									<table class="ui celled right aligned table" id="f_table" style="margin-left:50px;margin-right:50px;border:solid">
										<thead>
											<tr>
												<th class="center aligned" style="width:20%" id="fri_id">친구 ID</th>
												<th class="center aligned" style="width:20%" id="fri_name">친구 이름</th>
												<th class="center aligned" style="width:20%" id="fri_age">친구 생일</th>
												<th class="center aligned" style="width:20%" id="fri_email">친구 email</th>
												<th class="center aligned" style="width:20%" id="fri_add">추가</th>
											</tr>
										</thead>
										<tbody id="fri_search">
										</tbody>
									</table>
									<script type="text/javascript">
										function search(){
												alert(mem_id);
												var value="value="+$("#value").val()+"&mem_id="+mem_id;
											$.ajax({
												 method:"post"
												,data:value
												,url:"../../friend/empty/fri_select.test"
												,success:function(data){
													alert(data);
													$("#fri_search").html(data);
												}
												,error:function(data){
													alert("실패");
												}
											})
										}
									</script>
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
								</div>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
</div>
<%@ include file="../../include/bottom.jsp" %>
</body>
</html>