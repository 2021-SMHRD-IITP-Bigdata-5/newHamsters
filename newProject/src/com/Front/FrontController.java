package com.Front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;
import com.google.gson.Gson;
import com.inter.Command;
import com.service.CalenderService;
import com.service.CommuService;
import com.service.ConnectPageService;
import com.service.DeleteService;
import com.service.JoinService;
import com.service.LoginService;
import com.service.LogoutService;
import com.service.ScheduleService;
import com.service.TodoService;
import com.service.UpdateService;
import com.service.WorkChangeService;
import com.service.WorkService;
import com.service.acceptTeamService;
import com.service.createTeamService;
import com.service.deleteTeamService;
import com.service.inviteService;
import com.service.mainService;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		System.out.println(uri);

		String path = request.getContextPath();
		System.out.println(path);

		String command = uri.substring(path.length() + 1);
		System.out.println("요청기능 : " + command);

		Command com = null;
		String nextpage = null;

		if (command.equals("LoginCon.do")) {

			com = new LoginService();
			nextpage = com.execute(request, response);

		} else if (command.equals("JoinCon.do")) {

			com = new JoinService();
			nextpage = com.execute(request, response);

		} else if (command.equals("DeleteCon.do")) {

			com = new DeleteService();
			nextpage = com.execute(request, response);

		} else if (command.equals("UpdateCon.do")) {

			com = new UpdateService();
			nextpage = com.execute(request, response);

		} else if (command.equals("LogoutCon.do")) {

			com = new LogoutService();
			nextpage = com.execute(request, response);

		} else if (command.equals("check.do")) {

			// 1. 파라미터수집
			String id = request.getParameter("id");

			// 2. DAO 객체 생성
			memberDAO dao = new memberDAO();

			boolean check = dao.idcheck(id);

			// 중복된 아이디입니다
			PrintWriter out = response.getWriter();
			out.print(check);

		} else if (command.equals("comWrite.do")) {
			com = new CommuService();
			nextpage = com.execute(request, response);
		} else if (command.equals("connectPage.do")) {
			com = new ConnectPageService();
			nextpage = com.execute(request, response);
		} else if (command.equals("workWrite.do")) {
			com = new WorkService();
			nextpage = com.execute(request, response);
		} else if (command.equals("todoWrite.do")) {
			com = new TodoService();
			nextpage = com.execute(request, response);
		} else if (command.equals("schedule.do")) {
			com = new ScheduleService();
			nextpage = com.execute(request, response);
		} else if (command.equals("createTeam.do")) {
			com = new createTeamService();
			nextpage = com.execute(request, response);
		} else if (command.equals("deleteTeam.do")) {
			com = new deleteTeamService();
			nextpage = com.execute(request, response);
		} else if (command.equals("GetDate.do")) {
			com = new CalenderService();
			nextpage = com.execute(request, response);
		} else if (command.equals("searchMember.do")) {
			String name = request.getParameter("name");
			memberDAO dao = new memberDAO();
			ArrayList<com.DTO.memberDTO> list = dao.searchMember(name);
			
			Gson gson = new Gson();
			String json = gson.toJson(list);
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		} else if (command.equals("invite.do")) {
			com = new inviteService();
			nextpage = com.execute(request, response);
		} else if (command.equals("WorkChange.do")) {
			com = new WorkChangeService();
			nextpage = com.execute(request, response);
		} else if (command.equals("acceptTeam.do")) {
			com = new acceptTeamService();
			nextpage = com.execute(request, response);
		} else if (command.equals("main.do")) {
			com = new mainService();
			nextpage = com.execute(request, response);
		}
		
		
		
		if (nextpage != null) {
			response.sendRedirect(nextpage);
		}

	}

}
