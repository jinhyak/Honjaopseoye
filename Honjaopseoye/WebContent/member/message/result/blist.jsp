<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<% 
	List<Map<String,Object>> list = (List<Map<String,Object>>)request.getAttribute("result");
	if(list!=null&&list.size()!=0){
		for(int i = 0 ; i<list.size();i++){
				%>
		<div class="ui item">
					<div class="right floated header" style="margin-right:8px"><h4><%=list.get(i).get("MSG_DATE").toString() %></h4></div>
				    <img class="ui avatar image" src="../../image/male.jpg" style="width:50px;height:50px" >
				    <div class="top aligned content" style="width:70px;">
				    <div class="ui teal header"><%=list.get(i).get("MSG_FROM").toString() %></div>
					<div class="discription"><%=list.get(i).get("MSG_CONTENT").toString().replaceAll(" ", "&nbsp;").replaceAll("\n", "<br>")%></div>
					</div>
		</div>		
				<%
		}
	}
%>