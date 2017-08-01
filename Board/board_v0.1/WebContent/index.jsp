<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board</title>
</head>
<body>
<%
//response.sendRedirect("list.jsp");
%>
index.jsp<br/>

<input type="submit" onClick="location.href='list.jsp'" value="리스트">

<form action="test.jsp" method="post">
<%
String str = "1234";
request.setAttribute("id", str);
%>
<input type="submit" value="test.jsp">
</form>

</body>
</html>