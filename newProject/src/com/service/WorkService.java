package com.service;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.teamDAO;
import com.DTO.memberDTO;
import com.DTO.t_teamDTO;
import com.DTO.t_workDTO;
import com.inter.Command;

import oracle.sql.DATE;

public class WorkService implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		memberDTO mdto = (memberDTO)session.getAttribute("dto");
		t_teamDTO tdto = (t_teamDTO)session.getAttribute("teamName");
		
		String workTitle = request.getParameter("title");
		String workContent = request.getParameter("content");
		Date workStartDt = request.getda("startdt");
		String workEndDt = request.getParameter("enddt");
		String workProgress = request.getParameter("progress");
		String memId = mdto.getMemId();
		double teamSeq = tdto.getTeamSeq();
		String referenceId = request.getParameter("ref");
		
		System.out.println("입력받은날짜 : "+workStartDt + workEndDt);
		System.out.println("팀시퀀스"+teamSeq);
		System.out.println("입력하는 사람의 아이디"+memId);
		
		String nextpage = "";		
		t_workDTO dto = new t_workDTO(workTitle, workContent, workStartDt, workEndDt, workProgress, memId, teamSeq, referenceId);
		teamDAO dao = new teamDAO();
		int cnt = dao.workWrite(dto);
		
		if(cnt > 0) {
			RequestDispatcher dis = request.getRequestDispatcher("projectPage.jsp");
			dis.forward(request, response);
		}else {
			nextpage = "LoginFalse.jsp";
		}
		return null;
	}
}
