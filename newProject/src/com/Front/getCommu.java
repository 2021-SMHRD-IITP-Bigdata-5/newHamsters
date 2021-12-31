package com.Front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.teamDAO;
import com.DTO.t_commuDTO;
import com.DTO.t_teamDTO;
import com.google.gson.Gson;

@WebServlet("/getCommu")
public class getCommu extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String teamseq = request.getParameter("teamseq");
		double teamSeq = Double.parseDouble(teamseq);
		
		teamDAO dao = new teamDAO();
		
		t_teamDTO t_DTO = dao.selectTeam(teamSeq);
		HttpSession session = request.getSession();
		ArrayList<t_commuDTO> commudto = (ArrayList<t_commuDTO>)session.getAttribute("teamSeq");
		
		// Gson 객체 생성
		Gson gson = new Gson();

		// java -> Gson(문자열)
		// Gson의 toJson(객체)메서드 사용 : String 타입의 json
		String json = gson.toJson(commudto); // arraylist 넣어주면 됨.

		// 인코딩하기
		response.setCharacterEncoding("utf-8");

		// 출력해줄 PrintWriter객체 생성
		PrintWriter out = response.getWriter();

		// 응답
		out.print(json);
	}

}
