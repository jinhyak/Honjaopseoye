<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: 100;
      margin-bottom: 100;
    }
    .column {
      min-width: 480px;
      max-width: 800px;
    }
</style>
</head>
<body>
<%@include file="../../include/include/subtop.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$('#pw_compare').keyup(function(){
			keyup();
		});
		$('#pw').keyup(function(){
			keyup();
		});
	})
	function keyup(){
		var pw = $('#pw').val();
		var pw_compare = $('#pw_compare').val();
		if(pw==pw_compare){
			$('#pw_check').text('비밀번호가 동일합니다.');
			$('#f_p').attr('class','field');
			$('#lock').attr('class','unlock icon');
			$('#h_pw').val('1');
		}
		else{
			$('#pw_check').text('비밀번호가 다릅니다');
			$('#f_p').attr('class','field error');
			$('#lock').attr('class','lock icon');
			$('#h_pw').val('0');
		}
	}
	function id_check(){
		var id_check;
		var param = $('#id').val()
		$.ajax({
			 method:"get"
			,url:"../../member/empty/id_sel.test?mem_id="+param
			,success:function(data){
				if(data=='1'){
					alert('사용할 수 있는 ID입니다')
					id_check=data
				}
				else{
					alert("사용중인 ID입니다.")
					id_check=data
				}
			}
			,error:function(data){
				alert("실패");
			}
		})
		$('#h_id').val(id_check);
	}
	function tel_check(){
		var tel_check;
		var param = $('#tel').val()
		$.ajax({
			 method:"get"
			,url:"../../member/empty/tel_sel.test?mem_tel="+param
			,success:function(data){
				if(data=='1'){
					alert('사용할 수 있는 번호입니다')
					tel_check = data
				}
				else{
					alert("사용중인 번호입니다.")
					tel_check = data
				}
			}
			,error:function(data){
				alert("실패");
			}
		})
		$('#h_tel').val(tel_check);
	}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# 회원가입 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	function join(){
		var user_name = $('#name').val();
		var user_id = $('#id').val();
		var h_id = $('#h_id').val();
		var h_pw = $('#h_pw').val();
		var h_tel = $('#h_tel').val();
		
		if(user_name==''||user_name==null){
			alert('이름란에 공백을 사용할 수 없습니다.');
		}
		else if(user_id==''||user_id==null){
			alert('ID란에 공백을 사용할 수 없습니다.');
		}
		else if(h_id=='0'){
			alert('중복체크를 하셔야합니다.')
		}
		else if(h_pw==''||h_pw==null){
			alert('비밀번호는 공백을 허용하지 않습니다');
		}
		else if(h_pw=='0'){
			alert('비밀번호가 동일하지 않은 상태입니다.');
		}
		else{
			var email = $('#email').val()+"@"+$('#domain').text();
			var hoby = $('#mem_hobby').val();
			var job = $('#mem_job').val();
			var param = $('#form_login').serialize()+"&mem_email="+email+"&mem_hobby="+hoby+"&mem_job="+job;
			alert('회원가입');
			$.ajax({
				 method:"post"
				,data:param
				,url:"../../member/empty/insert.test"
				,success:function(data){
					if(data=='1'){
						alert('회원가입에 성공하셨습니다.')
						location.href="../login/login.jsp"
					}
					else{
						alert("회원가입에 실패하셨습니다")
					}
				}
				,error:function(data){
					alert("실패");
				}
			})
		}
	}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 닫기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	function close_j(){
		self.close();
	}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 성별 구분 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	function gender(){
		var gender = $("chk_info").val()
		alert(gender)
	}
