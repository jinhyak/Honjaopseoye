<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/commonUI.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('.ui.dropdown')
		  .dropdown()
		;
	})

	function chooseMenu(){
		var chooseMenu = $("input[type=radio][name=frequency]:checked").val();
		
		$.ajax({
			method:"POST"
		   ,url:"./storeAdd/"+chooseMenu+"Add.jsp" //check박스의 값을 받아 해당하는 입력 페이지를 부름
		   ,success:function(result){
			   $("#storeInput").html(result);
		   }
		   ,error:function(xhrObject){
			   alert(xhrObject.responseText);
		   }
		});
	}//////////////////end of chooseMenu

</script>
</head>
<body style="min-width: 588px;">
<div class="ui segment">

<!-- ====================본문===================== -->
  <div class="ui basic segment text container one column grid">
  	<div class="column">
  		<h3>매장을 등록하세요</h3>
  	</div>
  <!--================== 선택매뉴 시작 =============== -->
  	<div class="column">
  		<div class="ui form" id="chooseMenu">
  			<div class="inline fields">
    			<label>매장 구분 선택</label>
    			<div class="field">
			      <div class="ui radio checkbox">
        			<input type="radio" name="frequency" checked="checked" value="matjip">
        			<label>맛집 등록</label>
      			  </div>
    		    </div>
    		<div class="field">
      			<div class="ui radio checkbox">
        			<input type="radio" name="frequency" value="suljip">
        			<label>술집 등록</label>
      			</div>
    	   </div>
    	   <div class="field">
      		<div class="ui radio checkbox">
        		<input type="radio" name="frequency" value="nolgot">
        		<label>놀곳 등록</label>
      	  	</div>
    	  </div>
    	  <div class="ui button" id="choiceButton" onclick="chooseMenu()">
    	  	확인
    	  </div>
  		</div>
	  </div>
	</div>
	<!--================== 선택매뉴 끝 =============== -->
	<!-- ====================가게정보 입력 시작===================== -->
	<div class="column" id="storeInput">
		ajax처리
	</div>
  	<!-- ====================가게정보 입력 끝===================== -->
  </div>
<!-- ====================본문===================== -->
</div>
</body>
</html>