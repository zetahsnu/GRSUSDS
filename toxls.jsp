<%@ page language="java" pageEncoding="UTF-8"%>

<%@page contentType="application/vnd.ms-excel"%><%
request.setCharacterEncoding("utf-8");

response.setContentType("application/vnd.ms-excel;charset=UTF-8");
response.addHeader("Cache-Control","max-age=1, must-revalidate");

response.setHeader("Content-Disposition", "inline; filename=details.xls");
out.print(""+request.getParameter("wgh"));
%>