</script>
	<div class="ui middle center aligned grid bagic segment" style="margin-top:100px;border:hidden">
		<div class="column" style="width: 60%;border:hidden">
				<img src="../../image/logo.png" class="image"style="width:280px;border:hidden">
			<form class="ui large form" id="form_login">
				<div class="ui stacked left aligned segment"style="margin-bottom:50px">
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# 이름 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field">
						<div class="ui inverted labeled left icon input" style="width: 100%;">
							<i class="user icon"></i> <input type="text" name="mem_name" id="name" placeholder="이름을 입력하세요">
						</div>
					</div>
					<div class="ui name check" id="name_check"></div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# 성별 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					<div class="field" id="gend">
						<div class="ui segment" style="width:150px;padding-top:8px;padding-bottom:8px;">
							<input type="radio" name="mem_gender" style="align:left" value="1300">남성
							<input type="radio" name="mem_gender" value="1301" style="align:left">여성
						</div>
					</div>
					<div class="ui tel check" id="tel_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# 생년 월일 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->		
					<div class="field">
					<div class="ui label">
						<div>생년월일</div>
						<input type="text" id="datepicker" placeholder="날짜를 입력하세요" readonly="readonly" name="mem_birth" style="width:200px">
					</div>
					</div>
					<div class="ui birth" id="birth"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# 취미 직업 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field">
						<div class="ui label">직업
								<div class="ui selection dropdown addr">
										<input type="hidden" value="1109" id="mem_job"> <i class="dropdown icon"></i>
										<div class="text" id="hobby">무직</div>
										<div class="menu" id="menu_job">
											<div class="item" data-value="1100">무직</div>
											<div class="item" data-value="1101">학생</div>
											<div class="item" data-value="1102">운동선수</div>
											<div class="item" data-value="1103">예술가</div>
											<div class="item" data-value="1104">프로그래머</div>
											<div class="item" data-value="1105">사무직</div>
											<div class="item" data-value="1106">영업직</div>
											<div class="item" data-value="1107">공무원</div>
											<div class="item" data-value="1108">서비스직</div>
										</div>
								</div>
						</div>
						<div class="ui label">취미
								<div class="ui selection dropdown addr">
									<input type="hidden" value="1200" id="mem_hobby"> <i class="dropdown icon"></i>
										<div class="text" id="hobby">기타</div>
										<div class="menu" id="menu_hobby">
											<div class="item" data-value="1209">기타</div>
											<div class="item" data-value="1200">운동</div>
											<div class="item" data-value="1201">영화</div>
											<div class="item" data-value="1202">음악</div>
											<div class="item" data-value="1203">춤</div>
											<div class="item" data-value="1204">독서</div>
											<div class="item" data-value="1205">조립|제작</div>
											<div class="item" data-value="1206">여행</div>
											<div class="item" data-value="1207">레저</div>
											<div class="item" data-value="1208">미술</div>
										</div>
								</div>
						</div>
					</div>
					<div class="ui pw check" id="hob_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# ID #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field">
						<div class="ui left icon input" style="width: 100%;">
							<i class="user icon"></i> <input type="text" name="mem_id" id="id" placeholder="아이디를 입력하세요">
							<div class="ui fluid large submit button" style="width: 200px" onclick="id_check()">중복체크</div>
							<input type="hidden" id="h_id" value="0">
						</div>
					</div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#  pw  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->

					<div class="field">
						<div class="ui left icon input" style="width: 100%;">
							<i class="lock icon"></i> <input type="password"  name="mem_pw" id="pw" placeholder="비밀번호를 입력하세요">
						</div>
					</div>
					<div id="f_p" class="field">
						<div class="ui left icon input" id="pw_c" style="width: 100%;">
							<i class="lock icon" id="lock"></i>
							<input type="password" id="pw_compare" placeholder="비밀번호 확인"> 
							<input type="hidden" id="h_pw" value="0">
						</div>
					</div>
					<div class="ui pw check" id="pw_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# email #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field" style="width:100%">
						<div class="ui left icon input" style="width: 100%;">
							<i class="envelope icon"></i> <input type="email" id="email" placeholder="E-mail address">
							@<div class="ui large selection dropdown" id="dropdown">
								<input type="hidden" value="default"><i class="dropdown icon"></i>
								<div class="text" id="domain">google.com</div>
								<div class="menu">
									<div class="item" data-value="0">naver.com</div>
									<div class="item" data-value="1">duam.net</div>
									<div class="item" data-value="default">google.com</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ui email check" id="email_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# 전화번호 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field">
						<div class="ui left icon input" style="width: 100%;">
							<i class="phone icon"></i> <input type="tel" name="mem_tel" id="tel" placeholder="전화번호를 입력하세요">
							<div class="ui fluid large submit button" style="width: 200px" onclick="tel_check()">중복체크</div>
						</div>
					</div>
					<input type="hidden" id="h_tel">
					<div class="ui tel check" id="tel_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# 우편번호 입력 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field" align="left">
						<div class="ui icon input" style="width:50%;">
							<i class="address book icon"></i> 
							<input type="text" readonly="readonly" placeholder="우편번호 정보가 없습니다" id="mem_zip">
						</div>
					</div>
					<div class="ui addr check" id="addr_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# 주소번지입력 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field" style="width: 100%;">
						<div class="ui icon input">
							<input type="text" name="mem_addr" readonly="readonly" placeholder="상세주소 정보가 없습니다." id="mem_addr">
							<div class="ui gray button" onclick="addr()">
								<i class="plus icon"></i> 주소등록
							</div>
						</div>
					</div>
					<div class="ui addr check" id="addr_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# 버튼 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
						<div class="ui gray button" onclick="join()" style="width: 40%;">회원가입</div>
						<div class="ui gray button" onclick="close_j()" style="width: 40%;">닫기</div>
					</div>
					<div class="ui error message"></div>
			</form>
		</div>
	</div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# 주소등록모달 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
	<div class="ui modal" id="modal_addr">
		<i class="close icon"></i>
		<div class="header">
			<h3>주소등록창</h3>
		</div>
		<div class="content">
			<div class="body">
				<div class="ui selection dropdown addr">
					<input type="hidden" value="default" id="do"> <i class="dropdown icon"></i>
					<div class="text" id="dos">도</div>
					<div class="menu" id="menu_do">
						<div class="item" data-value="default">도</div>
					</div>
				</div>
				<div class="ui selection dropdown addr">
					<input type="hidden" value="default"> <i class="dropdown icon"></i>
					<div class="text" id="si">시</div>
					<div class="menu" id="menu_si">
						<div class="item" data-value="default">시</div>
					</div>
				</div>
				<div class="ui selection dropdown addr">
					<input type="hidden" value="default"> <i class="dropdown icon"></i>
					<div class="text" id="dong">동.리</div>
					<div class="menu" id="menu_dong">
						<div class="item" data-value="default">동.리</div>
					</div>
				</div>
				<div class="ui input" style="width: 200px;">
					<input type="text" readonly="readonly" placeholder="우편번호 검색" id="p_zip">
				</div>
				<div class="ui input" style="width:100%">
					<input type="text" placeholder="상세주소를 입력한후 검색하세요" id="p_addr">
					<div class="ui button" id="address" onclick="zipcode()">주소 검색</div>
				</div>
				<div class="actions">
					<div class="ui button" id="insert" onclick="regist()">등록</div>
					<div class="ui button" id="cancle" onclick="cancel()">취소</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 주소등록 모달 기능 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			$('#dropdown').click(function(){
				$('#dropdown').dropdown()
			});
			$('.addr').click(function(){
				$('.addr').dropdown()
			});
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 도 select @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			function addr(){
				$('#modal_addr')
				.modal({
					centered:false
				})
				.modal('show');
				$.ajax({
					 method:'post'
					,url:'../../gubun/empty/doselect.test'
					,success:function(data){
						alert(data);
						$('#menu_do').html(data);
					}
				})
			};
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 시 select @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			$('.dropdown').change(function(){
				var dos =$('#dos').text();
				var si = $('#si').text();
				var dong = $('#dong').text();
				if(dos=='도'){"도명을 선택해주세요"}
				else{
					var param = "zdo="+dos
					$.ajax({
						 method:"post"
						,data:param
						,url:"../../gubun/empty/siselect.test"
						,success:function(data){
							$('#menu_si').html(data);
						}
					})
				}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 동 select @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
				if(si=='시'){"시명을 선택해주세요"}
				else{
					var param = "sigu="+si
					$.ajax({
						 method:"post"
						,data:param
						,url:"../../gubun/empty/dongselect.test"
						,success:function(data){
							$('#menu_dong').html(data);
						}
					})
				}
			});
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 우편번호 select @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	function zipcode(){
		var dos =$('#dos').text();
		var si = $('#si').text();
		var dong = $('#dong').text();
		var address = $('#p_addr').val();
		alert(address);
		cmm_window_popup("./address.jsp?zdo="+dos+"&sigu="+si+"&dong="+dong+"&address="+address, 600, 600, "상세주소 조회창")
	}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 성별 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		$('#gend').change(function (){
			var gender = $("input[type=radio][name=mem_gender]:checked").val();
			$("#h_gender").val(gender);
		})
	function regist(){
		var addr = $('#p_addr').val()
		$('#mem_addr').val(addr)
		var zip = $('#p_zip').val()
		$('#mem_zip').val(zip)
		$('#modal_addr')
		.modal('hide');
	}
	function cancel(){
		$('#modal_addr')
		.modal('hide');
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
<%@include file="../../include/bottom.jsp" %>
</body>
</html>