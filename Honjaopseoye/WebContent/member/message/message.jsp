<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String fri_id = null;
	String mem_id =null;
	if(request.getParameter("mem_id")!=null){
		mem_id = request.getParameter("mem_id");
	};
	if(request.getParameter("fri_id")!=null){
		fri_id = request.getParameter("fri_id");
	};
%>
<script type="text/javascript">
	var mem_id = <%=mem_id%>
	var fri_id = <%=fri_id%>
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@include file="../../include/include/commonUI.jsp" %>
<title>Insert title here</title>
</head>
<body>
<div class="ui container" style="width:800px;heigth:800px;margin-top:50px">
<div class="ui top attached segment" style="background: rgba(0,0,0,0.1)">
  <p><h3>채팅하기</h3></p>
</div>
		<div class="ui attached segment pushable" style="width:100%;height:400px" >
			<div class="ui small divided list" id="msgList">
				  <div class="ui item" style="margin-top:20px">
				  	<div class="right floated header" style="margin-right:8px"><h4>ss</h4></div>
				    <img class="ui avatar image" src="../../image/male.jpg" style="width:50px;height:50px" >
				    <div class="top aligned content" style="width:70px;">
				    	<div class="ui teal header">유저</div>
					    <div class="discription">2322323</div>
				    </div>
				  </div>
			</div>
		</div>
	<div class="ui bottom attached segment"style="background:rgba(0,0,0,0.1);">
	  <div class="ui form">
		<form id="f_sub">
			<label>메시지 보내기</label>
				<textarea id="context"rows="2" name="msg_content"></textarea>
			<div class="ui blue large button" id="msg_button"> 전송 </div>
		</form>
	  </div>
	</div>
</div>
<script type="text/javascript">

	$('#msg_button').click(function(){
		var param=$("#f_sub").serialize()+"&mem_id="+mem_id+"&fri_id="+fri_id
		if(mem_id==null||mem_id==""||fri_id==null||fri_id==""){
			alert("오류입니다.")
		}
		else{
			alert(param);
			$.ajax({
				 method:"post"
				,url:"../../message/empty/insert.test"
				,data:param
				,success:function(data){
					if(data==1){
						alert("전송성공")						
					}
					else{
						alert(data);
						alert("전송 실패")
					}
				}
				,error:function(data){
					alert("전송 아작스 오류")
				}
			})
			$("#context").val("")
		}
	});
	function msgList(type){
		var msg_from = mem_id;
		var msg_to = fri_id;
		var msg_no = type;
		var param = "msg_from="+msg_from+"&msg_to="+msg_to+"msg_no="msg_no
		alert(param)
		$.ajax({
			type:"post",
			data:"param",
			url:"../../message/chat/msgListById.test"
			
		})
	}
</script>
</body>
</html>