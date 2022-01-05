package com.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.teamDAO;
import com.DTO.t_teamDTO;
import com.inter.Command;

public class deleteTeamService implements Command {

	   @Override
	   public String execute(HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException {
		   
		   request.setCharacterEncoding("utf-8");
		   
		   Double teamSeq2 = Double.parseDouble(request.getParameter("teamSeq"));
		   teamDAO dao = new teamDAO();
		   
		   int cnt = dao.deleteTeam(teamSeq2);
		   if(cnt > 0) {
			   RequestDispatcher dis = request.getRequestDispatcher("main.do");
	            dis.forward(request, response);
		   }else {
			   
		   }
		   return null;
	   }
}
