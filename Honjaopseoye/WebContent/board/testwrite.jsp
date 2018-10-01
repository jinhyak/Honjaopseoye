<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="hj.common.HangulConversion" %>
    <%
    HangulConversion hc = new HangulConversion();
    String bab_title = hc.toKor(request.getParameter("bab_title"));
    String g_1 = hc.toKor(request.getParameter("g_1"));
    String post_url = hc.toKor(request.getParameter("post_url"));
    String img_1 = hc.toKor(request.getParameter("img_1"));
    String bab_category = hc.toKor(request.getParameter("bab_category"));
    %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="../Semantic/js/jquery-1.12.0.js"></script>
<script src="../Semantic/semantic.js"></script>
<script src="../Semantic/js/commons.js"></script>
<link rel="stylesheet" href="../Semantic/semantic.css" />
<title>글 확인</title>
</head>
<body>
<div align="center">
<!-- 수정해보자 -->

<br>
<br>
<h1 class="ui header">제목: <%=bab_title %></h1>

<p>카테고리:&nbsp; <%=bab_category %></p>
<br>
<!-- 게시글 -->
<p>


<%=g_1 %>



</p>
<!--  게시글 끝 -->
<br>


<!--  -->

<br>
<div id="player"></div>


<!-- 동영상 올리기 코드 -->
<script>
var v = '<%= post_url%>';
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);


      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', { // 동영상 환경 설정
          height: '360',
          width: '600',
          videoId: v,
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      function onPlayerReady(event) {
        event.target.playVideo(); // 해당 동영상 플레이 재생
      }

     var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
        //  setTimeout(stopVideo, 6000); // 재생후 6초가 지나면 재생 멈춤
          done = true; 
        }
      }
      function stopVideo() {
        player.stopVideo();
      }
    </script>
    <!-- 동영상 올리기 코드 끝-->
    <br>
    <br>
    </div>
<%-- 
동영상:
<br>
<div id="player"></div>


이미지:
<br>
<img src="./im/<%= img_1%>">
<br>
<img src="./im/<%= img_2%>">
<br>
<img src="./im/<%= img_3%>">
<br>
<img src="./im/<%= img_4%>">
<br>
<img src="./im/<%= img_5%>"> --%>


</body>
</html>