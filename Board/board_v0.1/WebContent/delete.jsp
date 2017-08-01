<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delete.jsp</title>
</head>
<body>
<%
	BoardDao dao = new BoardDao();
	dao.delete(request.getParameter("id"));
	response.sendRedirect("list.jsp");
%>
</body>
</html>