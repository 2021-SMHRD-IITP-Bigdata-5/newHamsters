<%@page import="com.DTO.memberDTO"%>
<%@page import="com.DAO.memberDAO"%>
<%@page import="org.eclipse.jdt.internal.compiler.lookup.MemberTypeBinding"%>
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
<%memberDTO dto = (memberDTO)session.getAttribute("dto"); %>
<%= dto.getMemId() %>
   <form action="createTeam.do">
          <li><input type ="text" name ="title" placeholder="제목"></li>
            <li><input type ="text" name ="content" placeholder="내용"></li>
             <li><input type ="submit" value="글작성" class="button fit"></li>
             
   </form>
</body>
</html>