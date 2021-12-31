package com.service;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.teamDAO;
import com.DTO.memberDTO;
import com.DTO.t_scheduleDTO;
import com.DTO.t_teamDTO;
import com.inter.Command;

public class ScheduleService implements Command {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      request.setCharacterEncoding("utf-8");

      HttpSession session = request.getSession();
      memberDTO mdto = (memberDTO) session.getAttribute("dto");
      t_teamDTO tdto = (t_teamDTO) session.getAttribute("teamName");

      String scheTitle = request.getParameter("title");
      String scheContnet = request.getParameter("content");
      String scheStartDt2 = request.getParameter("std");
      String scheEndDt2 = request.getParameter("endd");
      String scheAttendance = request.getParameter("attend");
      double teamSeq = tdto.getTeamSeq();
      String memId = mdto.getMemId();
      
      
    //String type 으로 받아온 date 정보를 localdate로 형변환
    		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.US);
    		LocalDate scheStartDt3 = LocalDate.parse(scheStartDt2, formatter);
    		LocalDate scheEndDt3 = LocalDate.parse(scheEndDt2, formatter);
    		
    		// localDate -> date
    		Date scheStartDt = java.sql.Date.valueOf(scheStartDt3);
    		Date scheEndDt = java.sql.Date.valueOf(scheEndDt3);

      System.out.println("입력받은날짜 : " + scheStartDt + scheEndDt);
      System.out.println("팀시퀀스" + teamSeq);
      System.out.println("title :" + scheTitle);

      String nextpage = "";
      t_scheduleDTO dto = new t_scheduleDTO(scheTitle, scheContnet, scheStartDt, scheEndDt, scheAttendance, teamSeq, memId);
      teamDAO dao = new teamDAO();
      int cnt = dao.scheWrite(dto);

      if (cnt > 0) {
         RequestDispatcher dis = request.getRequestDispatcher("projectPage.jsp");
         dis.forward(request, response);
      } else {
         nextpage = "LoginFalse.jsp";
      }

      return null;
   }

}