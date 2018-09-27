<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
          <a class="item" href="../../member/meminfo/mlist.jsp">회원정보</a>
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
      <div class="right item">level</div>
      <div class="item">point</div>
    </div>
  </div>
</body>
</html>