<%@page trimDirectiveWhitespaces="true" %>
<%
String result = (String)request.getParameter("result");
out.print(result);
%>