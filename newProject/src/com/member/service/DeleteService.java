package com.member.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inter.Command;
import com.member.DAO.memberDAO;

public class DeleteService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("delete_id");
		System.out.println("�����ϴ� �̸��� : " + id);
		
		//member_message ���̺��� �� email �� ���� ��
		// selectmember.jsp �� �̵�
		memberDAO dao = new memberDAO();
		int cnt = dao.Delete(id);
		
		return "selectMember.jsp";
		
	}
	
	
	
}
