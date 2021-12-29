<%@page import="com.DTO.t_teamDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%t_teamDTO t_DTO = (t_teamDTO)session.getAttribute("teamName");  %>
	<%= t_DTO.getTeamSeq() %>
	<form action="todoWrite.do">
		    <li><input type ="text" name ="title" placeholder="제목"></li>
            <li><input type ="text" name ="content" placeholder="내용"></li>
            <li><input type ="text" name ="attend" placeholder="담당자추가"></li>
            <li><input type ="date" name ="event"></li><br>
          	<li><input type ="submit" value="글작성" class="button fit"></li>
	</form>
</body>
</html>