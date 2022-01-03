/*
 * package com.service;
 * 
 * import java.io.IOException;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * import com.DAO.memberDAO; import com.DTO.memberDTO; import com.inter.Command;
 * 
 * public class UpdateService implements Command {
 * 
 * @Override public String execute(HttpServletRequest request,
 * HttpServletResponse response) throws ServletException, IOException {
 * 
 * request.setCharacterEncoding("utf-8");
 * 
 * HttpSession session = request.getSession(); memberDTO dto =
 * (memberDTO)session.getAttribute("dto");
 * 
 * String id = dto.getMemId(); String pw = request.getParameter("pw"); String
 * tel = request.getParameter("tel"); String email =
 * request.getParameter("email");
 * 
 * memberDTO dto1 = new memberDTO(id, pw, email, tel); System.out.println(2);
 * memberDAO dao = new memberDAO(); System.out.println(3); int cnt =
 * dao.Update(dto); System.out.println(4); if (cnt > 0) { System.out.println(5);
 * memberDTO update_dto = new memberDTO(id, pw, email, tel);
 * 
 * session.setAttribute("dto", update_dto);
 * 
 * response.sendRedirect("projectMain.jsp");
 * 
 * } else {
 * 
 * } return null; }
 * 
 * }
 */


package com.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;
import com.DTO.memberDTO;
import com.inter.Command;

public class UpdateService implements Command {
   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
      
      request.setCharacterEncoding("utf-8");
      
      HttpSession session = request.getSession();
      memberDTO dto = (memberDTO)session.getAttribute("dto");
      
      String memId = dto.getMemId();
      String memName = dto.getMemName();
      String memCompany = dto.getMemCompany();
      String memStatus = dto.getMemStatus();
      String memPw = request.getParameter("pw");
      String memEmail = request.getParameter("tel");   
      String memPhone = request.getParameter("email");
      
      memberDAO dao = new memberDAO();
      memberDTO memdto = new memberDTO(memId, memPw, memName, memCompany, memEmail, memPhone, memStatus);
      String nextpage = "";
      int cnt = dao.UpdateMem(memdto);
      
      if (cnt > 0) {
         memberDTO newdto = new memberDTO(memId, memPw, memName, memCompany, memEmail, memPhone, memStatus);
         session.setAttribute("dto", newdto);
         RequestDispatcher dis = request.getRequestDispatcher("projectMain.jsp");
           dis.forward(request, response);
      } else {
         nextpage = "LoginFalse.jsp";
      }
      return null;
   }

}
