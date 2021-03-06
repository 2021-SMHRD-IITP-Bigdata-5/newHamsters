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

public class WorkService implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		memberDTO mdto = (memberDTO) session.getAttribute("dto");
		t_teamDTO tdto = (t_teamDTO) session.getAttribute("teamName");

		String workTitle = request.getParameter("title");
		String workContent = request.getParameter("content");
		String workStartDt2 = request.getParameter("startdt");
		String workEndDt2 = request.getParameter("enddt");
		String workProgress = request.getParameter("progress");

		String progress = "";
		System.out.println(workProgress);
		if (workProgress.equals("요청")) {
			progress = "1";
		} else if (workProgress.equals("진행")) {
			progress = "2";
		} else if (workProgress.equals("피드백")) {
			progress = "3";
		} else if (workProgress.equals("완료")) {
			progress = "4";
		} else if (workProgress.equals("보류")) {
			progress = "5";
		}
		System.out.println(progress);

		String memId = mdto.getMemId();
		double teamSeq = tdto.getTeamSeq();
		String referenceId = request.getParameter("ref");

		// String type 으로 받아온 date 정보를 localdate로 형변환
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.US);
		LocalDate workStartDt3 = LocalDate.parse(workStartDt2, formatter);
		LocalDate workEndDt3 = LocalDate.parse(workEndDt2, formatter);

		// localDate -> date
		Date workStartDt = java.sql.Date.valueOf(workStartDt3);
		Date workEndDt = java.sql.Date.valueOf(workEndDt3);

		System.out.println("입력받은날짜 : " + workStartDt + workEndDt);
		System.out.println("팀시퀀스" + teamSeq);
		System.out.println("입력하는 사람의 아이디" + memId);

		String nextpage = "";
		t_workDTO dto = new t_workDTO(workTitle, workContent, workStartDt, workEndDt, progress, memId, teamSeq,
				referenceId);
		teamDAO dao = new teamDAO();
		int cnt = dao.workWrite(dto);

		ArrayList<t_workDTO> list2 = dao.getWork(teamSeq);

		if (cnt > 0) {
			session.setAttribute("teamSeq1", list2);
			RequestDispatcher dis = request.getRequestDispatcher("projectPageWork.jsp");
			dis.forward(request, response);
		} else {
			nextpage = "LoginFalse.jsp";
		}
		return null;
	}

}
