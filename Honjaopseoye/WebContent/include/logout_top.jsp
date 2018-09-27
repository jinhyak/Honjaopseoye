<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> <%-- <!-- var a = '<%=%>'는  null일경우 'null'인 문자열로 인식  --> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="./commonUI.jsp" %>
<title>상단</title>
</head>
<body>
<div class="floating">
<div class="ui inverted vertical masthead center aligned segment">

    <div class="ui container">
      <div class="ui large secondary inverted pointing menu">
        <a class="toc item">
          <i class="sidebar icon"></i>
        </a>
        <a class="active item">공지사항</a>
        <a class="item">Q&A</a>
        <a class="item">혼밥하자</a>
        <a class="item">인사하자</a>
        
        <div class="ui grid">
        <div class="four wide two wide large screen one wide widescreen column"></div>
        <div class="four wide two wide large screen one wide widescreen column">
        
        </div>
        <div class="four wide two wide large screen one wide widescreen column">
        
        </div>
        <div class="four wide two wide large screen one wide widescreen column"></div>
      </div>
        
        <div class="right item">
       <!-- 나중에 컨테이너 처리 할거임 -->
        <!-- #########################로그인 버튼 있는 로그인 폼 시작################################ --> 
      
       <div class="ui text container"> 
       	<div id="loginForm">
          <a class="ui inverted button" href="../member/login/login.jsp">로그인</a>
          <a class="ui inverted button" href="../member/join/gaip.jsp">회원가입</a>
        </div>
        </div>
          <!-- ########################로그인 버튼 있는 로그인 폼 끝################################# --> 
        </div>
      </div>
    </div>
			<div class="ui text container">
      <h1 class="ui inverted header">
       <br>
        <br>
         <br>
          <br>
        혼밥 혼술 입니당
      </h1>
      <br>
       <br>


    </div>

  </div>

</div>
</body>
</html>