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
<title>�� Ȯ��</title>
</head>
<body>
<div align="center">
<!-- �����غ��� -->

<br>
<br>
<h1 class="ui header">����: <%=bab_title %></h1>

<p>ī�װ�:&nbsp; <%=bab_category %></p>
<br>
<!-- �Խñ� -->
<p>


<%=g_1 %>



</p>
<!--  �Խñ� �� -->
<br>


<!--  -->

<br>
<div id="player"></div>


<!-- ������ �ø��� �ڵ� -->
<script>
var v = '<%= post_url%>';
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);


      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', { // ������ ȯ�� ����
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
        event.target.playVideo(); // �ش� ������ �÷��� ���
      }

     var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
        //  setTimeout(stopVideo, 6000); // ����� 6�ʰ� ������ ��� ����
          done = true; 
        }
      }
      function stopVideo() {
        player.stopVideo();
      }
    </script>
    <!-- ������ �ø��� �ڵ� ��-->
    <br>
    <br>
    </div>
<%-- 
������:
<br>
<div id="player"></div>


�̹���:
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