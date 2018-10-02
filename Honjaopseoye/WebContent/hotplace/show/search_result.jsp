<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@include file="../../include/include/commonUI.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- #hotplaceList에 뿌려줄 div태그들 포문 돌려서 최대 8개 까지 생성함  -->
<!-- semantic으로 만들어서 뿌려야함-->
<!-- 로직에서 list에 담을때 최대 8개 까지만!! 그이상이면 이상할거 같음 -->
<%
	//핫플 리스트 받아옴
	
	Map<String,Object> getHotplaceList 
		 = (Map<String,Object>)request.getAttribute("result");
	
	List<Map<String,Object>> list 
		= (List<Map<String,Object>>)getHotplaceList.get("list");

	
	int size = list.size(); //최대 8
	Map<String,Object> rMap = null;			
	for(int i=0;i<size;i++){
		rMap =  list.get(i);
	
		
%>
<div class="column">
	<div class="ui two column grid">
		<div class="column">
			<div class="ui segments">
				<div class="ui segment">
					<%=rMap.get("이름") %>
				</div>
				<div class="ui segment">
					zzzzzzzzzz
				</div>
			</div>
		</div>
		<div class="column">
			<img class="ui small image" src="../picture/1.png">
		</div>
	</div>
</div>

<%
	}
%>

