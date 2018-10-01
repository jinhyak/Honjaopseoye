<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String result = request.getParameter("result");
	out.print(result);
%>