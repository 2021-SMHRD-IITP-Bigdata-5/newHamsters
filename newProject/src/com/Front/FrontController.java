package com.Front;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;
import com.inter.Command;
import com.service.CommuService;
import com.service.ConnectPageService;
import com.service.DeleteService;
import com.service.JoinService;
import com.service.LoginService;
import com.service.LogoutService;
import com.service.TodoService;
import com.service.UpdateService;
import com.service.WorkService;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();		
		System.out.println(uri);
		
		String path = request.getContextPath();
		System.out.println(path);
		
		String command = uri.substring(path.length()+1);
		System.out.println("요청기능 : "+command);
		
		Command com = null;
		String nextpage = null;
		
		
		if(command.equals("LoginCon.do")) {
			
			com = new LoginService();
			nextpage = com.execute(request,response); 
			
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
			
			// 1. 파라미터수집
			String id = request.getParameter("id");
			
			// 2. DAO 객체 생성
			memberDAO dao = new memberDAO();
			
			boolean check = dao.idcheck(id);
			
			//중복된 아이디입니다
			PrintWriter out = response.getWriter();
			out.print(check);
			
		}
		else if(command.equals("comWrite.do")) {
			com = new CommuService();
			nextpage = com.execute(request, response);
		}
		else if(command.equals("connectPage.do")) {
			com = new ConnectPageService();
			nextpage = com.execute(request, response);
		}
		else if(command.equals("workWrite.do")) {
			com = new WorkService();
			nextpage = com.execute(request, response);
		}
		else if(command.equals("todoWrite.do")) {
			com = new TodoService();
			nextpage = com.execute(request, response);
		}
		if(nextpage != null) {
			response.sendRedirect(nextpage);
		}
		
	}

}
