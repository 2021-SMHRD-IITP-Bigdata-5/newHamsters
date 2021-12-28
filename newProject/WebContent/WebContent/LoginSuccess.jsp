<%@page import="java.util.ArrayList"%>
<%@page import="com.DTO.t_teamDTO"%>
<%@page import="com.DTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	memberDTO dto = (memberDTO)session.getAttribute("dto"); 
	ArrayList<t_teamDTO> team_dto = (ArrayList<t_teamDTO>)session.getAttribute("teamSeq"); 
%>
	<h1>로그인 성공 페이지</h1>
		<%if(dto == null) {%>
        <h1>로그인 해주세요</h1>
        <%}else{ %>
        <h1><%=dto.getMemId() %>님 환영합니다.</h1>
        <%} %> 
        <h1><%= dto.getMemEmail() %></h1>
        <%-- <h1><%=team_dto.get(0).getTeamSeq() %></h1> --%>
        <% for(int i = 0; i < team_dto.size(); i++){ %>
        	<h1><%= team_dto.get(i).getTeamSeq() %></h1>
        <%} %>
        
</body>
</html>