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
import com.DTO.t_workDTO;
import com.inter.Command;

public class newTeamService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		memberDTO mdto = (memberDTO)session.getAttribute("dto");
		t_teamDTO tdto = (t_teamDTO)session.getAttribute("teamName");
		
		String teamName = request.getParameter("name");
		String teamContent = request.getParameter("explain");
		String memId = mdto.getMemId();
		t_teamDTO dto = new t_teamDTO(teamName, teamContent, memId);
		
		teamDAO dao = new teamDAO();
		int cnt = dao.createteam(dto);
		String nextpage ="";
		
		if(cnt > 0) {
			RequestDispatcher dis = request.getRequestDispatcher("projectMain.jsp");
			dis.forward(request, response);
		}else {
			nextpage = "LoginFalse.jsp";
		}
		
		
		
		return null;
	}

}
