package com.service;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.teamDAO;
import com.DTO.memberDTO;
import com.DTO.t_teamDTO;
import com.DTO.t_workDTO;
import com.inter.Command;

import oracle.sql.DATE;

public class WorkChangeService implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String work = request.getParameter("workChange");
		String workseq1 = request.getParameter("workseq1");
		double workseq = Double.parseDouble(workseq1);

		String progress = "";
		if(work.equals("요청")) {
			progress = "1";
		} else if(work.equals("진행")) {
			progress = "2";
		}else if(work.equals("피드백")) {
			progress = "3";
		}else if(work.equals("완료")) {
			progress = "4";
		}else if(work.equals("보류")) {
			progress = "5";
		}
		
		
		teamDAO dao = new teamDAO();
		int cnt = dao.changeProgress(progress, workseq);
		System.out.println(progress);
		System.out.println(workseq);
		//상태값 DB에 저장
		String nextpage = "";
		if(cnt > 0) {
			RequestDispatcher dis = request.getRequestDispatcher("projectPageWork.jsp");
	        dis.forward(request, response);
		}else {
			nextpage  = "Login.jsp";
		}
		return null;
	}
	
	
}
