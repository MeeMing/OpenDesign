<%@page import="board.Board"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View.jsp</title>
</head>
<body>
view.jsp<br/>
<% 
	String id = request.getParameter("id"); 
	String modifyUrl = "modify.jsp?id="+id;
	String deleteUrl = "delete.jsp?id="+id;
	
	BoardDao dao = new BoardDao();
	System.out.println(id);
	Board board = dao.view(id).get(0);
	System.out.println(board.getbTitle());
%>
<%= id %><br/>
<p>제목 : <%= board.getbTitle() %></p>
<p>내용 : <%= board.getbContent() %></p>
<p>작성일 : <%= board.getbTime_Make() %></p>
<p>수정일 : <%= board.getbTime_Modi() %></p>


<input type="submit" value="목록보기" onClick="goList()">
<input type="submit" value="수정" onClick="goModify('<%= id %>')">
<input type="submit" value="삭제" onClick="goDelete('<%= id %>')">


<script>
function goList(){
	location.href="list.jsp";
}

function goModify(id){
	location.href="modify.jsp?id="+id;
}

function goDelete(id){
	var input = confirm("삭제하시겠습니까?");
	if(input){
		location.href="delete.jsp?id="+id;	
	}else{
		response.sendRedirect("view.jsp?id="+id);
	}
	
}

</script>


</body>
</html>