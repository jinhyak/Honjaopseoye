<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../include/commonUI.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
 
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui header" style="margin-left: 150px;margin-right: 150px; margin-top: 100px;margin-bottom: 100px">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<div class="ui two attached stackable column grid" style="width:100%">
		<div class="center aligned column"style="width:20%;">
			<div class="ui field" style="height:800px">
				<div class="ui segment">
					<div class="ui one column grid">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 말머리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div class="center aligned column">
						</div>
						<div class="center aligned column">
						</div>
						<div class="center aligned column">
						</div>
						<div class="center aligned column">
							<div class="ui large header">
							 	회원정보
							</div>
						</div>
						<div class="right aligned column">
						</div>
						<div class="right aligned column">
						</div>
						<div class="right aligned column">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 목록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
							<div class="ui segment button" style="width:100%">
								<a href="#"> 회원 정보 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%">
								<a href="#"> 회원 탈퇴 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%">
								<a href="#"> 친구 관리 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%">
								<a href="#"> 친구 삭제 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%">
								<a href="#"> 그룹 관리 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%">
								<a href="#"> 공지사항 </a>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%">
								<a href="#"> QnA </a>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ contents @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="column"style="width:80%;">
			<div class="ui field">
				<div class="ui segment">
					<div class="ui one column grid">
						<div class="center aligned column">
							<div class="ui segment">
								<div class="ui large header">
							 	           회원정보
								</div>
							</div>
						</div>
						<div class="column">
							<div class="ui segment" style="width:100%;height:1000px">
							
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
								
								
								
<div class="ui three doubling stackable cards">
  <div class="ui card">
    <div class="image" ><img src="../image/male.jpg" style="width:100%;height:100%">
      <div class="ui placeholder">
        <div class="square image"></div>
      </div>
    </div>
    <div class="content">
      <div class="ui placeholder">
        <div class="header">
          <div class="very short line"><div class="ui blue header ID">ID : ssssssss</div></div>
          <div class="medium line">
          <div>이름  : </div>
          <div class="meta">Email :   </div>
          </div>
        </div>
        <div class="paragraph">
          <div class="short line"><div class="meta">생년월일 : </div></div>
        </div>
      </div>
    </div>
    <div class="extra content">
      <div class="ui primary button">Add</div>
    </div>
  </div>
  <div class="ui card">
    <div class="content">
      <div class="ui placeholder">
        <div class="square image"></div>
      </div>
    </div>
  </div>
  <div class="ui card">
    <div class="content">
      <div class="ui placeholder">
        <div class="square image"></div>
      </div>
    </div>
  </div>
  <div class="ui card">
    <div class="content">
      <div class="ui placeholder">
        <div class="square image"></div>
      </div>
    </div>
  </div>
</div>
								<script type="text/javascript">
								$('.button').click(function(){
									var button=$(this)
									var card = button.parent().parent()
									var content = card.children().eq(1)
									var id = content.children().children().children().children().eq(0).text()
									alert(id)
								})
								</script>
								
								
								
								
								
								
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
</div>
</body>
</html>