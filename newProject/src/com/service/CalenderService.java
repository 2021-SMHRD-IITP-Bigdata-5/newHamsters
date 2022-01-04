package com.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.teamDAO;
import com.DTO.t_scheduleDTO;
import com.DTO.t_teamDTO;
import com.google.gson.Gson;
import com.inter.Command;

public class CalenderService implements Command {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      HttpSession session = request.getSession();
      t_teamDTO t_DTO = (t_teamDTO)session.getAttribute("teamName");
      double teamSeq1 = t_DTO.getTeamSeq();
      teamDAO dao  = new teamDAO();
      ArrayList<t_scheduleDTO> schedul = dao.getScheDTO(teamSeq1);
      
      
      response.setContentType("text/html; charset=utf-8;");
      
      Gson gson = new Gson();
      
      PrintWriter out = response.getWriter();
      out.print(gson.toJson(schedul));
      
      request.setAttribute("schedul", gson.toJson(schedul));      
      RequestDispatcher dis = request.getRequestDispatcher("Calender2.jsp");
      dis.forward(request, response);
      
      return null;
   }

}