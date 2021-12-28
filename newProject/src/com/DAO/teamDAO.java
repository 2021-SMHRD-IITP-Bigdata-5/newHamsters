package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DTO.memberDTO;
import com.DTO.t_commuDTO;
import com.DTO.t_workDTO;

public class teamDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	memberDTO dto = null;
	private boolean check;
	
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
	
	public void connWork() {
		try {
			getConn();
			
			String sql = "select w.work_title, w.work_content, w.work_start_dt, w.work_end_dt, w.work_progress, w.mem_id, w.team_seq, w.reference_id, w.reg_date from t_work w , t_team t where w.team_seq=t.team_seq and w.team_seq = ?";
			
		} catch (Exception e) {
			
		}
	}
	public void workWrite(t_workDTO dto) {
		try {
			getConn();
			
			String sql = "";
		} catch (Exception e) {
		}finally {
			close();
		}
	}
	public int comWrite(t_commuDTO dto) {
		
		try {
			getConn();
			
			String sql = "INSERT INTO t_community(article_title, article_content, article_date, hash_tag, article_cnt, team_seq, mem_id) VALUES (?, ?, sysdate, ?, ?, ?, ?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getArticleTitle());
			psmt.setString(2, dto.getArticleContent());
			psmt.setString(3, dto.getHashTag());
			psmt.setDouble(4, dto.getArticleCnt());
			psmt.setDouble(5, dto.getTeamSeq());
			psmt.setString(6, dto.getMemId());
			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
