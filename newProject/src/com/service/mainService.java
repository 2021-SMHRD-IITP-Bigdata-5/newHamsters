package com.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;
import com.DTO.memberDTO;
import com.DTO.t_teamDTO;
import com.inter.Command;

public class mainService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		memberDTO dto1 = (memberDTO)session.getAttribute("dto");
		String memid = dto1.getMemId();
		
		memberDAO dao = new memberDAO();
		
		ArrayList<t_teamDTO> list = dao.teamSeq(memid);
		
		response.setCharacterEncoding("utf-8");
		
		memberDTO dto = dao.Login(dto1);
		String nextpage = "";
		
		
		if(dto != null) {
			
			session.setAttribute("dto", dto);
			session.setAttribute("teamSeq", list);
			
			nextpage = "projectMain.jsp";
			
			}else{
				
			nextpage = "LoginFalse.jsp";
	}
	return nextpage;
	}

}
