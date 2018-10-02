<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	//String user_pw = request.getParameter("mem_pw");
%>
<head>
<%@ include file="../../include/include/commonUI.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	function btn_find() {
		if ($("#ins_name").val() == null || $("#ins_name").val() == "") {
			alert("이름을 입력해 주세요.");
			$("#ins_name").val("");
			$("#ins_name").focus();
			return false;
		} else if ($("#mem_tel").val() == null || $("#mem_tel").val() == "") {
			alert("전화번호를 입력해주세요.");
			$("#mem_tel").val();
			$("#mem_tel").focus();
			return false;
		} else {
			//$("#f_phone").submit();
			var param = $("#f_phone").serialize();
			$.ajax({
				url : "../../member/empty/check.test",
				method : "post",
				data : param,
				success : function(result) {
					if (result == '0') {
						alert("존재하지 않는 이름입니다.");
						$("#ins_name").focus();
					} else if (result == '-1') {
						alert("존재하지 않는 전화번호 입니다.");
						$("#mem_tel").focus();
					} else { //아이디 찾기 성공
						location.href = "./idFound.jsp";
					}
				},
				error : function(xhrObject) {
					alert(xhrObject.responseText);
				}
			})
			return true;
		}
	}
</script>
<script type="text/javascript">
	function btn_efind() {
		if ($("#e_name").val() == null || $("#e_name").val() == "") {
			alert("이름을 입력해 주세요.");
			$("#e_name").val("");
			$("#e_name").focus();
			return false;
		} else if ($("#e_mail").val() == null || $("#e_mail").val() == "") {
			alert("이메일을 입력해주세요.");
			("#e_mail").val("");
			$("#e_mail").focus();
			return false;
		} else {
			var param = $("#f_email").serialize();
			$.ajax({
				url : "../../member/empty/check2.test",
				method : "post",
				data : param,
				success : function(result) {
					if (result == '0') {
						alert("존재하지 않는 이름입니다.");
						$("#e_name").focus();
					} else if (result == '-1') {
						alert("존재하지 않는 이메일 입니다.");
						$("#e_mail").focus();
					} else { //아이디 찾기 성공
						location.href = "./idFound2.jsp";
					}
				},
				error : function(xhrObject) {
					alert(xhrObject.responseText);
				}
			})

		}
	}
