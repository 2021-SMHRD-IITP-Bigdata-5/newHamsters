package com.service;

import java.io.IOException;

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
      String scheStartDt = request.getParameter("std");
      String scheEndDt = request.getParameter("endd");
      String scheAttendance = request.getParameter("attend");
      double teamSeq = tdto.getTeamSeq();
      String memId = mdto.getMemId();

      System.out.println("ÀÔ·Â¹ÞÀº³¯Â¥ : " + scheStartDt + scheEndDt);
      System.out.println("ÆÀ½ÃÄö½º" + teamSeq);
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