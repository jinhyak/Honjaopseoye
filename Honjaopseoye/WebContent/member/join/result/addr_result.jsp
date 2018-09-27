<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<%
String key=null;
List<Map<String,Object>> list = (List<Map<String,Object>>)request.getAttribute("result");
	if(list!=null&&list.size()>0){
	Iterator<String> iter = list.get(0).keySet().iterator();
		while(iter.hasNext()){
			key = iter.next();
			System.out.println(key);
		}
	}
	for(int i=0;i<list.size();i++){		
%>
	<tr class="trs">
		<td class="addr"><%=list.get(i).get("ADDRESS")%></td>
		<td class="zip"><%=list.get(i).get("ZIPCODE")%></td>
	</tr>
<%	}
%>	