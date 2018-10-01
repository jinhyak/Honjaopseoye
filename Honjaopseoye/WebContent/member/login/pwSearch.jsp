<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@ include file="../../include/include/commonUI.jsp"%>
<script type="text/javascript">
	function btn_find() {
		if ($("#mem_id").val() == null || $("#mem_id").val() == "") {
			alert("아이디를 입력해 주세요.");
			$("#mem_id").val("");
			$("#mem_id").focus();
			return false;
		} else if ($("#mem_tel").val() == null || $("#mem_tel").val() == "") {
			alert("전화번호를 입력해주세요.");
			$("#mem_tel").val("");
			$("#mem_tel").focus();
			return false;
		} else {
			//$("#f_phone").submit();
			var param = $("#f_phone").serialize();
			$.ajax({
				url : "../../member/empty/pwCheck.test",
				method : "post",
				data : param,
				success : function(result) {
					if (result == '0') {
						alert("존재하지 않는 아이디입니다.");
						$("#mem_id").focus();
					} else if (result == '-1') {
						alert("존재하지 않는 전화번호 입니다.");
						$("#mem_tel").focus();
					} else { //아이디 찾기 성공
						location.href = "./pwFound.jsp";
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
		if ($("#e_id").val() == null || $("#e_id").val() == "") {
			alert("이름을 입력해 주세요.");
			$("#e_id").val("");
			$("#e_id").focus();
			return false;
		} else if ($("#e_mail").val() == null || $("#e_mail").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#e_mail").val("");
			$("#e_mail").focus();
			return false;
		} else {
			var param = $("#f_email").serialize();
			$.ajax({
				url : "../../member/empty/pwCheck2.test",
				method : "post",
				data : param,
				success : function(result) {
					if (result == '0') {
						alert("존재하지 않는 아이디입니다.");
						$("#e_id").focus();
					} else if (result == '-1') {
						alert("존재하지 않는 이메일 입니다.");
						$("#e_mail").focus();
					} else { //아이디 찾기 성공
						location.href = "./pwFound2.jsp";
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
 <%@ include file="../../include/include/subtop.jsp" %>
 <script type="text/javascript">
 	$(document).ready(function(){
 		$("#ph").show();
 		$("#e_div").hide();
  		
 		$("input[name='ch_ph']").change(function(){
 			var radiovalue = $(this).val();
 			if(radiovalue == "1"){
 				//alert("1");
 				$("#ph").show();
 				$("#e_div").hide();
 				$("#ch_ph2").attr('checked',false);
 				radiovalue[0].checked=true;
 			}
 			if(radiovalue == "2"){
 				//alert("2");
 				$("#ph").hide();
 				$("#e_div").show();
 				$("#ch_ph1").attr('checked',false);
 			}
 		
 		}); 
 		
 	});
 </script>
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
							 	회원정보
							</div>
						</div>
						<div class="right aligned column">
						</div>
						<div class="right aligned column">
						</div>
						<div class="right aligned column">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 목록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
							<div class="ui segment button" style="width:100%">
								<a href="#"> 회원 정보 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%">
								<a href="#"> 회원 탈퇴 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%">
								<a href="#"> 친구 관리 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%">
								<a href="#"> 친구 삭제 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%">
								<a href="#"> 그룹 관리 </a>
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
							 	           비번 찾기
								</div>
							</div>
						</div>
					    <div class="center aligned column">
                        <div class="ui segment"
                           style="width: 100%; height: 100%; border: 1px solid blue">
                           <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                           <a href="#"> 회원 정보 form </a>
                           <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 휴대전화번호 인증 @@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                           <form id="f_phone" name="f_phone" method="post">
                              <div class="ui segment"
                                 style="border: 1px solid #556852; margin-bottom: 50px;"
                                 id="phone">
                                 <div class="left aligned column">
                                    <div class="ui container"
                                       style="padding-bottom: 15px; text-align: left">
                                       <input type="radio" id="ch_ph1" name="ch_ph" value="1" checked="checked"
                                          style="margin-right: 5px;">
                                          <font size="4px">회원정보에 등록한 휴대전화로 인증</font>
                                    </div>
                                    <div style="text-align: left; margin-left: 50px;" id="ph">
                                       <div class="ui column container"
                                          style="padding-bottom: 8px;">
                                          <label>아이디</label>
                                          <div class="ui input focus" 
                                             style="padding-left: 40px;">
                                             <input type="text" placeholder="아이디를 입력해주세요." id="mem_id" name="mem_id"
                                                style="margin-left: 5px; width: 250px">
                                          </div>
                                       </div>
                                       <div class="ui column container" style="padding-bottom: 8px;">
                                          <span style="margin-right: 31px"><label>휴대전화</label></span>
                                          <div class="ui input focus" 
                                             style="width: 250px">
                                             <input type="text" placeholder="전화번호를 입력해주세요." id="mem_tel" name="mem_tel">
                                          </div>
                                       </div>
                                       <div style="margin-top: 10px; margin-left: 170px;">
                                          <button class="ui gray button" id="btn_search" type="button" onClick="btn_find()"
                                              style="width: 250px;">비밀번호 찾기</button>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </form>
                           <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 휴대전화번호 인증 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

                           <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 이메일 인증  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                           <form id="f_email" name="f_email">
                              <div class="ui segment" style="border: 1px solid #556852" id="email">
                                 <div class="left aligned column">
                                    <div class="ui container"
                                       style="padding-bottom: 15px; text-align: left">
                                       <input type="radio" name="ch_ph" id="ch_ph2" value="2"  style="margin-right: 5px;">
                                       <font size="4px">회원정보에 등록한 이메일로 인증</font>
                                    </div>
                                    <div id="e_div">
                                    <div style="text-align: left; margin-left: 50px;">
                                       <div class="ui column container"
                                          style="padding-bottom: 8px;">
                                          <label>아이디</label>
                                          <div class="ui input focus"
                                             style="padding-left: 40px; width: 307px">
                                             <input type="text" placeholder="아이디를 입력해주세요." id="e_id" name="e_id"
                                                style="margin-left: 5px;">
                                          </div>
                                       </div>
                                    </div>
                                    <div style="text-align: left; margin-left: 50px;">
                                       <div class="ui column container">
                                          <label>이메일</label>
                                          <div class="ui input focus" style="width:307px">
                                             <input type="text" placeholder="이메일 주소를 입력해주세요." id="e_mail" name="e_mail"
                                                style="margin-left: 45px;">
                                          </div>
                                          <div style="margin-top: 10px; margin-left: 90px;">
                                             <button class="ui gray button" type="button" style="width: 250px;" onClick="btn_efind()">비밀번호   찾기</button>
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
<%@ include file="../../include/bottom.jsp" %>
</body>
</html>