<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	$('.ui.dropdown').dropdown();

})
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 주소등록 모달 기능 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			$('#dropdown').click(function(){
				$('#dropdown').dropdown()
			});
			$('.addr').click(function(){
				$('.addr').dropdown()
			});
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 도 select @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			function addr(){
				$('#modal_addr')
				.modal({
					centered:false
				})
				.modal('show');
				$.ajax({
					 method:'POST'
					,url:'../gubun/empty/doselect.test'
					,success:function(data){
						//alert(data);
						$('#menu_do').html(data);
					},error:function(xhrObject){
						   alert(xhrObject.responseText);
					   }
				})
			};
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 시 select @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			$('.addr').change(function(){
				var dos =$('#dos').text();
				var si = $('#si').text();
				var dong = $('#dong').text();
				if(dos=='도'){"도명을 선택해주세요"}
				else{
					var param = "zdo="+dos
					$.ajax({
						 method:"post"
						,data:param
						,url:"../gubun/empty/siselect.test"
						,success:function(data){
							$('#menu_si').html(data);
						},error:function(xhrObject){
							   alert(xhrObject.responseText);
						   }
					})
				}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 동 select @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
				if(si=='시'){"시명을 선택해주세요"}
				else{
					var param = "sigu="+si
					$.ajax({
						 method:"post"
						,data:param
						,url:"../gubun/empty/dongselect.test"
						,success:function(data){
							$('#menu_dong').html(data);
						},error:function(xhrObject){
							   alert(xhrObject.responseText);
						   }
					})
				}
			});
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 우편번호 select @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	function zipcode(){
		var dos =$('#dos').text();
		var si = $('#si').text();
		var dong = $('#dong').text();
		var address = $('#p_addr').val();
		//alert(address);
		cmm_window_popup("../member/join/address.jsp?zdo="+dos+"&sigu="+si+"&dong="+dong+"&address="+address, 600, 600, "상세주소 조회창")
	}

	function regist(){
		var addr = $('#p_addr').val()
		$('#store_addr').val(addr)
		var zip = $('#p_zip').val()
		$('#mem_zip').val(zip)
		$('#modal_addr')
		.modal('hide');
	}
	function cancel(){
		$('#modal_addr')
		.modal('hide');
	}
/* ----------------------------------------모달 끝---------------------------------------------- */	
/* -----------------------------------------파일 이름 inputtag에 넣어주는 함수 */ 
	function fileName(){
		
		var fileName = $('#fileinput').val();
		var clean = fileName.split('\\').pop();
	
		$('#store_img').attr('value',clean);
	}
	function sendData(){
		var data = $("form[name=f_matjip]").serialize() ;

	}
	/* ---------------------------------end of fileName */
	/* -------------------------------------------값 등록 함수------------------------------ */
	function submit(){
		
		if(valueCheck()==false)return;
		
		if(confirm("등록하시겠습니까?")){
			var form = $("#f_matjip")[0];
			var formData = new FormData(form);
			$.ajax({
				url:"../store/add/matjip.test",
			 	type: "POST",
			    enctype: 'multipart/form-data',
			    processData: false,
                contentType: false,
				data: formData,
				success:function(data){
					alert("등록되었습니다");
				},error:function(xhrObject){
					   alert(xhrObject.responseText);
				   }
			})////////end of ajax
		}//end of if
		else{
			return;
		}
	}
	/* -------------------------------------------값 등록 끝----------------------------------- */
	/* --------------------------------------------입력값 유효성 검사 --------------------------------------------- */
	function valueCheck(){
		if($.trim($('#store_name').val())==""){
			alert("가게이름을 입력하세요");
			$("#store_name").focus();
			return false;
		};
		var check = regexp = /^[0-9]*$/
		var phonenumber = $("#store_phonenumber").val();
		if($.trim($('#store_phonenumber').val())==""){
			alert("전화번호를 입력하세요");
			$("#store_phonenumber").focus();
			return false;
		}
		else if(!check.test(phonenumber)){
			alert("전화번호는 숫자만 입력가능합니다")	;
			$("#store_phonenumber").focus();
			return false;
		};
		
		var foodtype = $('#store_foodtype').dropdown('get value');
		if($.trim(foodtype)==""){
			alert("음식종류를 선택하세요");
			$("#store_foodtype").focus();
			return false;
		};
		var price = $('#store_price').dropdown('get value');
		if($.trim(price)==""){
			alert("가격대를 선택하세요");
			$("#store_price").focus();
			return false;
		};
		if($.trim($('#store_time').val())==""){
			alert("영업시간을 입력하세요");
			$("#store_time").focus();
			return false;
		};
		if($.trim($('#store_holiday').val())==""){
			alert("휴일을 입력하세요");
			$("#store_holiday").focus();
			return false;
		};
		if($.trim($('#store_addr').val())==""){
			alert("주소를 입력하세요");
			$("#store_addr").focus();
			return false;
		};
		if($.trim($('#store_img').val())==""){
			alert("대표이미지를 첨부하세요");
			$("#store_img").focus();
			return false;
		};
		if($.trim($('#store_introduce').val())==""){
			alert("가게 한줄소개를 입력하세요");
			$("#store_introduce").focus();
			return false;
		};
		if($.trim($('#store_homepage').val())==""){
			alert("홈페이지가 없다면 없음을 입력해주세요");
			$("#store_homepage").focus();
			return false;
		};
		if($.trim($('#store_keyword').val())==""){
			alert("키워드를 하나 이상 입력하세요");
			$("#store_keyword").focus();
			return false;
		};
		return true;
	}
	/* ------------------------------------------------------유효성 검사 끝-------------------------------------- */
	
	
	
