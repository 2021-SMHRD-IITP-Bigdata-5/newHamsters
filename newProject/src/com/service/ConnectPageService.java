package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.teamDAO;
import com.DTO.t_teamDTO;
import com.inter.Command;

public class ConnectPageService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String teamName = request.getParameter("connect_team");
		System.out.print("ø¨∞·«“ team page : " + teamName);
		
		t_teamDTO teamdto = new t_teamDTO(teamName);
		
		teamDAO dao = new teamDAO();
		
		t_teamDTO t_DTO = dao.selectTeam(teamdto);
		
		String nextpage = "";

		if (t_DTO != null) {

			HttpSession session = request.getSession();

			session.setAttribute("teamName", t_DTO);
			
			nextpage = "projectPage.jsp";

		}else {
			nextpage = "projectMain.jsp";
		}
		
		return nextpage;
	}

}