</script>
</head>
<body>
	<%@ include file="../../include/include/subtop.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#ph").show();
			$("#e_div").hide();
	
			//라디오버튼 클릭시 화면이 보였다 안보였다 하는 것
			$("input[name='ch_ph']").change(function() {
				var radiovalue = $(this).val(); //1 or 2
				if (radiovalue == "1") {
					//alert("1");
					$("#ph").show();
					$("#e_div").hide();
					$("#ch_ph2").attr('checked', false);
				}
				if (radiovalue == "2") {
					//alert("2");
					$("#ph").hide();
					$("#e_div").show();
					$("#ch_ph1").attr('checked', false);
				}
	
			});
	
		});
	</script>

	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<div class="ui header"
		style="margin-left: 150px; margin-right: 150px; margin-top: 100px; margin-bottom: 100px">
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="ui two attached stackable column grid" style="width: 100%">
			<div class="center aligned column" style="width: 20%;">
				<div class="ui field" style="height: 800px">
					<div class="ui segment">
						<div class="ui one column grid">
							<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 말머리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
							<div class="center aligned column"></div>
							<div class="center aligned column"></div>
							<div class="center aligned column"></div>
							<div class="center aligned column">
								<div class="ui large header">회원정보</div>
							</div>
							<div class="right aligned column"></div>
							<div class="right aligned column"></div>
							<div class="right aligned column">
								<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 목록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
								<div class="ui segment button" style="width: 100%">
									<a href="#"> 회원 정보 </a>
								</div>
							</div>
							<div class="right aligned column">
								<div class="ui segment button" style="width: 100%">
									<a href="#"> 회원 탈퇴 </a>
								</div>
							</div>
							<div class="right aligned column">
								<div class="ui segment button" style="width: 100%">
									<a href="#"> 친구 관리 </a>
								</div>
							</div>
							<div class="right aligned column">
								<div class="ui segment button" style="width: 100%">
									<a href="#"> 친구 삭제 </a>
								</div>
							</div>
							<div class="right aligned column">
								<div class="ui segment button" style="width: 100%">
									<a href="#"> 그룹 관리 </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ contents @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<div class="column" style="width: 80%;">
				<div class="ui field">
					<div class="ui segment">
						<div class="ui center aligned one column grid">
							<div class="center aligned column">
								<div class="ui segment">
									<div class="ui large header">아이디 찾기</div>
								</div>
							</div>
							<div class="center aligned column">
								<div class="ui segment"
									style="width: 100%; height: 100%; border: 1px solid blue">
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 휴대전화번호 인증 @@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									<form id="f_phone" name="f_phone" method="post">
										<div class="ui segment"
											style="border: 1px solid #556852; margin-bottom: 50px;"
											id="phone">
											<div class="left aligned column">
												<div class="ui container"
													style="padding-bottom: 15px; text-align: left">
													<input type="radio" id="ch_ph1" name="ch_ph" value="1"
														checked="checked" style="margin-right: 5px;"> <font
														size="4px">회원정보에 등록한 휴대전화로 인증</font>
												</div>
												<div style="text-align: left; margin-left: 50px;" id="ph">
													<div class="ui column container"
														style="padding-bottom: 8px;">
														<label>이름</label>
														<div class="ui input focus" style="padding-left: 40px;">
															<input type="text" placeholder="이름을 입력해주세요."
																id="ins_name" name="ins_name"
																style="margin-left: 19px; width: 250px">
																<input type="hidden" name="ins_name">
														</div>
													</div>
													<div class="ui column container">
														<span style="margin-right: 31px"><label>휴대전화</label></span>
														<!--                                           <select class="ui search dropdown" id="select_ph"
                                             style="border: 1px solid #85B7D9; border-radius: 3px;">
                                             <option value="">선택</option>
                                             <option value="f_ph">010</option>
                                             <option value="s_ph">011</option>
                                             <option value="th_ph">019</option>
                                          </select> -->
														<div class="ui input focus" style="width: 250px">
															<input type="text" placeholder="전화번호" id="mem_tel"
																name="mem_tel">
																<input type="hidden" name="mem_tel">
														</div>
													</div>
													<div style="margin-top: 10px; margin-left: 170px;">
														<button class="ui gray button" id="btn_search"
															type="button" onClick="btn_find()" style="width: 250px;">아이디
															찾기</button>
													</div>
												</div>
											</div>
										</div>
									</form>
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 휴대전화번호 인증 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 이메일 인증  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									<form id="f_email" name="f_email"
										action="../../member/empty/e_idSearch.test">
										<div class="ui segment" style="border: 1px solid #556852"
											id="email">
											<div class="left aligned column">
												<div class="ui container"
													style="padding-bottom: 15px; text-align: left">
													<input type="radio" name="ch_ph" id="ch_ph2" value="2"
														style="margin-right: 5px;"> <font size="4px">회원정보에
														등록한 이메일로 인증</font>
												</div>
												<div id="e_div">
													<div style="text-align: left; margin-left: 50px;">
														<div class="ui column container"
															style="padding-bottom: 8px;">
															<label>이름</label>
															<div class="ui input focus"
																style="padding-left: 40px; width: 307px">
																<input type="text" placeholder="이름을 입력해주세요." id="e_name"
																	name="e_name" style="margin-left: 19px;">
															</div>
														</div>
													</div>
													<div style="text-align: left; margin-left: 50px;">
														<div class="ui column container">
															<label>이메일</label>
															<div class="ui input focus" style="width: 293px">
																<input type="text" placeholder="이메일 주소" id="e_mail"
																	name="e_mail" style="margin-left: 45px;">
															</div>
															<div style="margin-top: 10px; margin-left: 90px;">
																<button class="ui gray button" type="button"
																	style="width: 250px;" onClick="btn_efind()">아이디
																	찾기</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 이메일 인증 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	</div>
	<%@ include file="../../include/bottom.jsp"%>
</body>
</html>