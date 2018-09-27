<%@page trimDirectiveWhitespaces="true" %>
<%
String result =  request.getParameter("result").toString();
out.print(result);
%>