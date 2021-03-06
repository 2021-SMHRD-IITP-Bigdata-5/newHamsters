package com.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.teamDAO;
import com.DTO.t_teamDTO;
import com.DTO.t_team_memberDTO;
import com.inter.Command;

public class inviteService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nextpage = "";
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String memid = request.getParameter("memid");
		t_teamDTO t_DTO = (t_teamDTO)session.getAttribute("teamName");
		double teamseq = t_DTO.getTeamSeq();
		
		teamDAO dao = new teamDAO();
		ArrayList<t_team_memberDTO> list4 = dao.getMembers(teamseq);
		int cnt = dao.insertTeam(memid, teamseq);
		
		if(cnt > 0) {
			session.setAttribute("teamSeq3", list4);
			RequestDispatcher dis = request.getRequestDispatcher("projectInvite.jsp");
	        dis.forward(request, response);
		}else {
			
		}
		
		return null;
	}

}
