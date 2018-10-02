<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../Semantic/semantic.css" />
<script src="../Semantic/js/jquery-1.12.0.js"></script>
<script src="../Semantic/semantic.js"></script>
<title>글쓰기</title>
<!--이미지 미리보기 스크립트 구간 -->
<script type="text/javascript">

// 이미지 미리보기
$(document).ready(function(){
	
	var text = document.f_board.t_text;
	
 	$(function() {
		$("#img_file").change(function() {
			readURL(this);
		});
	});
	
	function readURL(input) {
		alert("이미지");
		
			if (input.files && input.files[0]) {
				
				var reader = new FileReader();
			
					reader.onload = function(e) {
						$('#blah').attr('src', e.target.result);
					}

				reader.readAsDataURL(input.files[0]);
				} // if문
				
	} // readURL함수  
	
	
	$("#b_img").click(function(){
		
		var formData = new FormData(document.getElementById('f_board'));
		var img_file = $("#img_file").val();
		img_file = img_file.substring(12);
		
		// 이미지 등록 처리
		$.ajax({
			method:"POST"
		   ,url:"../board/empty/imageAjax.test"
		   ,data:formData
		   ,enctype:"multipart/form-data"
		   ,contentType: false
		   ,processData: false
		   ,success:function(formData){
			   
				//img_file = img_file.substring(12);
				text.value += "<br>" + "<img src='./images/" + img_file + "'>" +"<br>";
				alert("이미지 태그가 추가 되었습니다.");
			   
		   }
		   ,error:function(xhrObject){
			   alert("error:"+xhrObject.responseText);
		   }
		});
		
	
	});
	
	
	$("#b_cancel").click(function(){
		location.href="./boardList.jsp";
	});
	
}) /* 레디 끝  */



</script>
<!-- 이미지 미리보기 스크립트 구간  끝-->

<!-- 바디 스타일 -->
<style>
/* body {
	background-image: url('writerBackground.jpg');
} */

</style>
<!-- 바디 스타일 끝 -->

</head>


<body>
<!-- 상단  -->

<!-- 상단 끝 -->


<!-- @@@@@@@@@@@@@@@@@@@@ 게시판 작성 form @@@@@@@@@@@@@@@@@@@@  -->
<br>
<br>
<br>
<form method="Post" action="./wView.jsp" id="f_board" name="f_board">

<!-- 입력 게시판 테이블   -->
<table align="center" border="1" width="800px" height="1000px" bgcolor="white">
<!-- 게시판 머리  -->
<thead align="center" style="width:800px; height:200px;">
<tr>
<td><img src="./images/logo.png" width="800px" height="200px"></td>
</tr>
</thead>
<!-- 게시판 머리 끝  -->


<!-- 테스트 -->


<!-- 테스트 -->



<!-- 게시판 입력 GUI  -->

<tbody style="width:800px; height:500px;" >
<tr>
<!-- 기능 메뉴 -->
<td width="800px" height="100px">

<input type="text" style="width: 260px; height: 18px;" placeholder="동영상URL" id="post_url" name="post_url">
<input type="file" id="img_file" name="img_file" accept=".gif, .jpg, .png">
</td>
<!-- 기능 메뉴 끝 -->
</tr>

<!-- 글쓰기 -->
<tr>
<!-- 콤보박스  -->
<td width="800px" height="400px">
<select name="bab_category" id="bab_category">
<option value="혼놀">혼놀</option>
<option value="혼술">혼술</option>
<option value="혼밥" selected="selected">혼밥</option>
</select>
&nbsp;&nbsp;
<!-- 제목입력  -->
<div class="ui input focus">
<input type="text" placeholder="제목입력" style="width:730px; height:23px;" id="bab_title" name="bab_title">
</div>
<!-- 글 입력 -->
<textarea style="width: 800px; height:600px;" id="t_text" name="t_text"></textarea>
<!-- 글 입력끝 -->

</td>
<!-- 글쓰기 끝 -->
</tr>

</tbody>

<!-- 게시판 입력 GUI 끝  -->

<!-- 테이블 하단 -->

 <tfoot align="center" style="width:800px; height:300px;">
        <!-- 이미지 미리보기  -->
        <!-- 이미지 미리보기 타이틀  -->
        <tr>
        <td><font size="3" color="blue">@이미지 미리보기@</font></td>
        </tr>
        <tr>
            <td width="200px" height="200px" align="center">
            <br>
			<img align="middle" id="blah" src="#" alt="" width="200px" height="200px" />
               <br>
               <br>
               <div class="ui animated button" tabindex="0" id="b_img" name="b_img">
  				<div class="visible content">이미지 등록</div>
 				 <div class="hidden content">
 				   <i class="right arrow icon"></i>
 					 </div>
						</div>
						<br>
               <br>
            </td>
        </tr>
        
        <!-- 버튼 GUI  -->
        <tr>
        <td width="800px" height="100px">
        <button class="negative ui button" id="b_cancel" name="b_cancel">취소하기</button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="positive ui button" id="b_insert" name="b_insert">등록하기</button>
        </td>
        </tr>
        
    </tfoot>

<!-- 테이블 하단 끝 -->

</table>

</form>
<!-- 입력 게시판 테이블 끝  -->


<br>
<br>
<br>

<!-- @@@@@@@@@@@@@@@@@@@@ 게시판 작성 form 끝 @@@@@@@@@@@@@@@@@@@@ -->

<!-- 하단  -->
