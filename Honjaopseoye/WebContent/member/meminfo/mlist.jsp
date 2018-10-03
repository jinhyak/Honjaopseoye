<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
.body{
	min-width:800px;
}
</style>
</head>
<body>
 <%@ include file="../../include/include/subtop.jsp"%>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<script type="text/javascript">

$(document).ready(function(){
	$("#jobs").val(mem_job)
	$("#hobbys").val(mem_hobby)
	$("#mem_gender").val(mem_gender)
	$("#domain").val(domain)
})
</script>
<div class="ui header" style="margin-left: 150px;margin-right: 150px; margin-top: 100px;margin-bottom: 100px">

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

	<div class="ui two attached stackable column grid" style="width:100%">
		<div class="center aligned one column"style="width:20%;">
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
								<a href="#"> 친구 삭제 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='./fdelete.jsp'">
								<a href="#"> 친구 찾기 </a>
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
			<form id="mlist_form">
								<div class="ui left aligned stackable container">
								
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ ID @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									
											<div class="ui divider"></div>
											<div class="ui labeled input">
												<a class="ui label"><h3>I D</h3> </a> 
												<input type="text" readonly="readonly" id="mem_id" name="mem_id" value="<%=mem_id %>">
											</div>
											
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 이름 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									
											<div class="ui divider"></div>
											<div class="ui labeled input">
												<a class="ui label"> 이름 </a>
												 <input type="text" id="mem_name" name="mem_name" value="<%=mem_name%>">
											</div>
											
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 직업 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
											<div class="ui divider"></div>
									<div class="ui label">취미
													<select class="ui dropdown" id="hobbys">
												 	 <option class="job" value="1200">운동</option>
												 	 <option class="job" value="1201">영화</option>
												 	 <option class="job" value="1202">음악</option>
												 	 <option class="job" value="1203">춤</option>
												 	 <option class="job" value="1204">독서</option>
												 	 <option class="job" value="1205">조립|제작</option>
												 	 <option class="job" value="1206">여행</option>
												 	 <option class="job" value="1207">레저</option>
												 	 <option class="job" value="1208">미술</option>
												 	 <option class="job" value="1209">기타</option>
													</select>
									</div>
													
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 취미 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									<div class="ui label">직업
													<select class="ui dropdown"id="jobs">
												  	 <option class="hobby" value="1109">무직</option>
												 	 <option class="hobby" value="1101">학생</option>
												 	 <option class="hobby" value="1102">예술가</option>
												 	 <option class="hobby" value="1103">운동선수</option>
												 	 <option class="hobby" value="1104">프로그래머</option>
												 	 <option class="hobby" value="1105">사무직</option>
												 	 <option class="hobby" value="1106">영업직</option>
												 	 <option class="hobby" value="1107">공무원</option>
												 	 <option class="hobby" value="1108">서비스직</option>
													</select>											
									</div>
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 성별 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									<script type="text/javascript">

									</script>
											
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ email @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									
											<div class="ui divider"></div>
												<div class="ui labeled icon input" id="email">
													<div class="ui label">Email</div>
													<input type="text" value="<%=email%>" id="mem_email" name="email"> 
												</div>
													<select class="ui dropdown" id="domain">
												  	 <option value="@org.com">@org.com</option>
												 	 <option value="@google.com">@google.com</option>
												 	 <option value="@naver.com">@naver.com</option>
												 	 <option value="@daum.net">@daum.net</option>
													</select>
									
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 주소 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									
											<div class="ui divider"></div>
											<div class="ui labeled input"style="width:60%">
												<a class="ui label"> 주소 </a>
												<input type="text" style="width:100%" value="<%=mem_addr%>" name="mem_addr">
											</div>
											
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 전화번호 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									
											<div class="ui divider"></div>
											<div class="ui labeled input">
												<a class="ui label"> 전화번호 </a> 
												<input type="text" value="<%=mem_tel%>" id="mem_tel" name="mem_tel">
											</div>
											
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 성별 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->	
									
											<div class="ui divider"></div>
												<select class="ui dropdown" id="mem_gender" name="mem_gender">
												  <option value="1300">남</option>
												  <option value="1301">녀</option>
												</select>
												
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ 생년월일 @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
										
											<div class="ui divider"></div>
									<div class="ui label">
										<div>생년월일</div>
		<div class="ui input"><input type="text" id="datepicker" value="<%=mem_birth%>" readonly="readonly" name="mem_birth" style="width:200px"></div>
									</div>
										<div class="ui divider"></div>
										<div class="ui black button" onclick="mem_update()" id="mem_update"> 수정 하기 </div>	
									
									</div>
				</form>
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
		var mem_job = $("#jobs").val()
		alert(mem_job)
		var mem_hobby = $("#hobbys").val()
		alert(mem_hobby)
		var mem_gender = $("#mem_gender").val()
		alert(mem_gender)
		var mem_email = $("#mem_email").val()+$("#domain").val();
		alert(mem_email)
		var param = $('#mlist_form').serialize()+"&mem_email="+mem_email+"&mem_hobby="+mem_hobby+"&mem_job="+mem_job+"&mem_gender="+mem_gender;
		alert(param)
		//수정 ajax gogo
		$.ajax({
			 method:"post"
			,data:param
			,url:"../../member/empty/update.test"
			,success:function(data){
					alert(data);
				if(data=='1'){
					alert('회원정보가 수정되었습니다.')
				}
				else{
					alert("회원정보 수정에 실패하셨습니다")
				}
			}
			,error:function(data){
				alert("실패");
			}
		})
	}
	$(function() {
        //input을 datepicker로 선언
        $("#datepicker").datepicker({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "-60Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+1D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
        });                    
        //초기값을 오늘 날짜로 설정
        $('#datepicker').datepicker(); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
    });
</script>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<%@ include file="../../include/bottom.jsp" %>
</body>
</html>