<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../Semantic/semantic.css" />
<script src="../Semantic/js/jquery-1.12.0.js"></script>
<script src="../Semantic/semantic.js"></script>
<title>리스트</title>
<script type="text/javascript">

$(document).ready(function(){
	
	// 리스트 이벤트
	
	var cnt = 0;
	
	$("#g_insert").click(function(){
		
		location.href="./write.jsp";
		
	});
	
	$("#list_l").click(function(){
		cnt = 1;
		
		if(cnt == 1){
			
		$("#list_1").text("1");
		$("#list_2").text("2");
		$("#list_3").text("3");
		$("#list_4").text("4");
			
		}
		
	});
	
	$("#list_r").click(function(){
		cnt = 0;
		
		if(cnt == 0){
			
		$("#list_1").text("5");
		$("#list_2").text("6");
		$("#list_3").text("7");
		$("#list_4").text("8");
		
		}
	});
	// 리스트 이벤트 끝
	
	$("#list_1").click(function(){
		
	});
	
	$("#list_2").click(function(){
		
	});
	
	$("#list_3").click(function(){
		
	});
	
	$("#list_4").click(function(){
		
	});
	
	// 베스트 조회수 글
	
	$("#best_1").click(function(){
		alert("눌림");
	});
	
})

</script>
</head>
<body>
<br>
<br>
<br>
<!-- 로고 -->
<table align="center" width="850px" height="200px">
<tr><td align="center"><img src="./images/logo.png"></td></tr>
</table>
<!-- 로고 끝 -->

<!-- 테이블 위 -->
<table align="center" width="900px" height="100px">
<tr>
<td align="center">
<font size="10" color="black">혼밥 게시판</font>
</td>
</tr>
</table>
<!-- 테이블 위 끝  -->

<!-- 전체 틀 -->
<table width="900px" height="1000px" align="center">
<!-- 중 헤드 -->
<tr>
<td>
<!--  조회수 업 -->
<table width="890px" height="230px" align="center">
<!-- 조회수 헤드  -->
<thead>

<tr>
<td align="center" colspan="4" height="100px"><font size="5" color="black"><strong>월간 최고 조회수 리뷰</strong></font></td>
</tr>

</thead>
<!-- 조회수 헤드  끝 -->
<tr height="180px">
<td align="center"><img src="./images/1.jpg" width="215px" height="200px"></td>
<td align="center"><img src="./images/2.jpg" width="215px" height="200px"></td>
<td align="center"><img src="./images/3.jpg" width="215px" height="200px"></td>
<td align="center"><img src="./images/4.jpg" width="215px" height="200px"></td>
</tr>
<!-- 버튼 이벤트 라인  -->
<tr>
<td id="best_1" align="center" width="200px">
<pre><font size="2" color="black"><strong>가산동 돈까스 맛집!! 리뷰</strong></font>

조회수: 5250192</pre>
</td>

<td align="center" width="200px">
<pre><font size="2" color="black"><strong>치맥은 역시 강남! 치밥 치맥집</strong></font>

조회수: 4432134</pre>
</td>

<td align="center" width="200px">
<pre><font size="2" color="black"><strong>혼밥 추천합니다!!</strong></font>

조회수: 3387123</pre>
</td>

<td align="center" width="200px">
<pre><font size="2" color="black"><strong>E마트 푸드코트 추천!</strong></font>

조회수: 194720</pre>
</td>
<!-- 버튼 이벤트 라인 끝 -->
</tr>

</table>
<!--  조회수 업 -->
</td>
</tr>
<!-- 중 헤드 -->

