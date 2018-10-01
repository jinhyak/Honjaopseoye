<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@include file="../../include/include/commonUI.jsp" %>
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
<title>Insert title here</title>
</head>
<body>
<div class="ui container" style="width:800px;heigth:800px;margin-top:50px">
		<div class="ui top attached segment" style="background: rgba(0,0,0,0.1)">
		  <p><h3>채팅하기</h3></p>
		</div>
		<div class="ui attached segment pushable" style="width:100%;height:400px" id="scroll">
			<div class="ui small divided list" id="msgList">
			</div>
		</div>
		<div class="ui bottom attached segment"style="margin-top:20px;background:rgba(0,0,0,0.1);">
			<form id="f_sub">
			<div class="ui ten column grid">
				<div class="fourteen wide column">
			  <div class="ui form">
					<textarea id="context"rows="2" name="msg_content"></textarea>
			  </div>
				</div>
				<div class="two wide column">
					<div class="ui blue large button" id="msg_button"> 전송 </div>
				</div>
			</div>
			</form>
		</div>
</div>
<script>
var mem_id;
var fri_id;
mem_id = '<%=mem_id%>'
fri_id = '<%=fri_id%>'
alert(mem_id+"::::"+fri_id)
var Lastno=0;
	$('#msg_button').click(function(){
		msgSubmit();
	});
	
	function msgSubmit(){
		var param=$("#f_sub").serialize()+"&msg_from="+mem_id+"&msg_to="+fri_id
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
	}
	
	function msgList(lastno){
		var param = "msg_from="+mem_id+"&msg_to="+fri_id+"&msg_no="+lastno;
		if(mem_id==""||mem_id==null||fri_id==""||fri_id==null){
			alert('ㅡㅡ비회원 꺼지삼')
		}
		else{
			$.ajax({
				method:"post",
				data:param,
				url:"../../message/empty/msgListByRecent.test",
				success:function(data){
					if(data==""){
					}
					else{
						$("#msgList").append(data);
						Lastno = last_no;
					}
				},
				error:function(data){
					alert("메시지 로드 실패");
				}
			})
		}
		$("#scroll").scrollTop($("#msgList").height());
	}
	function infinityMsg(){
		setInterval(function() {
			msgList(Lastno)
		}, 1000)
	}
	$(function(){
		alert("시작")
		msgList('0');
		infinityMsg();
	})
</script>
</body>
</html>