</script>
<div class="ui stackable segment" >
<form id="f_matjip" name="f_matjip" method="POST">
		<div class="ui divider"></div>
		<!-- ==========================가게 이름 등록=============================== -->
		<div class="ui labeled input" style="width:100%;">
  			<div class="ui label">
   				<h2>가게이름</h2>
  			</div>
  			<input type="text" id="store_name" name="store_name" placeholder="ex)홍짜장 가산점">
		</div>
		<!-- ============================가게 이름 등록 끝========================== -->
		<div class="ui divider"></div>
		<!-- ==============================가게 전화번호 등록======================= -->
		<div class="ui labeled input" style="width:100%;">
  			<div class="ui label">
   				<h2>전화번호</h2>
  			</div>
  			<input type="text" id="store_phonenumber" name="store_phonenumber" placeholder="숫자만 입력하세요">
		</div>
		<!-- ================================가게 전화번호 등록 끝==================== -->
		<div class="ui divider"></div>
		<!--=================================음식 종류 등록=========================  -->
		<div class="ui label">
			<h2>음식종류</h2>
		</div>
		<div class="ui dropdown" id="store_foodtype">
 			<input type="hidden"  name="store_foodtype">
  				<i class="dropdown icon"></i>
  				<div class="default text">음식종류</div>
  			<div class="menu">
    			<div class="item" data-value="2100">한식</div>
    			<div class="item" data-value="2101">중식</div>
    			<div class="item" data-value="2102">일식</div>
    			<div class="item" data-value="2103">양식</div>
    			<div class="item" data-value="2104">분식</div>
    			<div class="item" data-value="2105">기타</div>
  			</div>
		</div>
		<!-- ============================음식 종류 등록 끝============================ -->
		<div class="ui divider"></div>
		<!-- ===========================가격대 등록===================================== -->
		<div class="ui label">
			<h2>가격대</h2>
		</div>
		<div class="ui dropdown" id="store_price">
 			<input type="hidden" name="store_price">
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
		<!--================================ 가격대 등록 끝========================= -->
		<div class="ui divider"></div>
		<!-- ==============================주소 등록================================ -->
		<div class="ui labeled icon input" style="width:100%;">
  			<div class="ui label">
   				<h2>주소</h2>
  			</div>
  			<input type="text" name="store_addr" readonly="readonly"
				  placeholder="상세주소 정보가 없습니다." id="store_addr" name="store_addr">
				 <div class="ui icon button" onclick="addr()" style="padding-top: 20px; width:100px;">
				  	<i class="plus icon"></i>
				  	주소등록
				 </div>
		</div>
		<!--=========================주소등록 끝==================================  -->
		<div class="ui divider"></div>
		<!-- ================================가게 이미지 등록===================== -->
		<div class="ui labeled input" style="width:100%;">
  			<div class="ui label">
   				<h2>대표이미지</h2>
  			</div>
  				<input type="text" placeholder="이미지파일 이름이 영문이여야 합니다." readonly="readonly" id="store_img">
  				<input type="file" accept="image/*" id="fileinput" name="store_img" style="display:none" onchange="fileName()"/>
  				<label class="ui button" for="fileinput" style="padding-top: 20px; width:150px;">
  					<i class="ui upload icon"></i> 
    				이미지등록
			   </label>
		</div>
		<!-- =============================가게 이미지 등록 끝========================== -->
		<div class="ui divider"></div>
		<!--=============================== 가게 한줄소개 등록======================== -->
		<div class="ui labeled input" style="width:100%;">
  			<div class="ui label">
   				<h2>가게 한줄소개</h2>
  			</div>
  			<input type="text" placeholder="ex)가산동 최고의 맛을 자랑하는 중국집" id="store_introduce" name="store_introduce">
		</div>
		<!--===============================가게 한줄소개 등록 끝=======================  -->
		<div class="ui divider"></div>
		<!-- =============================가게 홈페이지 주소 등록========================= -->
		<div class="ui labeled input" style="width:100%;">
  			<div class="ui label">
   				<h2>가게 홈페이지 주소</h2>
  			</div>
  			<input type="text" placeholder="존재하지 않으면 없음입력" id="store_homepage" name="store_homepage">
		</div>
		<!-- =============================가게 홈페이지 주소 등록 끝========================= -->
		<div class="ui divider"></div>
		<!-- =============================가게 검색 키워드 등록========================= -->
		<div class="ui labeled input" style="width:100%;">
  			<div class="ui label">
   				<h2>검색키워드</h2>
  			</div>
  			<input type="text" placeholder="ex)짜장면 자장면 가산동 가산 가산동중국집 중국집" id="store_keyword" name="store_homepage">
		</div>
		<!-- =============================가게 검색 키워드 등록 끝========================= -->