<tr>
<td>
<!-- 목록  -->
<table align="center" class="ui unstackable table">
  <thead>
    <tr>
    <th>게시글 번호</th>
      <th>작성자</th>
      <th>제목</th>
      <th class="right aligned">조회수</th>
    </tr>
  </thead>
  <!-- 게시글 목록 -->
  <tbody>
  <!-- 최신 1 -->
    <tr id="n_1" onMouseDown="this.style.backgroundColor='#F6CED8'"
          onMouseUp="this.style.backgroundColor=''">
    <td>1</td>
      <td>비트광부</td> <!-- 작성자 -->
      <td>님들아 님들아</td> <!-- 제목 -->
      <td class="right aligned">1</td> <!-- 조회수 -->
    </tr>
    <!-- 최신 2 -->
    <tr id="n_2" onMouseDown="this.style.backgroundColor='#F6CED8'"
          onMouseUp="this.style.backgroundColor=''">
    <td>2</td>
      <td>송해아조씨</td>
      <td>전부부부부 노래자랑</td>
      <td class="right aligned">5353</td>
    </tr>
    <!-- 최신 3 -->
    <tr id="n_3" onMouseDown="this.style.backgroundColor='#F6CED8'"
          onMouseUp="this.style.backgroundColor=''">
    <td>3</td>
      <td>금잔디</td>
      <td>잔디잔디금잔디</td>
      <td class="right aligned">232</td>
    </tr>
    <!-- 최신 4 -->
    <tr id="n_4" onMouseDown="this.style.backgroundColor='#F6CED8'"
          onMouseUp="this.style.backgroundColor=''">
    <td>4</td>
      <td>어딜가나</td>
      <td>이번주어디가지</td>
      <td class="right aligned">35554</td>
    </tr>
    <!-- 최신 5 -->
    <tr id="n_5" onMouseDown="this.style.backgroundColor='#F6CED8'"
          onMouseUp="this.style.backgroundColor=''">
    <td>5</td>
      <td>삼총사</td>
      <td>범인은이안에</td>
      <td class="right aligned">45151</td>
    </tr>
    
    <!-- 최신 6 -->
    <tr id="n_6" onMouseDown="this.style.backgroundColor='#F6CED8'"
          onMouseUp="this.style.backgroundColor=''">
    <td>6</td>
      <td>너래쟁이</td>
      <td>강남 최고의 맛집을 늬들이 아라?</td>
      <td class="right aligned">6515</td>
    </tr>
    
    <!-- 최신 7 -->
    <tr id="n_7" onMouseDown="this.style.backgroundColor='#F6CED8'"
          onMouseUp="this.style.backgroundColor=''">
    <td>7</td>
      <td>감사합니다람쥐</td>
      <td>도토리묵 먹을사람!</td>
      <td class="right aligned">1151</td>
    </tr>
    
    <!-- 최신 8 -->
    <tr id="n_8" onMouseDown="this.style.backgroundColor='#F6CED8'"
          onMouseUp="this.style.backgroundColor=''">
    <td>8</td>
      <td>삼합회</td>
      <td>진정한 회는 강릉!! 주문진</td>
      <td class="right aligned">5112</td>
    </tr>
    
    <!-- 최신 9 -->
    <tr id="n_9" onMouseDown="this.style.backgroundColor='#F6CED8'"
          onMouseUp="this.style.backgroundColor=''">
    <td>9</td>
      <td>숲속의헌터</td>
      <td>님들 직화구이 먹어봤삼?</td>
      <td class="right aligned">7151</td>
    </tr>
    
    <!-- 최신 10 -->
    <tr id="n_10" onMouseDown="this.style.backgroundColor='#F6CED8'"
          onMouseUp="this.style.backgroundColor=''">
    <td>10</td>
      <td>보글보글스폰지</td>
      <td>오징어 물회 맛집은?</td>
      <td class="right aligned">1551</td>
    </tr>
    
  </tbody>
  <!-- 게시글 목록 -->
  <tfoot>
    <tr><th colspan="5">
      <div class="ui right floated pagination menu">
        <a class="icon item">
          <i class="left chevron icon" id="list_l"></i>
        </a>
        <a class="item" id="list_1" name="list_1">1</a>
        <a class="item" id="list_2" name="list_2">2</a>
        <a class="item" id="list_3" name="list_3">3</a>
        <a class="item" id="list_4" name="list_4">4</a>
        <a class="icon item">
          <i class="right chevron icon" id="list_r"></i>
        </a>
      </div>
    </th>
  </tr></tfoot>
</table>
<!-- 목록  -->
</td>
</tr>
<tr>
<td>
<!-- 하단  -->
<table align="center">
<tr>
<td width="300px" height="60px" align="left">
<!-- 검색 하기 -->
<div class="ui search">
  <div class="ui icon input">
    <input class="prompt" type="text" placeholder="검색하세요" width="200px">
    <i class="search icon"></i>
  </div>
  
<!-- 선택 검색 -->
<select name="bab_category" id="bab_category">
<option value="혼놀">제목</option>
<option value="혼술">작성자</option>
</select>
<!-- 선택 검색 끝 -->

  <div class="results"></div>
  
</div>
<!-- 검색 하기  끝-->
</td>
<td width="600px" height="60px" align="right">
	<button class="ui primary button" id="g_insert" name="g_insert"> 
  글 쓰기
</button>
</td>
</tr>
</table>
<!-- 글쓰기 버튼 -->
<!-- 하단  -->
<!-- 글쓰기 버튼 끝  -->
</td>
</tr>
</table>
<!-- 전체 틀 -->
<br>
<br>
<br>
</body>
</html>