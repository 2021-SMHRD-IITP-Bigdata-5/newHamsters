package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;
import com.inter.Command;

public class DeleteService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("delete_id");
		System.out.println("삭제하는 아이디 : " + id);
		
		//member_message 테이블에서 위 email 값 삭제 후
		// selectmember.jsp 로 이동
		memberDAO dao = new memberDAO();
		int cnt = dao.Delete(id);
		
		return "selectMember.jsp";
		
	}
	
	
	
}
