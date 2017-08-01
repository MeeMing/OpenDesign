<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifySave.jsp</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	if(title.equals("")){
		title="defalut";
	}
	String content = request.getParameter("content");
	if(content.equals("")){
		content="defalut";
	}
	BoardDao dao = new BoardDao();
	dao.modify(id, title, content);
	response.sendRedirect("list.jsp");
%>
</body>
</html>