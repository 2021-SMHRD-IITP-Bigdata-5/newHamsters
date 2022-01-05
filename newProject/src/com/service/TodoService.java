package com.service;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.teamDAO;
import com.DTO.memberDTO;
import com.DTO.t_teamDTO;
import com.DTO.t_todoDTO;
import com.inter.Command;

public class TodoService implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		memberDTO mdto = (memberDTO)session.getAttribute("dto");
		t_teamDTO t_DTO = (t_teamDTO)session.getAttribute("teamName");
		
		String todoTitle = request.getParameter("title");
		String todoContent = request.getParameter("content");
		double teamSeq = t_DTO.getTeamSeq();
		String memId = mdto.getMemId();
		String todoAttendance = request.getParameter("attend");
		String eventDate2 = request.getParameter("event");
		
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.US);
		LocalDate eventDate3 = LocalDate.parse(eventDate2, formatter);
		
		// localDate  -> date
		Date eventDate = java.sql.Date.valueOf(eventDate3);
		
		
System.out.println("llllllllllllllllll"+eventDate2);
System.out.println("llllllllllllllllll"+eventDate);
		
		
		
		System.out.println("팀시퀀스"+teamSeq);
		System.out.println("입력하는 사람의 아이디"+memId);
		String nextpage = "";
		
		t_todoDTO dto = new t_todoDTO(todoTitle, todoContent, teamSeq, memId, todoAttendance, eventDate);

		teamDAO dao = new teamDAO();
		int cnt = dao.todoWrite(dto);
		
		ArrayList<t_todoDTO> list3 = dao.getTodoDTO(teamSeq);
		
		if(cnt > 0) {
			session.setAttribute("teamSeq2", list3);
			RequestDispatcher dis = request.getRequestDispatcher("projectPageTodo.jsp");
			dis.forward(request, response);
		}else {
			nextpage = "LoginFalse.jsp";
		}
		return null;
	}
	
}
