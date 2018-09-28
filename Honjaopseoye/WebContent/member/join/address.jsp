<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%String zdo = request.getParameter("zdo");%>
<%String sigu = request.getParameter("sigu");%>
<%String dong = request.getParameter("dong");%>
<%String address = request.getParameter("address");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../include/include/commonUI.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.listIn{
		background:#CCFFFF;
	}
	.listOut{
		background:#FFFFFF;
	}
</style>
</head>
<body>
	<div class="ui container" style="margin-top:50px">
		<div class="ui top attached segment">
			<table class="ui celled table" style="margin-top:50px" id="addr_tb">
			  <thead>
			    <tr id="dd">
			      <th>상세 주소</th>
			      <th>우편번호</th>
			    </tr>
			  </thead>
			  <tbody id="addr_list">
			  </tbody>
			</table>
	    <div class="ui top attached label"> 상세 주소 </div></div>
	</div>

<input type="hidden" id="cinput">
<script type="text/javascript">
			var zdo = '<%=zdo%>'
			var sigu = '<%=sigu%>'
			var dong = '<%=dong%>'
			var address = '<%=address%>'
			var param = "zdo="+zdo+"&sigu="+sigu+"&dong="+dong+"&address="+address;
			alert(param);
			$.ajax({
				 method:"post"
				,data:param
				,url:"../../gubun/empty/detailselect.test"
				,success:function(data){
					$('#addr_list').html(data)
					var trs = $("#addr_tb")[0].getElementsByClassName("trs");
						for(var i=0;i<trs.length;i++){
							trs[i].onmouseover = function(){
								this.className="listIn";
								this.onclick = function(){
									var addr = this.cells.item(0).innerHTML
									var zip = this.cells.item(1).innerHTML
									alert(addr)
									alert(zip)
									window.opener.document.getElementById("p_addr").value = addr;
									window.opener.document.getElementById("p_zip").value = zip;
									self.close();
								}
							};
							trs[i].onmouseout = function(){
								this.className="listOut";
							}
						}
				}
			})
</script>
</body>
</html>