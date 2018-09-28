<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@ include file="../../include/include/commonUI.jsp"%>
<!-- <script type="text/javascript">
	$("#ch_ph").on('click', function(){
		var chkvalue = $('input[name="ch_ph"]:checked').val();
		
		if(chkvalue == '1'){
			$("#ph").css('display','block');
			$("#e_div").css('display','none');
		}else if(chkvalue == '2'){
			$("#ph").css('display','none');
			$("#e_div").css('display','block');
		}
	});
</script> -->
</head>
<body>
 <%@ include file="../../include/include/subtop.jsp" %>
 <script type="text/javascript">
 	$(document).ready(function(){
 		$("#ph").show();
 		$("#e_div").hide();
/*  		var a = $("#ch_ph1").val();
 		var b = $("#ch_ph2").val();
 		if(a == "checked"){
 			alert("1");
 		}else if(b== "checked"){
 			alert("2")
 		} */
  		
 		$("input[name='ch_ph']").change(function(){
 			var radiovalue = $(this).val();
 			if(radiovalue == "1"){
 				alert("1");
 				$("#ph").show();
 				$("#e_div").hide();
 				$("#ch_ph2").attr('checked',false);
 				radiovalue[0].checked=true;
 			}
 			if(radiovalue == "2"){
 				alert("2");
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
                           <form id="f_ph" name="f_ph" method="post"
                              action="../../member/empty/idSearch.test">
                              <div class="ui segment"
                                 style="border: 1px solid #556852; margin-bottom: 50px;"
                                 id="phone">
                                 <div class="left aligned column">
                                    <div class="ui container"
                                       style="padding-bottom: 15px; text-align: left">
                                       <input type="radio" id="ch_ph1" name="ch_ph" value="1" 
                                          style="margin-right: 5px;">
                                          <font size="4px">회원정보에 등록한 휴대전화로 인증</font>
                                    </div>
                                    <div style="text-align: left; margin-left: 50px;" id="ph">
                                       <div class="ui column container"
                                          style="padding-bottom: 8px;">
                                          <label>이름</label>
                                          <div class="ui input focus" 
                                             style="padding-left: 40px;">
                                             <input type="text" placeholder="이름을 입력해주세요." id="ins_name" name="ins_name"
                                                style="margin-left: 19px; width: 250px">
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
                                          <div class="ui input focus" 
                                             style="padding-left: 2px; width: 250px">
                                             <input type="text" placeholder="전화번호" id="ins_ph" name="ins_ph">
                                          </div>
                                       </div>
                                       <div style="margin-top: 10px; margin-left: 147px;">
                                          <button class="ui teal button" id="btn_search" type="button" onClick="btn_find()"
                                              style="width: 250px;">아이디 찾기</button>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </form>
                           <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 휴대전화번호 인증 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

                           <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 이메일 인증  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                           <form id="f_email" name="f_email" action="../../member/empty/e_idSearch.test">
                              <div class="ui segment" style="border: 1px solid #556852"
                                 id="email">
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
                                          <label>이름</label>
                                          <div class="ui input focus"
                                             style="padding-left: 40px; width: 307px">
                                             <input type="text" placeholder="이름을 입력해주세요." id="e_name" name="e_name"
                                                style="margin-left: 19px;">
                                          </div>
                                       </div>
                                    </div>
                                    <div style="text-align: left; margin-left: 50px;">
                                       <div class="ui column container">
                                          <label>이메일</label>
                                          <div class="ui input focus" style="width:293px">
                                             <input type="text" placeholder="이메일 주소" id="e_mail" name="e_mail"
                                                style="margin-left: 45px;">
                                          </div>
                                          <div style="margin-top: 10px; margin-left: 90px;">
                                             <button class="ui teal button" type="button" style="width: 250px;" onClick="btn_efind()">비밀번호   찾기</button>
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