<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../include/commonUI.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글쓰기</title>
<script type="text/javascript">

function met() {
	
	var f = document.f_l.g_1;
	
	var g_1; // 텍스트
	var snb; // 띄어쓰기
	var br; // 줄바꿈

	if (f.value.length == 1000) {
		//alert("g_2로 넘어갑니다.");
		//f.value.length = 0;
		g_1 = f.value; // 컬럼1
		alert("더 이상 글자를 추가할 수 없습니다.");
	} else if(event.keyCode == 13){
         //alert("엔터누름");
         f.value += "<br>";
    } else if(event.keyCode == 32){
		//alert("스페이스바누름");
		f.value += "&nbsp;";
	}
}
	
	var img_1; // 이미지1
	
	// 홈페이지가 시작하면....
  	$(document).ready(function() {
		// 필드 값
	var f = document.f_l.g_1; // 텍스트 에리어 값
		// 이미지1 버튼을 눌렀을 때

		$("#b_ok").click(function() {
			img_1 = $("#img_1").val();
			img_1 = img_1.substring(17, 12);
			f.value += "<br><img src='"+"./im/" + img_1 + "'>" + "<br>";
			alert("이미지가 추가 되었습니다.");
		});


		// 레디 끝
	})

	// 이미지 미리보기를 계속 변경해줌...
	$(function() {
		$("#img_1").on('change', function() {
			readURL(this);
		});
	});
	// 이미지 미리보기 정보
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>
	<div align="center">
		<br> <br>
		<!-- 게시판 등록 -->
		<form method="post" action="./testwrite.jsp" id="f_l" name="f_l">
			<table border="1" width="800px" height="480px">
				<thead align="center">
					<font size="5" color="black">글 쓰기</font>
				</thead>
				<tr>
					<td><select name="bab_category" id="bab_category">
							<option value="혼놀">혼놀</option>
							<option value="혼술">혼술</option>
							<option value="혼밥" selected="selected">혼밥</option>
					</select>
						<div class="ui input focus">
							<input type="text" placeholder="제목입력"
								style="width: 740px; height: 27px;" id="bab_title"
								name="bab_title">
						</div>
						<div class="ui input focus">
							<br> <input type="text" style="width: 140px; height: 18px;"
								placeholder="동영상URL" id="post_url" name="post_url">
						</div> <input align="middle" type="file" id="img_1" name="img_1"
						style="width: 20px; height: 20px;" accept="*.jpg"> <!-- <input type="button" value="이미지 추가" onClick="met()"> -->
						<div class="ui form">
							<div class="field" align="center">
								<textarea style="width: 800px; height: 800px;" id="g_1"
									name="g_1" onkeydown="met()">
							</textarea>
								<br> <br>
								<button class="negative ui button" id="c_b" name="c_b">취소하기</button>
								&nbsp;&nbsp;&nbsp;
								<button class="positive ui button" id="i_b" name="i_b">등록하기</button>
								<input type="submit">
							</div>
						</div></td>
					<td>
						<table width="200px" height="480px">
							<thead>
								<tr>
									<td align="center">이미지 파일 미리보기</td>
								</tr>
							</thead>
							<tr>
								<td align="center">
									<form id="form1" runat="server">
										<img align="middle" id="blah" src="#" alt=""
											width="300px" height="250px" /> <br> <br> <input
											type="button" id="b_ok" name="b_ok" value="올리기"> <br>
										<br>
									</form>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
	</div>
</body>
</html>