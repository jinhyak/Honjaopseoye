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
  <div class="ui item" >
    <div class="right floated content">
      <div class="ui button btnclick">삭제</div>
    </div>
    <div class="right floated content">
      <div class="ui button btnmessage">메시지 보내기</div>
    </div>
    <img class="ui avatar image" src="../../image/male.jpg" style="width:50px;height:50px">
    <div class="middle aligned content" style="width:70px;">
    	<div class="ui teal header"><%=list.get(i).get("FRI_ID")%></div>
	    <div class="discription"><%=list.get(i).get("FRI_NAME")%></div>
    </div>
    <div class="content" style="padding-left:5px">
    	<div class="ui header">
      	  <%=list.get(i).get("FRI_BIRTH")%>
    	</div>
	    <div class="discription">
	      <%=list.get(i).get("FRI_EMAIL")%>
	    </div>
    </div>
  </div>
<%	}
}
%>	
	<script>
	$(".btnclick").click(function(){
		var button=$(this)
		var item = button.parent().parent()
		var id = item.children().eq(3)
		var fri_id = id.children().eq(0).text()
		alert(mem_id);
		alert(fri_id)
		var param = "mem_id="+mem_id+"&fri_id="+fri_id
		alert(param);
		$.ajax({
			method:"post",
			url:"../../friend/empty/delete.test",
			data:param,
			success:function(data){
				if(data==1){
					alert("친구 삭제 성공하셨습니다")
					item.remove();
				}
				else{
					alert("친구 삭제 실패")
				}
			}
		})
	})
	$(".btnmessage").click(function(){
		var button=$(this)
		var item = button.parent().parent()
		var id = item.children().eq(3)
		var to_id = id.children().eq(0).text()
		var from_id = mem_id;
		var messagewin = cmm_window_popup("../message/message.jsp?mem_id="+from_id+"&fri_id="+to_id, "1000", "800", "채팅창");
	})
	</script>