package com.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.teamDAO;
import com.DTO.t_commuDTO;
import com.DTO.t_scheduleDTO;
import com.DTO.t_teamDTO;
import com.DTO.t_todoDTO;
import com.DTO.t_workDTO;
import com.inter.Command;

public class getScheService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String teamseq = request.getParameter("connect_team");
			double teamSeq = Double.parseDouble(teamseq);
			
			teamDAO dao = new teamDAO();
			
			t_teamDTO t_DTO = dao.selectTeam(teamSeq);
			ArrayList<t_scheduleDTO> list4 = dao.getScheDTO(teamSeq);
			String nextpage = "";
			if (t_DTO != null) {

				HttpSession session = request.getSession();
				
				session.setAttribute("teamName", t_DTO);
				session.setAttribute("teamSeq3", list4);
				System.out.println("커넥트페이지 서비스");
				
				nextpage = "projectCalPage.jsp";

			}else {
				nextpage = "projectCalPage.jsp";
			}
			
			return nextpage;
		}

}
