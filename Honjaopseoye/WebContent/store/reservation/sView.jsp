<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>예약하기</title>
<script type="text/javascript">

</script>
</head>
<body>
<%@ include file="../../include/include/subtop.jsp" %>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui header" style="margin-left: 150px;margin-right: 150px; margin-top: 100px;margin-bottom: 100px">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="ui field" style="height: 800px">
			<div class="ui stackable two column grid">
				<div class="ui column">
					<div class="ui segment">
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 말머리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div class="ui center aligned basic segment">
						<div class="ui header"><h2>가게이름</h2></div>
							<div class="ui large image">
								<img id="large_img" src="../../image/person.PNG">
							</div>
							<p/>
							<div class="ui tiny images">
								<img class="ui image" src="../../image/with.jpg">
								<img class="ui image" src="../../image/with.jpg">
								<img class="ui image" src="../../image/with.jpg">
								<img class="ui image" src="../../image/with.jpg">
							</div>
						</div>
						<div class="ui divider"></div>
						* 네이버예약 성인 39,800원<br>
						* 성인 기준 10 이상 50인 이하 단체고객<br>
						* 17:30~22:00<br>
						* 네이버 예약페이 할인적용시, 타 쿠폰 및 행사와 중복적용이 불가합니다.<br>
						세계적인 뷔페 토다이는 1985년 스시와 해산물 뷔페 컨셉으로 미국의 캘리포니아주에 첫 매장을 연 이래 30년이상
						세계적으로 성장해온 글로벌 브랜드로, 중식, 양식, 일식, 한식 등 250가지의 메뉴를 선보이고 있습니다.<br>
						<div class="ui divider"></div>
						상세정보<br>
						단체예약 룸 정보<br>
						최소예약 가능인원 : 15인<br>
						정원 : 15인~50인<br>
						특이사항 : 마이크O, 빔프로젝트X<br>
						외부노출여부 : NO<br>
						<br>
						* 중요사항 : 온라인상으로 룸 좌석 확정이 어려우며, 매장상으로 유선상 확인이 필요합니다.
						자세한 내용은 토다이 명동점 (02-3783-4200)으로 문의주세요.<br>
					</div>
				</div>
				<div class="ui column">
					<div class="ui segment">
						<div class="ui form" id="f_reserv">
						<div class="ui two column internally celled padded grid">
							<div class="ui row">
								<div class="ui three wide column">
									<h4>날짜</h4>
								</div>
								<div class="ui column">
								<div class="field">
									<input type="text" id="datepicker" name="datepicker" placeholder="날짜를 선택하세요.">
								</div>
								</div>
							</div>
							<div class="ui row">
								<div class="ui three wide column">
									<h4>시간</h4>
								</div>
								<div class="ui column">
								<div class="field">
									<div class="ui input">
										<input type="text" id="reserv_time" name="reserv_time" placeholder="시간을 선택하세요." readonly>
									</div>
								</div>
								</div>
							</div>
							<div class="ui row">
								<div class="ui three wide column"></div>
								<div class="ui column">
									<button class="ui blue button" value="08:00">08:00</button>
									<button class="ui blue button" value="10:00">10:00</button>
									<button class="ui blue button" value="12:00">12:00</button>
									<button class="ui blue button" value="14:00">14:00</button>
									<div class="ui divider"></div>
									<button class="ui blue button" value="16:00">16:00</button>
									<button class="ui blue button" value="18:00">18:00</button>
									<button class="ui blue button" value="20:00">20:00</button>
									<button class="ui blue button" value="22:00">22:00</button>
								</div>
							</div>
							<div class="ui row">
								<div class="ui three wide column">
									<h4>인원</h4>
								</div>
								<div class="ui column">
								<div class="field">
									<div class="ui selection dropdown">
										<input type="hidden" id="reserv_people" name="reserv_people">
									  	<i class="dropdown icon"></i>
									  		<div class="default text">인원을 선택하세요</div>
									  	<div class="menu">
									    	<div class="item" data-value="1">1명</div>
									    	<div class="item" data-value="2">2명</div>
									    	<div class="item" data-value="3">3명</div>
									    	<div class="item" data-value="4">4명</div>
									    	<div class="item" data-value="5">5명</div>
									    	<div class="item" data-value="6">6명</div>
									    	<div class="item" data-value="7">7명</div>
									    	<div class="item" data-value="8">8명</div>
									    	<div class="item" data-value="9">9명</div>
									    	<div class="item" data-value="10">10명</div>
									  	</div>
									</div>
								</div>
								</div>
							</div>
							<div class="ui row">

								<button class="ui green fluid button" id="btn_reserv" type="submit">예약하기</button>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(function() {
	$("#datepicker").datepicker({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  dayNames: ['일','월','화','수','목','금','토'],
	  dayNamesShort: ['일','월','화','수','목','금','토'],
	  dayNamesMin: ['일','월','화','수','목','금','토'],
	  showMonthAfterYear: true,
	  changeMonth: true,
	  changeYear: true,
	  yearSuffix: '년',
	  minDate: +1,
	  maxDate: "+2Y"
	});
});
$('.dropdown').dropdown();
$('.blue.button').click(function () {
	var time = $(this).val();
	$("#reserv_time").attr('value', time);
});
</script>
<style>
.ui-datepicker{ font-size: 20px; width: 350px; }
.ui-datepicker select.ui-datepicker-month{ width:40%; font-size: 20px; }
.ui-datepicker select.ui-datepicker-year{ width:50%; font-size: 20px; }
</style>
<%@ include file="../../include/bottom.jsp" %>
</body>
</html>