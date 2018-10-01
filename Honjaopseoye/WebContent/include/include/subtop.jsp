<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String mem_id = null;
String mem_name = null;
String mem_addr = null;
String mem_email = null;
String mem_hobby = null;
String mem_job = null;
String mem_tel = null;
String mem_birth = null;
String mem_gender = null;
String emails[];
String email = null;
String domain = null;
String mem_pw = null;
String lv = null;
int pt = 0;
	List<Map<String,Object>> member = (List<Map<String,Object>>)session.getAttribute("memList");
	if(member!=null){
		mem_id = (String)member.get(0).get("MEM_ID");
		mem_name = (String)member.get(0).get("MEM_NAME");
		mem_addr = (String)member.get(0).get("MEM_ADDR"); 
		mem_email = (String)member.get(0).get("MEM_EMAIL"); 
		mem_hobby = (String)member.get(0).get("MEM_HOBBY"); 
		mem_job = (String)member.get(0).get("MEM_JOB"); 
		mem_tel = (String)member.get(0).get("MEM_TEL");
		mem_birth = (String)member.get(0).get("MEM_BIRTH");
		mem_gender = (String)member.get(0).get("MEM_GENDER");
		mem_pw = (String)member.get(0).get("MEM_PW");
		lv = (String)member.get(0).get("GRADE_LEVEL");
		pt =  Integer.parseInt(member.get(0).get("GRADE_POINT").toString());
		emails = mem_email.split("@");
		email = emails[0];
		domain = "@"+emails[1];
	}
	else{
		mem_id = "비회원";
		lv="없음";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
var mem_id = '<%=mem_id%>'
var mem_name = '<%=mem_name%>'
var mem_addr = '<%=mem_addr%>'
var mem_email = '<%=mem_email%>'
var mem_hobby = '<%=mem_hobby%>'
var mem_job = '<%=mem_job%>'
var mem_tel = '<%=mem_tel%>'
var mem_birth = '<%=mem_birth%>'
var mem_gender = '<%=mem_gender%>'
var email = '<%=email%>'
var domain = '<%=domain%>'
var mem_pw = '<%=mem_pw%>'
var point = '<%=pt%>'
var level = '<%=lv%>'
var msg_count=0;
</script>
<head>
<%@include file="./commonUI.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
  <div class="ui fixed inverted menu">
    <div class="ui container">
      <a href="../../main/main.jsp" class="header item">
        <img class="logo" src="../../image/logo.png" style="width:100px; heigth:100px">
      </a>
      <a href="../../main/main.jsp" class="item">Home</a>
      <div class="ui simple dropdown item">
      	  메뉴 <i class="dropdown icon"></i>
        <div class="menu">
          <a class="item" href="javascript:mlist()">회원정보</a>
          <a class="item" href="../../notice/notice.jsp">공지사항</a>
          <a class="item" href="#">혼자페이지</a>
          <a class="item" href="#">만남페이지</a>
          <div class="divider"></div>
          <div class="header">보조 메뉴</div>
          <div class="item">
            <i class="dropdown icon"></i>
            	로그인
            <div class="menu">
              <a class="item" href="../../member/login/login.jsp">로그인</a>
              <a class="item" href="../../member/login/logout.jsp">로그아웃</a>
            </div>
          </div>
        </div>
      </div>
      <div class="right item"><script>document.write(level)</script></div>
      <div class="item">point:<script>document.write(point)</script></div>
      <div class="item"><script>document.write(mem_id)</script></div>
	  <a class="item" href="javascript:messageBox()">
	    <i class="icon mail"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> 메시지
	    </font></font><div class="ui red label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><span id="msg_count">0</span></font></font></div>
	  </a>
	</div>
  </div>
  <script type="text/javascript">
  	function mlist(){
  		if(mem_id!='비회원'){
  		location.href="../../member/meminfo/mlist.jsp";
  		}
  		else{
  			alert("로그인 후 이용 가능합니다")
  		}
  	}
  	function messageBox(){
  		if(mem_id!='비회원'){
  			cmm_window_popup("../../member/message/messageBox.jsp?mem_id="+mem_id, 800, 800, "메시지함");
  		}
  		else{
  			alert("로그인 후 이용 가능합니다")
  		}
  	}
  	function msgCount(){
  		var param = "mem_id="+mem_id
  		$.ajax({
  			method:"post",
  			url:"../../message/empty/allUnReadMsg.test",
  			data:param,
  			success:function(data){
  				$("#msg_count").text(msg_count);
  			},
  			error:function(data){
  				alert("메시지 전달 오류")
  			}
  		})
  	}
  	$(document).ready(function(){
  		if(mem_id!='비회원'){
		msgCount();
  		}
  		else{
  			
  		}
  	})
  </script>
</body>
</html>