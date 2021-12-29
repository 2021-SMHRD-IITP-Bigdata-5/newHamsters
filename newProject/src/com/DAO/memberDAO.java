package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.DTO.memberDTO;
import com.DTO.t_teamDTO;
	
public class memberDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	int cnt = 0;
	memberDTO dto = null;
	private boolean check;
	t_teamDTO dtot = null;
	public void getConn() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			System.out.println("클래스파일준비");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
			String dbid = "cgi_7_1_1216";
			String dbpw = "smhrd1";

			conn = DriverManager.getConnection(url, dbid, dbpw);

			if (conn != null) {
				System.out.println("연결성공");
			} else {
				System.out.println("연결실패");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		
		System.out.println("무조건 실행");
		try {
			if (rs != null){
				rs.close();			
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int Join(memberDTO dto) {
		
		try {
			getConn();
			// --------------DB연결------
			String sql = "insert into t_member values (?, ?, ?, ?, ?, ?, ?, sysdate)";
			// 5. SQL명령문을 준비
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMemId());
			psmt.setString(2, dto.getMemPw());
			psmt.setString(3, dto.getMemName());
			psmt.setString(4, dto.getMemCompany());
			psmt.setString(5, dto.getMemEmail());
			psmt.setString(6, dto.getMemPhone());
			psmt.setString(7, dto.getMemStatus());

			System.out.println(dto.getMemName());
			// 6. SQL명령문 실행
			cnt = psmt.executeUpdate();

			// 7.명령 후 처리

		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int Delete(String id) {
	
		try {
			getConn();

			String sql = "delete from member where id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;
	}

	public int Update(memberDTO dto) {
	
		try {
			getConn();

			String sql = "update member_message set pw = ? ,name= ?,company = ?, email = ?, phone = ?, status= ? where id = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getMemPw());
			psmt.setString(2, dto.getMemName());
			psmt.setString(3, dto.getMemCompany());
			psmt.setString(4, dto.getMemEmail());
			psmt.setString(5, dto.getMemPhone());
			psmt.setString(6, dto.getMemStatus());
			psmt.setString(7, dto.getMemId());

			// 6. SQL명령문 실행
			cnt = psmt.executeUpdate();

			// 7.명령 후 처리

		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public memberDTO Login(memberDTO dto1) {
		
		
		try {
			getConn();

			String sql = "select * from t_member where mem_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto1.getMemId());
			
			rs = psmt.executeQuery();

			if (rs.next()) {
				String getId = rs.getString(1);
				String getPw = rs.getString(2);
				String getName = rs.getString(3);
				String getCom = rs.getString(4);
				String getEmail = rs.getString(5);
				String getPhone = rs.getString(6);
				String getStat = rs.getString(7);
				System.out.println("로그인dao");
//				sql = "select team_seq from t_team where mem_id = ?";
//				psmt = conn.prepareStatement(sql);
//				psmt.setString(1, dto1.getMemId());
//				rs = psmt.executeQuery();
//				
//				if(rs.next()) {
//				double getSeq = rs.getDouble(1);
//				System.out.println(getSeq);
//				}
				teamSeq(dto1.getMemId());
				if(dto1.getMemPw().equals(getPw)) {
					dto = new memberDTO(dto1.getMemId(), getPw, getName, getCom, getEmail, getPhone, getStat);
					
			}
			}
		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		} finally {
			close();
		}System.out.println(dto);
		return dto;
	}
	
	

	public boolean idcheck(String id) {
		
		try {
			getConn();
			
			String sql = "select * from t_member where mem_Id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			
			rs = psmt.executeQuery();
			check = rs.next();
			
		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		} finally {
			close();
		}
		
		return check;
	}
	public ArrayList<t_teamDTO> teamSeq(String memid){
		ArrayList<t_teamDTO> arr = new ArrayList<t_teamDTO>();
		memberDTO dto1 = null;
		try {
			getConn();
			
			String sql = "select * from t_team where mem_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, memid);
			rs = psmt.executeQuery();
			System.out.println("어레이리스트 팀시퀀스");
			while(rs.next()) {
				double teamSeq = rs.getDouble(1);
				String teamName = rs.getString(2);
				String teamCon = rs.getString(3);
				Date teamDate = rs.getDate(4);
				dtot = new t_teamDTO(teamSeq, teamName, teamCon, teamDate);
				arr.add(dtot);
				System.out.println(arr);
				System.out.println(teamSeq);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return arr;
	}
}

