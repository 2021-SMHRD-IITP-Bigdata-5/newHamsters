package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import javax.servlet.RequestDispatcher;

import com.DAO.memberDAO;
import com.DAO.teamDAO;
import com.DTO.memberDTO;
import com.DTO.t_commuDTO;
import com.DTO.t_teamDTO;
import com.inter.Command;

public class CommuService implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		memberDTO mdto = (memberDTO)session.getAttribute("dto");
		t_teamDTO t_DTO = (t_teamDTO)session.getAttribute("teamName");
		
		String articleTitle = request.getParameter("title");
		String articleContent = request.getParameter("content");
		String hashTag = request.getParameter("hashtag");
		double articleCnt = 0;
		double teamSeq = t_DTO.getTeamSeq();
		String memId = mdto.getMemId();
		
		System.out.println(teamSeq);
		System.out.println(articleTitle);
		System.out.println(memId);
		
		String nextpage = "";
		t_commuDTO tdto = new t_commuDTO(articleTitle, articleContent, hashTag, articleCnt, teamSeq, memId);
		teamDAO dao = new teamDAO();
		int cnt = dao.comWrite(tdto);
		
		
		
		if(cnt > 0) {
			
			RequestDispatcher dis = request.getRequestDispatcher("projectPage.jsp");
			dis.forward(request, response);
		}else {
			nextpage = "LoginFalse.jsp";
		}
		return null;
		
}
}