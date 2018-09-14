<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../Semantic/js/jquery-1.12.0.js"></script>
<script src="../Semantic/semantic.js"></script>
<script src="../Semantic/js/commons.js"></script>
<link rel="stylesheet" href="../Semantic/semantic.css" />
<meta charset="EUC-KR">
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
    }
    .column {
      min-width: 480px;
      max-width: 800px;
    }
</style>
</head>
<body>
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
		alert('ss');
		$('#h_id').val('1');
	}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# 회원가입 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	function join(){
		var user_name = $('#name').val();
		var user_id = $('#id').val();
		var h_id = $('#h_id').val();
		var h_pw = $('#h_pw').val();
		
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
			var hoby = $('#hoby').text();
			var job = $('#job').text();
			var param = $('#form_login').serialize()+"&mem_email="+email+"&mem_hobby="+hoby+"&mem_job"+job;
			alert('회원가입');
			$.ajax({
				 method:"post"
				,data:param
				,url:"../member/empty/insert.test"
				,success:function(data){
					//@@@@@@@@@@@@@@@@@@@@@@@@@ 임시 메인 화면 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
					alert('회원가입에 성공하셨습니다.')
					self.close();
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
	<div class="ui middle aligned center aligned grid bagic segment">
		<div class="column" style="width: 60%">
				<img src="../image/logo.png" class="image"style="width:280px;">
			<form class="ui large form" id="form_login">
				<div class="ui stacked segment">
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
							<input type="radio" name="gender" style="align:left" value="1">남성
							<input type="radio" name="gender" value="2" style="align:left">여성
							<input type="hidden" name="mem_gender" id="h_gender">
						</div>
					</div>
					<div class="ui tel check" id="tel_check"></div>
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
							<i class="lock icon"></i> <input type="password" name="mem_pw" id="pw" placeholder="비밀번호를 입력하세요">
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
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# 취미 직업 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field">
								<div class="ui selection dropdown addr">
										<input type="hidden" value="default" id="hobby"> <i class="dropdown icon"></i>
										<div class="text" id="hobby">취미</div>
										<div class="menu" id="menu_hobby">
											<div class="item" data-value="default">취미</div>
										</div>
								</div>
								<div class="ui selection dropdown addr">
									<input type="hidden" value="default" id="job"> <i class="dropdown icon"></i>
										<div class="text" id="job">직업</div>
										<div class="menu" id="menu_job">
											<div class="item" data-value="default">직업</div>
										</div>
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
							<i class="phone icon"></i> <input type="tel" name="mem_tel" placeholder="전화번호를 입력하세요">
							<div class="ui fluid large submit button" style="width: 200px" onclick="id_check()">중복체크</div>
						</div>
					</div>
					<div class="ui tel check" id="tel_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# 우편번호 입력 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field" align="left">
						<div class="ui icon input" style="width:50%;">
							<i class="address book icon"></i> 
							<input type="text" readonly="readonly" placeholder="우편번호 정보가 없습니다" id="zip">
						</div>
					</div>
					<div class="ui addr check" id="addr_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# 주소번지입력 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field" style="width: 100%;">
						<div class="ui icon input">
							<input type="text" name="mem_addr" readonly="readonly" placeholder="주소 정보가 없습니다" id="addr">
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
				<div class="ui input" style="width: 300px;">
					<input type="text" placeholder="상세주소를 등록하세요" id="p_addr">
				</div>
				<div class="ui input">
					<input type="text" readonly="readonly" placeholder="우편번호 검색을 누르세요" id="p_zip">
					<div class="ui button" id="zipcode" onclick="zipcode()">우편번호검색</div>
				</div>
				<div class="actions">
					<div class="ui button" id="insert">등록</div>
					<div class="ui button" id="cancle">취소</div>
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
					,url:'../Zipcode/empty/select.deok'
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
				if(dos=='도'){}
				else{
					var param = "zdo="+dos
					$.ajax({
						 method:"post"
						,data:param
						,url:"../Zipcode/empty/select2.deok"
						,success:function(data){
							$('#menu_si').html(data);
						}
					})
				}
				if(si=='시'){}
				else{
					var param = "sigu="+si
					$.ajax({
						 method:"post"
						,data:param
						,url:"../Zipcode/empty/select3.deok"
						,success:function(data){
							$('#menu_dong').html(data);
						}
					})
				}
			});
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 동 select @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		$('#insert').click(function(){
				var addr = $('#p_addr').val();
				var zip = $('#p_zip').val();
				$('#addr').val(addr);
				$('#zip').val(zip);
				$('#modal_addr')
				.modal({
					centered:false
				});
		});
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 성별 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		$('#gend').change(function (){
			var gender = $("input[type=radio][name=mem_gender]:checked").val();
			$("#h_gender").val(gender);
		})
</script>
</body>
</html>