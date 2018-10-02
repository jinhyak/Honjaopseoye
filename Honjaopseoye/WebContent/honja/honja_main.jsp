<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//핫플레이스 받아내는 코드


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b088e12dec9746ba7e26f57a6f7c9256"></script>
<script type="text/javascript">

//화면이 시작했을때 보여줄 지도(초기좌표같은거 설정해 주면 될듯)
function showMap(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	
	 mapContainer.style.width = "1100px";
	 mapContainer.style.height = "509px"; 

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption); 
}///////////////////////end of showMap

///////////////////////////////////검색 기능 함수
function search(){
	$("#searchButton").click(function(){
		//앞에는 놀,술,먹 셋중 하나 구분 뒤에는 검색어 
		//로직에서 분기 해준다음 검색해야함
		var param = "choice="+$("#menuBtns").find('.active').val()+"&"+"searchWord="+$("#searchBox").val();
		alert(param);
		
		$.ajax({
			method:"POST"
		   ,url:"../hotplace/show/select.test"
		   ,data:param //파라미터로 검색어 + 조건 넘김
		   ,success:function(result){
			   //#hotplaceList에 for문 써서 나온거 뿌려줌
			   $("#hotPlaceList").html(result);
		   }
		   ,error:function(xhrObject){
			   alert(xhrObject.responseText);
		   }
		});
	});////end of click
	
}///////////////////end of search

/////////////////////매뉴 버튼 이벤트 처리 함수
function chooseMenu(){
	$("#menuBtns").find("button").click(function(){
		$("#menuBtns").find("button").attr("class","ui button")
		$(this).attr('class','ui active button')
		
		var kind = "#"+$("#menuBtns").find(".active").attr('id')+"Kind"
		alert(kind)
		
		$.ajax({
			method:"POST"
		   ,url:"./kindMenu.jsp"
		   ,data:{"kind":kind}
		   ,success:function(result){
				$("#kind").html(result);
		   }
		   ,error:function(xhrObject){
			   alert(xhrObject.responseText);
		   }
		})
		
		$("#kind").html($(kind))
		$('.ui.dropdown')
		  .dropdown()
		;
						 
						 
		
		
	});
}/////////////////end of choseMenu

function showHotplace(){//핫플보기 버튼 누르면 사이드 바 나오면서 핫플 리스트 보임
	
	$('#showHot').click(function(){
		var showHotClass = $('#showHot').attr('class');
		if(showHotClass == 'ui toggle right floated button'){
			$('#showHot').attr('class','ui toggle right floated active button')
			$('#sidebar').sidebar('toggle');
			
			
		}
		else{
			$(this).attr('class','ui toggle right floated button')
			$('#showHot').attr('class','ui toggle right floated button')
			$('.ui.sidebar').sidebar({
				context: $('.top.segment')
				 ,dimPage: false //사이드바 열때 화면색 변하는거 막음
				 ,closable : false //pusher눌렀을때 sidebar 들어가는거 막음
			}).sidebar('toggle')
			
		}
	});
	
}
	/*function kind(){
		if($("#matjip").click){
			alert("술집");
			$("#kind").html($("#matjipKind"))
		}
		else if($("#suljip").click){
			alert("술집");
			$("#kind").html($("#suljipKind"))
		}
		else if($("#nolgot").click){
			$("#kind").html($("#nolgotKind"))
		}
		
		$('.ui.dropdown')
		  .dropdown()
		;
			
	}*/

	

</script>
<title>Insert title here</title>
</head>
<body>

<%@include file="../include/subtop.jsp" %>

<div class="ui basic segment">
<!-- ====================================검색과 글쓰기 버튼 ====================================-->
  <div class="ui basic segment text container one column grid">
	<div class="column"style="padding-bottom: 0px;">
  		<!--===== 밥,술,놀 매뉴 버튼 =======-->
  	   	<div class="three ui fluid buttons" id="menuBtns">
 			<button class="ui active button" id="matjip" value="맛집" onClick="chooseMenu()">맛집</button>
  			<button class="ui button" id="suljip" value="술집">술집</button>
  			<button class="ui button" id="nolgot" value="놀곳">놀곳</button>
		</div>
  	   	<!--===== 밥,술,놀 매뉴 버튼 끝 =====-->
  	</div>
  	<div class="column" style="padding-top: 0px;padding-bottom: 0px;">
  		<!-- ======== 검색창 ========-->
		<div class="ui fluid action input">	
  			<input type="text" placeholder="키워드를 선택 후 검색해보세요" id="searchBox">
 			<button class="ui button" id="searchButton">검색</button>
		</div>
		<!-- ======= 검색창 끝 =======-->
    </div>
    <div class="column" style="padding-top: 4px;">
    <!--===== 상세검색 드롭다운 시작 ======-->
    	<div class="ui four column grid">
    		<div class="column"style="padding-right: 2px;" id="kind">
				<div class="ui fluid selection dropdown" id="matjipKind">
  					<input type="hidden">
 					<i class="dropdown icon"></i>
  					<div class="default text">분류</div>
  				<div class="menu">
    				<div class="item" data-value="2100">한식</div>
    				<div class="item" data-value="2101">중식</div>
    				<div class="item" data-value="2102">일식</div>
    				<div class="item" data-value="2103">양식</div>
    				<div class="item" data-value="2104">분식</div>
    				<div class="item" data-value="2105">기타</div>
  				</div>
				</div>
    		</div>
    		<div class="column"style="padding-left: 2px;">
    			<div class="ui fluid selection dropdown">
  					<input type="hidden" name="gender">
 					<i class="dropdown icon"></i>
  					<div class="default text">가격대</div>
  				<div class="menu">
    				<div class="item" data-value="0">~만원</div>
    				<div class="item" data-value="1">만원~2만원</div>
    				<div class="item" data-value="2">2만원~3만원</div>
    				<div class="item" data-value="3">3만원~4만원</div>
    				<div class="item" data-value="4">4만원~5만원</div>
    				<div class="item" data-value="5">5만원~</div>
  				</div>
				</div>
    		</div>    	
    	</div>
    
    <!--===== 상세검색 드롭다운 끝 ========-->
    
    </div>
  </div>
<!-- ===================================검색과 글쓰기 버튼 끝 ===================================-->
<!--=================================== 지도와 핫플레이스 목록================================  -->
<div class="ui basic segment container">
   		
  		<button class="ui toggle right floated active button" id="showHot">핫플보기</button>
  		<button class="ui right floated button" id="showAll">전체보기</button>
  		
 		
  <div class="ui top attached segment pushable">
  	<div class="ui right very wide sidebar" id="sidebar">
  		<!-- 핫플레이스 뿌려줄 div grid태그 -->
		<div class="ui two column grid" id="hotPlaceList"style="width: 475px;margin-right: 0px;margin-bottom: 0px;margin-left: 0px;margin-top: 0px;">
		<!-- result.jsp 뿌려질 곳 -->

		</div>
		<!-- 핫플레이스 뿌려줄 div grid끝 -->
  	</div>
  	<!--======= 지도 시작 =======-->
    <div class="pusher" id="pusher">
      		<div id="map" style="width:100%;"></div>
  	</div>
  	<!--======= 지도 끝  =======-->
  </div>
</div>
<!--================================== 지도와 핫플레이스 목록 끝================================  -->
</div>
<script type="text/javascript">
$(document).ready(function(){
	showMap();
	search();
	
	showHotplace();
	
	//kind();
})/////////////////////////////////////////////////////////////////end of ready
</script>

<%@include file="../include/bottom.jsp" %>
</body>
</html>