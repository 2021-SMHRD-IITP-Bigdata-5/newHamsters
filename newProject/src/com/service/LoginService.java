package com.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;
import com.DTO.memberDTO;
import com.DTO.t_teamDTO;
import com.google.gson.Gson;
import com.inter.Command;

public class LoginService implements Command {
	
	public String execute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		
		request.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("id");
		String memPw = request.getParameter("pw");
		String memid = request.getParameter("id");
		
		memberDTO dto1 = new memberDTO(memId, memPw);
		
		memberDAO dao = new memberDAO();
		
		ArrayList<t_teamDTO> list = dao.teamSeq(memid);
		
		response.setCharacterEncoding("utf-8");
		
		memberDTO dto = dao.Login(dto1);
		
		String nextpage = "";
		
		if(dto != null) {
			
			HttpSession session = request.getSession();
			
			session.setAttribute("dto", dto);
			session.setAttribute("teamSeq", list);
			
			nextpage = "projectMain.jsp";
			
			}else{
				
			nextpage = "LoginFalse.jsp";
	}
	return nextpage;
	
	}
}