</form>	
		<div class="ui divider"></div>
		<div class="ui basic center aligned segment">
			<button class="ui primary button" id="sendbutton" onclick="submit()">
  			등록
  			</button>
			<button class="ui button" onclick="">
  			취소
			</button>
		</div>
</div>

<!-- ==============================================모달 시작===================================  -->
<div class="ui modal" id="modal_addr">
		<i class="close icon"></i>
		<div class="header">
			<h3>주소등록창</h3>
		</div>
		<div class="content">
			<div class="body">
				<div class="ui selection dropdown addr">
					<input type="hidden" value="default" id="do"> <i class="dropdown icon"></i>
					<div class="text" id="dos">도</div>
					<div class="menu" id="menu_do">
						<div class="item" data-value="default">도</div>
					</div>
				</div>
				<div class="ui selection dropdown addr">
					<input type="hidden" value="default"> <i class="dropdown icon"></i>
					<div class="text" id="si">시</div>
					<div class="menu" id="menu_si">
						<div class="item" data-value="default">시</div>
					</div>
				</div>
				<div class="ui selection dropdown addr">
					<input type="hidden" value="default"> <i class="dropdown icon"></i>
					<div class="text" id="dong">동.리</div>
					<div class="menu" id="menu_dong">
						<div class="item" data-value="default">동.리</div>
					</div>
				</div>
				<div class="ui input" style="width: 200px;">
					<input type="text" readonly="readonly" placeholder="우편번호 검색" id="p_zip">
				</div>
				<div class="ui input" style="width:100%">
					<input type="text" placeholder="상세주소를 입력한후 검색하세요" id="p_addr">
					<div class="ui button" id="address" onclick="zipcode()">주소 검색</div>
				</div>
				<div class="actions">
					<div class="ui button" id="insert" onclick="regist()">등록</div>
					<div class="ui button" id="cancle" onclick="cancel()">취소</div>
				</div>
			</div>
		</div>
	</div>
<!-- ==============================================모달 끝===================================  -->