package com.member.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inter.Command;
import com.member.DAO.memberDAO;
import com.member.DTO.memberDTO;

public class JoinService implements Command {
	
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("id");
		String memPw = request.getParameter("pw");
		String memName = request.getParameter("name");
		String memCompany = request.getParameter("com");
		String memEmail = request.getParameter("email");	
		String memPhone = request.getParameter("phone");	
		String memStatus = request.getParameter("statu");
		
		
		memberDTO dto = new memberDTO(memId, memPw, memName, memCompany, memEmail, memPhone, memStatus);
		
		memberDAO dao = new memberDAO();
		int cnt = dao.Join(dto);
		
		// 1. memberDAO�� �ش��ϴ� ���  �޼ҵ�� �� �����ֱ�(��ü����, �޼ҵ�, �Ű�����)
		// 2. cnt �� �������ֱ� (�޼ҵ�, ����)
		
		if(cnt > 0) {
			request.setAttribute("dto", dto);
			
			RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
			dis.forward(request, response);
		}else {
			
		}
		return null;
		
	}
	
}
