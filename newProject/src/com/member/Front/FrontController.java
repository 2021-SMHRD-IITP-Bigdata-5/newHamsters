package com.member.Front;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inter.Command;
import com.member.DAO.memberDAO;
import com.member.service.DeleteService;
import com.member.service.JoinService;
import com.member.service.LoginService;
import com.member.service.LogoutService;
import com.member.service.UpdateService;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();		
		System.out.println(uri);
		
		String path = request.getContextPath();
		System.out.println(path);
		
		String command = uri.substring(path.length()+1);
		System.out.println("��û��� : "+command);
		
		Command com = null;
		String nextpage = null;
		
		
		if(command.equals("LoginCon.do")) {
			
			com = new LoginService();
			nextpage = com.execute(request,response); 
			// ��ĳ����(�θ��� �̸����� ����ȯ�� ���ش�)
			// Command pattern
			// ������� ��û�� ��ü�� Ŭ�������Ϸ� ó��
			
		}else if(command.equals("JoinCon.do")) {
			
			com = new JoinService();
			nextpage = com.execute(request, response);
			
		}else if(command.equals("DeleteCon.do")) {
			
			com = new DeleteService();
			nextpage = com.execute(request, response);
			
		}else if(command.equals("UpdateCon.do")) {
			
			com = new UpdateService();
			nextpage = com.execute(request, response);
			
		}else if(command.equals("LogoutCon.do")) {
			
			com = new LogoutService();
			nextpage = com.execute(request, response);
		
		}else if(command.equals("check.do")) {
			
			// 1. �Ķ���ͼ���
			String id = request.getParameter("id");
			
			// 2. DAO ��ü ����
			memberDAO dao = new memberDAO();
			
			boolean check = dao.idcheck(id);
			
			//�ߺ��� ���̵��Դϴ�
			PrintWriter out = response.getWriter();
			
			out.print(check);
			
		}
		if(nextpage != null) {
			response.sendRedirect(nextpage);
		}
		
	}

}
