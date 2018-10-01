<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
List<Map<String,Object>> list = null;
list = (List<Map<String,Object>>)request.getAttribute("result");
if(list!=null){
	for(int i=0;i<list.size();i++){
%>
	<tr style="text-align:center" class="fri_search">
		<td><%=list.get(i).get("MEM_ID")%></td>
		<td><%=list.get(i).get("MEM_NAME")%></td>
		<td><%=list.get(i).get("MEM_BIRTH")%></td>
		<td><%=list.get(i).get("MEM_EMAIL")%></td>
		<td><input type="button" class="btnclick" value="추가하기"></td>
	</tr>
<%	}
}
%>	
	<script>
	$(".btnclick").click(function(){
		var button = $(this);
		var trs = button.parent().parent();
		var tds = trs.children();
		var fri_id = tds.eq(0).text();
		alert(fri_id);
		var fri_name = tds.eq(1).text();
		var fri_birth = tds.eq(2).text();
		var fri_email = tds.eq(3).text();
		alert(mem_id);
		var param = "mem_id="+mem_id+"&fri_id="+fri_id+"&fri_name="+fri_name+"&fri_birth="+fri_birth+"&fri_email="+fri_email+"&mem_name="+mem_name+"&mem_birth="+mem_birth+"&mem_email="+mem_email
		alert(param);
		$.ajax({
			 method:"post"
			,data:param
			,url:"../../friend/empty/insert.test"
			,success:function(data){
				if(data==1){
					alert("친구가 성공적으로 추가되었습니다")
					trs.remove();
				}
				else{
					alert("친구 추가가 실패하였습니다.")
				}
			}
			,error:function(data){
				alert("실패");
			}
		})
	})
	</script>

