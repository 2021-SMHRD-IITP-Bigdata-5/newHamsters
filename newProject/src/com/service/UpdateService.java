package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;
import com.DTO.memberDTO;
import com.inter.Command;

public class UpdateService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		memberDTO dto = (memberDTO)session.getAttribute("dto");
		
		String id = dto.getMemId();
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");	
		String email = request.getParameter("email");
		
		memberDTO dto1 = new memberDTO(id, pw, email, tel);
		System.out.println(2);
		memberDAO dao = new memberDAO();
		System.out.println(3);
		int cnt = dao.Update(dto);
		System.out.println(4);
		if (cnt > 0) {
			System.out.println(5);
			memberDTO update_dto = new memberDTO(id, pw, email, tel);
			
			session.setAttribute("dto", update_dto);
			
			response.sendRedirect("projectMain.jsp");
			
		} else {
			
		}
		return null;
	}

}
