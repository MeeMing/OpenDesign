<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write.jsp</title>
</head>
<body>
<form id="form_save" action="writeSave.jsp" method="get">
제목 : <input type="text" name="title">
내용 : <input type="text" name="content">
<input type="button" onClick="goWriteSave()" value="저장">
</form>

<input type="submit" value="목록으로" onClick="goList()">

<script>
function goWriteSave(){
	var input = confirm("저장하시겠습니까?");
	if(input){
		document.getElementById("form_save").submit();
	}
	
}

function goList(){
	var input=confirm("목록으로 돌아가시겠습니까?");
	if(input){
		location.replace('list.jsp');
	}
	
}

</script>



</body>
</html>