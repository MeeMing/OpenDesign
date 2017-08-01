<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify.jsp</title>
</head>
<body>
Modify.jsp	<%= request.getParameter("id") %>

<form id="form" action="modifySave.jsp" method="get">
<input type="hidden" name="id" value="<%= request.getParameter("id") %>" >
제목 : <input type="text" name="title">
내용 : <input type="text" name="content">
<input type="button" onClick="goModifySave()" value="수정">
</form>

<input type="submit" value="이전으로" onClick="goView(<%= request.getParameter("id") %>)" >


<script>
function goModifySave(){
	var input = confirm("수정하시겠습니까?");
	if(input){
		document.getElementById("form").submit();
	}
}
function goView(id){
	var input=confirm("상세보기로 돌아가시겠습니까?");
	if(input){
		location.href="view.jsp?id="+id;
	}
	
	
}

</script>
</body>
</html>