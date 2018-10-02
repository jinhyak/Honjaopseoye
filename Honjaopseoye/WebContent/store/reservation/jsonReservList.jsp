<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<%@ page import="com.google.gson.Gson" %>
<%
	List<Map<String,Object>> getReservList = (List<Map<String,Object>>)request.getAttribute("getReservList");
	Gson gs = new Gson();
	String jsonBoard = gs.toJson(getReservList);
	out.print(jsonBoard);
%>