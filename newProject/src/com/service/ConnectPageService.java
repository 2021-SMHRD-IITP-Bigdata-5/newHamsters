package com.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.teamDAO;
import com.DTO.memberDTO;
import com.DTO.t_commuDTO;
import com.DTO.t_scheduleDTO;
import com.DTO.t_teamDTO;
import com.DTO.t_team_memberDTO;
import com.DTO.t_todoDTO;
import com.DTO.t_workDTO;
import com.inter.Command;

public class ConnectPageService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		memberDTO memdto = (memberDTO)session.getAttribute("dto");
		String teamseq = request.getParameter("connect_team");
		double teamSeq = Double.parseDouble(teamseq);
		String memid = memdto.getMemId();
		teamDAO dao = new teamDAO();

		ArrayList<t_team_memberDTO> list4 = dao.getMembers(teamSeq);
		ArrayList<t_commuDTO> list = dao.getCommu(teamSeq);
		t_teamDTO t_DTO = dao.selectTeam(teamSeq);
		ArrayList<t_workDTO> list2 = dao.getWork(teamSeq);
		ArrayList<t_todoDTO> list3 = dao.getTodoDTO(teamSeq);
		t_team_memberDTO ttmem = dao.teamMemberdto(memid, teamSeq);
		String nextpage = "";
		System.out.println("아이디" + memid);
		System.out.println("시퀀스" + teamSeq);
		
		
		if (t_DTO != null) {


			session.setAttribute("teamName", t_DTO);
			session.setAttribute("teamSeq", list);
			session.setAttribute("teamSeq1", list2);
			session.setAttribute("teamSeq2", list3);
			session.setAttribute("teamSeq3", list4);
			session.setAttribute("admin", ttmem);
			System.out.println("커넥트페이지 서비스");

			nextpage = "projectPage.jsp";

		} else {
			nextpage = "projectMain.jsp";
		}

		return nextpage;
	}

}
