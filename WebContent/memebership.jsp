<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff04a6a0fe8ec11ac7dedd6c2b6ce24c"></script>
<script type="text/javascript" src="../js/jquery-1.12.0.js"></script>
<script src="../Semantic/semantic.js"></script>
<script src="../js/commons.js"></script>
<link rel="stylesheet" href="../Semantic/semantic.css" />
<title>만남 page</title>
</head>
<body>

<div class="ui segment">
<div id="map" style="width:500px;height:400px;">
</div>
</div>


<script type="text/javascript">
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
var mapTypeControl = new daum.maps.MapTypeControl();

//지도 타입 컨트롤을 지도에 표시합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

function getInfo() {
 // 지도의 현재 중심좌표를 얻어옵니다 
 var center = map.getCenter(); 
 
 // 지도의 현재 레벨을 얻어옵니다
 var level = map.getLevel();
 
 // 지도타입을 얻어옵니다
 var mapTypeId = map.getMapTypeId(); 
 
 // 지도의 현재 영역을 얻어옵니다 
 var bounds = map.getBounds();
 
 // 영역의 남서쪽 좌표를 얻어옵니다 
 var swLatLng = bounds.getSouthWest(); 
 
 // 영역의 북동쪽 좌표를 얻어옵니다 
 var neLatLng = bounds.getNorthEast(); 
 
 // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
 var boundsStr = bounds.toString();
 
 var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
 message += '경도 ' + center.getLng() + ' 이고 <br>';
 message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
 message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
 message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
 message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
 
 // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
 // ex) console.log(message);
	alert(message)
}
</script>


<input type="button" onclick="getInfo()"> 
</body>
</html>