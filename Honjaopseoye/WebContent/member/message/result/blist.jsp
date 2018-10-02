<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<% 
	List<Map<String,Object>> list = (List<Map<String,Object>>)request.getAttribute("result");
	List<Map<String,Object>> members = (List<Map<String,Object>>)session.getAttribute("memList");
	String mem_id = members.get(0).get("MEM_ID").toString();
	String fri_id = null;
	if(list!=null&&list.size()!=0){
		for(int i = 0 ; i<list.size();i++){
			String id = list.get(i).get("MSG_FROM").toString();
			if(id.equals(mem_id)){
				fri_id = list.get(i).get("MSG_TO").toString();
			}
			else{
				fri_id = id;
			}
				%>
		    <tr class="trs">
		      <td class="collapsing">
						<img class="ui avatar image" src="../../image/male.jpg" style="width:50px;height:50px" >
		      </td>
		      <td class="collapsing fri_id" style="color:#088A85;font-weight:bold"><%=fri_id%></td>
		      <td>
		      	<div class="ui compact menu">
		      	<a class="item">
		      	<i><%=list.get(i).get("MSG_CONTENT").toString().replaceAll(" ", "&nbsp;").replaceAll("\n", "<br>")%></i>
		      	<div class="floating ui red label">0</div>
		      	</a>
		      	</div>
		      </td>
		      <td class="right aligned collapsing"><%=list.get(i).get("MSG_DATE").toString() %></td>
		    </tr>
				<%
		}
	}
%>