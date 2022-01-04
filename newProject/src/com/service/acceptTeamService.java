package com.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.teamDAO;
import com.DTO.memberDTO;
import com.DTO.t_teamDTO;
import com.DTO.t_team_memberDTO;
import com.inter.Command;

public class acceptTeamService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		memberDTO memberdto = (memberDTO)session.getAttribute("dto");
		t_teamDTO teamdto = (t_teamDTO)session.getAttribute("teamName");
		String memid = memberdto.getMemId();
		Double teamseq = teamdto.getTeamSeq();
		
		teamDAO dao = new teamDAO();
		int cnt = dao.acceptTeam(memid, teamseq);
		t_team_memberDTO ttmem = dao.teamMemberdto(memid, teamseq);
		ArrayList<t_team_memberDTO> list4 = dao.getMembers(teamseq);
		if(cnt > 0) {
			session.setAttribute("admin", ttmem);
			session.setAttribute("teamSeq3", list4);
			RequestDispatcher dis = request.getRequestDispatcher("projectPage.jsp");
            dis.forward(request, response);
		}
		
		
		return null;
	}

}
