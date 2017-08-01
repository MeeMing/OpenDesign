<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="board.BoardDao"%> 
<%@ page import="board.Board"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list.jsp</title>
</head>
<body>
list.jsp<br/>


<table width="600" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>제목</td>
		<td>내용</td>
		<td>작성일</td>
		<td>수정일</td>
		<td>상세보기</td>
	</tr>
	
	<%
		BoardDao dao = new BoardDao();
		ArrayList<Board> boards = dao.list();
		int length = boards.size();
		System.out.println("length="+length);
		for(int i=0; i<length; ++i){
			String title = boards.get(i).getbTitle();
			String content = boards.get(i).getbContent();
			if(content.length()>10)
				content=content.substring(0,9);
			Timestamp time_make = boards.get(i).getbTime_Make();
			Timestamp time_modi = boards.get(i).getbTime_Modi();
			
			String url = "view.jsp?id="+boards.get(i).getbId();
			
	%>	
	
	<tr>
			<td><%= title %></td>
			<td><%= content %></td>
			<td><%= time_make %></td>
			<td><%= time_modi %></td>
			<td>
				<input type="submit" value="상세보기" onClick="goView('<%= url %>')">
			</td>
	
	</tr>
	<%		
		System.out.println(boards.get(i).getbTitle()+" "+boards.get(i).getbContent());
		}
	%>
	
	<tr>
		<td colspan="5">
			<a href="write.jsp">글작성</a> 
		</td>
	</tr>
</table>


<script>
function click_goIndex(){
	alert("goto index");
	location.href="index.jsp";
}

function goView(url){
	alert(url);
	location.href=url;
	/* location.replace(url); */
}

</script>

</body>
</html>