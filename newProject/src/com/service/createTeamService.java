package com.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.teamDAO;
import com.DTO.memberDTO;
import com.DTO.t_teamDTO;
import com.inter.Command;

public class createTeamService implements Command {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      request.setCharacterEncoding("utf-8");
      
      HttpSession session = request.getSession();
       memberDTO mdto = (memberDTO) session.getAttribute("dto");
       
       String teamName = request.getParameter("title");
       String teamContent = request.getParameter("content");
       String memId = mdto.getMemId();
       
       teamDAO dao = new teamDAO();
       t_teamDTO dto = new t_teamDTO(teamName, teamContent, memId);
       int cnt = dao.createTeam(dto);
      String nextpage = "";
      
       if (cnt > 0) {
            RequestDispatcher dis = request.getRequestDispatcher("projectMain.jsp");
            dis.forward(request, response);
         } else {
            nextpage = "LoginFalse.jsp";
         }
      
      return null;
   }
}