package com.service;

import java.io.IOException;

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
		String eventDate = request.getParameter("event");
		
		
		System.out.println("��������"+teamSeq);
		System.out.println("�Է��ϴ� ����� ���̵�"+memId);
		String nextpage = "";
		
		t_todoDTO dto = new t_todoDTO(todoTitle, todoContent, teamSeq, memId, todoAttendance, eventDate);

		teamDAO dao = new teamDAO();
		int cnt = dao.todoWrite(dto);
		
		if(cnt > 0) {
			RequestDispatcher dis = request.getRequestDispatcher("projectPage.jsp");
			dis.forward(request, response);
		}else {
			nextpage = "LoginFalse.jsp";
		}
		return null;
	}
	
}