<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
var a=0;
</script>
<style>
	.listIn {background:#F8E0E6} 
	.listOut{background:#FFFFFF}
</style>
<%
	String mem_id = request.getParameter("mem_id");
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@include file="../../include/include/commonUI.jsp" %>
</head>
<body>
<div class="ui container" style="width:800px;heigth:800px;margin-top:50px">
		<div class="ui attached segment pushable" style="width:100%;height:800px">
			<table class="ui celled table" id="boxtable">
				<thead>
			    	<tr><th colspan="3"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
					<h2>메시지 목록함</h2></font></font></th>
			  		</tr>
			  	</thead>
				<tbody id="boxlist">
					
				</tbody>
			</table>
		</div>
</div>
<script type="text/javascript">
	function getListRecentMsg(){
		var id = '';
		var param = "mem_id="+'<%=mem_id%>';
		$.ajax({
			 method:"post"
			,data:param
			,url:"../../message/empty/getmsgBox.test"
			,success:function(data){
				$("#boxlist").html(data);
				var trs = $("#boxtable")[0].getElementsByClassName("trs");
					for(var i=0;i<trs.length;i++){
						trs[i].onmouseover = function(){
							this.className="listIn";
							this.onclick = function(){
								id = this.cells.item(1).innerHTML
							}
						};
						trs[i].onmouseout = function(){
							this.className="listOut";
						}
					}
			}
			,error:function(data){
				alert("실패");
			}
		})
	}
	function getUnReadMsg(){
		var tds = $("#boxtable")[0].getElementsByClassName("fri_id");
		a=0;
		for(i=0;i<tds.length;i++){
			alert("for문")
			 var fri_id = tds[i].innerHTML;
			 var CountMsg = (document).getElementsByClassName("label");
			 //alert($('.CountMsg').length);
			 var mem_id = '<%=mem_id%>';
			 var param = "fri_id="+fri_id+"&mem_id="+mem_id;
			$.ajax({
				method:"post",
				data:param,
				url:"../../message/empty/unReadMsg.test",
				success:function(data){
					CountMsg[a++].innerHTML=data;
				},
				error:function(data){
					alert("실패");
				}
			})
		}
	}
	$(document).ready(function(){
		getListRecentMsg()
		setInterval(function() {
			getUnReadMsg();
		}, 3000)
	})
</script>
</body>
</html>