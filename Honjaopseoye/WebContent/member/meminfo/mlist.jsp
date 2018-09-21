<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%List<Map<String,Object>> list = (List<Map<String,Object>>)session.getAttribute("mem_list"); 
	String mem_id = null;
	String mem_name = null;
	String mem_addr = null;
	String mem_email = null;
	String mem_hobby = null;
	String mem_job = null;
	String mem_tel = null;
	String mem_birth = null;
	String mem_gender = null;
	
if(list!=null){
	mem_id = (String)list.get(0).get("MEM_ID"); 
	mem_name = (String)list.get(0).get("MEM_NAME");
	mem_addr = (String)list.get(0).get("MEM_ADDR"); 
	mem_email = (String)list.get(0).get("MEM_EMAIL"); 
	mem_hobby = (String)list.get(0).get("MEM_HOBBY"); 
	mem_job = (String)list.get(0).get("MEM_JOB"); 
	mem_tel = (String)list.get(0).get("MEM_TEL");
	mem_birth = (String)list.get(0).get("MEM_BIRTH");
	mem_gender = (String)list.get(0).get("MEM_GENDER");
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

	var mem_id = <%=mem_id%>;
	var mem_name = <%=mem_name%>;
	var mem_addr = <%=mem_addr%>;
	var mem_email = <%=mem_email%>;
	var mem_hobby = <%=mem_hobby%>;
	var mem_job = <%=mem_job%>;
	var mem_tel = <%=mem_tel%>;
	var mem_birth = <%=mem_birth%>;
	
		var addr_array = mem_addr.split(' ');
		var addr;
		var addr_detail;
		var n = Math.ceil(addr_array.length)
		
			for(var i=0;i<(addr_array.length)/2;i++){
				addr=+addr_array[i]
			}
			for(var i=n;i<n-1;i++){
				addr_detail=+addr_array[i]
			}
			
			
	
		var y = mem_birth.substr(0,3);
		var m = mem_birth.substr(4,5);
		var d = mem_birth.substr(6,7);
			
		document.write(y);
		document.write(m);
		document.write(d);
		document.write(addr);
		document.write(addr_detail);
		
if(mem_id==null){
	mem_hobby = '취미';
	mem_job = '직업';
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
 <%@ include file="../../include/include/subtop.jsp"%>
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
							<div class="ui large header">
							 	혼자옵서예
							</div>
						</div>
						<div class="right aligned column">
						</div>
						
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 목록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

						<div class="right aligned column">
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
								<a href="#"> 친구 관리 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='./fdelete.jsp'">
								<a href="#"> 친구 삭제 </a>
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
							 	         회원 정보
								</div>
							</div>
						</div>
						<div class="center aligned column">
							<div class="ui segment" style="width:100%">
							
					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					
					
					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 회원 정보 임 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

								<div class="ui left aligned stackable container">
								
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ ID @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									
											<div class="ui divider"></div>
											<div class="ui labeled input">
												<a class="ui label"><h3>I D</h3> </a> 
												<input type="text" readonly="readonly" id="mem_id" name="mem_id" value="<%=mem_id%>">
											</div>
											
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 이름 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									
											<div class="ui divider"></div>
											<div class="ui labeled input">
												<a class="ui label"> 이름 </a>
												 <input type="text" id="mem_name" name="mem_name" value="<%=mem_name%>">
											</div>
											
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 취미 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
											<div class="ui divider"></div>
													<select class="ui dropdown">
												  	 <option value="0"><%=mem_hobby%></option>
												 	 <option value="1200">운동</option>
												 	 <option value="1201">영화</option>
												 	 <option value="1202">음악</option>
												 	 <option value="1203">춤</option>
												 	 <option value="1204">독서</option>
												 	 <option value="1205">조립|제작</option>
												 	 <option value="1206">여행</option>
												 	 <option value="1207">레저</option>
												 	 <option value="1208">미술</option>
												 	 <option value="1209">기타</option>
													</select>
													
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 직업 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
											
													<select class="ui dropdown">
												  	 <option value="0"><%=mem_job%></option>
												 	 <option value="1101">학생</option>
												 	 <option value="1102">예술가</option>
												 	 <option value="1103">운동선수</option>
												 	 <option value="1104">프로그래머</option>
												 	 <option value="1105">사무직</option>
												 	 <option value="1106">영업직</option>
												 	 <option value="1107">공무원</option>
												 	 <option value="1108">서비스직</option>
													</select>											
											
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 성별 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									
											<div class="ui divider"></div>
											
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ email @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									
											<div class="ui divider"></div>
												<div class="ui labeled icon input" id="mem_email" name="mem_email">
													<div class="ui label">Email</div>
													<input type="text" placeholder="email 값"> 
														<i class="add circle link icon"></i>
												</div>
													<select class="ui dropdown">
												  	 <option value="0">@domain.com</option>
												 	 <option value="1">@google.co.kr</option>
												 	 <option value="2">@naver.com</option>
												 	 <option value="3">@daum.net</option>
													</select>
									
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 주소 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									
											<div class="ui divider"></div>
											<div class="ui labeled input" id="mem_addr" name="mem_addr">
												<a class="ui label"> 주소 </a>
												<input type="text" placeholder="Required Field">
												<div class="ui label">
													<i class="icon">시</i>
												</div>
											</div>
											<div class="ui right labeled left icon input">
												<i class="tags icon"></i> <input type="text"> <a class="ui label"> 상세 주소 </a>
											</div>
											
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 전화번호 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									
											<div class="ui divider"></div>
											<div class="ui labeled input" id="mem_tel" name="mem_tel">
												<a class="ui label"> 전화번호 </a> 
												<input type="text" value="<%=mem_tel%>">
											</div>
											
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 성별 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->	
									
											<div class="ui divider"></div>
												<select class="ui dropdown" id="mem_gender" name="mem_gender">
												  <option value="0"><%=mem_gender%></option>
												  <option value="1301">남</option>
												  <option value="1302">녀</option>
												</select>
												
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 생년월일 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
										
											<div class="ui divider"></div>
													<select class="ui dropdown">
												  	 <option value="">생년</option>
												 	 <option value="1">1991년</option>
												 	 <option value="0">1992년</option>
													</select>
													<select class="ui dropdown">
													  <option value="">월</option>
													  <option value="1">12월</option>
													  <option value="0">11월</option>
													</select>
													<select class="ui dropdown">
													  <option value="">일</option>
													  <option value="1">1일</option>
													  <option value="0">2일</option>
													</select>
										<div class="ui divider"></div>
										<div class="ui black button" onclick="mem_update()" id="mem_update"> 수정 하기 </div>	
									</div>
									<!-- 회원 정보 container -->
							</div>
<!-- 회원 정보 segment -->
						</div>
<!-- 회원 정보 column -->

			<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		
					</div>	
<!-- inner column -->
				</div>
<!-- segment -->
			</div>
<!-- field  -->
		</div>
<!-- column -->
	</div>
<!-- grid -->	
</div>
<script type="text/javascript">
	function mem_update(){
		alert('수정중')
	}
</script>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

<%@ include file="../../include/bottom.jsp" %>
</body>
</html>