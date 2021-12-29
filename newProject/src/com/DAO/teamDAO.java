package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.DTO.memberDTO;
import com.DTO.t_commuDTO;
import com.DTO.t_scheduleDTO;
import com.DTO.t_teamDTO;
import com.DTO.t_todoDTO;
import com.DTO.t_workDTO;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

public class teamDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	memberDTO dto = null;
	private boolean check;
	t_teamDTO t_DTO =null;
	t_commuDTO comdto = null;
	t_workDTO workdto = null;
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
//	public Date transformDate(String date) throws java.text.ParseException{
//        SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
//        
//        // Date로 변경하기 위해서는 날짜 형식을 yyyy-mm-dd로 변경해야 한다.
//        SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
//        
//        java.util.Date tempDate = null;
//        
//        try {
//            // 현재 yyyymmdd로된 날짜 형식으로 java.util.Date객체를 만든다.
//            tempDate = beforeFormat.parse(date);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//        
//        // java.util.Date를 yyyy-mm-dd 형식으로 변경하여 String로 반환한다.
//        String transDate = afterFormat.format(tempDate);
//        
//        // 반환된 String 값을 Date로 변경한다.
//        Date d = Date.valueOf(transDate);
//        
//        return d;
//    }


	public int workWrite(t_workDTO dto) {
		try {
			getConn();
			
			String sql = "INSERT INTO t_work (work_title, work_content, work_start_dt, work_end_dt, work_progress, mem_id, team_seq, reference_id, reg_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getWorkTitle());
			psmt.setString(2, dto.getWorkContent());
			psmt.setDate(3, dto.getWorkStartDt());
			psmt.setDate(4, dto.getWorkEndDt());
			psmt.setString(5, dto.getWorkProgress());
			psmt.setString(6, dto.getMemId());
			psmt.setDouble(7, dto.getTeamSeq());
			psmt.setString(8, dto.getReferenceId());
			System.out.println("dao" + dto.getWorkStartDt()+ "." +dto.getWorkEndDt());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
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
	
	public t_teamDTO selectTeam(double team_seq) {
		t_teamDTO tdto = null;
	      try {
	         getConn();
	         
	         String sql = "select * from t_team where team_seq = ?";
	         
	         psmt = conn.prepareStatement(sql);
	         psmt.setDouble(1, team_seq);
	         System.out.println("팀선택dao");
	         rs = psmt.executeQuery();
	         
	         if(rs.next()) {
					double rteamSeq = rs.getDouble(1);
					String teamName = rs.getString(2);
					String teamCon = rs.getString(3);
					Date teamDate = rs.getDate(4);
					
					getCommu(rteamSeq);
					if(team_seq == rteamSeq) {
						tdto = new t_teamDTO(rteamSeq, teamName, teamCon, teamDate);
					}
			}
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return tdto;
	}
	public int todoWrite(t_todoDTO dto) {
		
		try {
			getConn();
			
			String sql = "INSERT INTO t_todo_list (todo_title, todo_content, reg_date, team_seq, mem_id, todo_attendance, todo_eventdate) VALUES (?, ?, sysdate, ?, ?, ?, ?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getTodoTitle());
			psmt.setString(2, dto.getTodoContent());
			psmt.setDouble(3, dto.getTeamSeq());
			psmt.setString(4, dto.getMemId());
			psmt.setString(5, dto.getTodoAttendance());
			psmt.setString(6, dto.getEventDate());
			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	public int scheWrite(t_scheduleDTO dto) {
	      try {
	         getConn();
	         
	         String sql = "INSERT INTO t_schedule(SCHE_TITLE, sche_contnet, sche_start_dt, sche_end_dt, reg_date, sche_attendance, team_seq, mem_id) VALUES (?, ?, ?, ?, sysdate, ?, ?, ?)";
	         
	         psmt = conn.prepareStatement(sql);
	         
	         psmt.setString(1, dto.getScheTitle());
	         psmt.setString(2, dto.getScheContnet());
	         psmt.setString(3, dto.getScheStartDt());
	         psmt.setString(4, dto.getScheEndDt());
	         psmt.setString(5, dto.getScheAttendance());
	         psmt.setDouble(6, dto.getTeamSeq());
	         psmt.setString(7, dto.getMemId());
	         
	         cnt = psmt.executeUpdate();
	      } catch (Exception e) {
	         System.out.println("클래스파일 로딩실패");
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      return cnt;
	   }
	public ArrayList<t_commuDTO> getCommu(double teamSeq1) {
	      ArrayList<t_commuDTO> arr = new ArrayList<t_commuDTO>();
	      try {
	            getConn();
	            
	            String sql = "select * from t_community where team_seq = ?";
	            
	            psmt = conn.prepareStatement(sql);
	            psmt.setDouble(1, teamSeq1);
	            
	            rs = psmt.executeQuery();
	            
	            while(rs.next()) {
	               double artiSeq = rs.getDouble(1);
	               String artiTitle = rs.getString(2);
	               String artiConte = rs.getString(3);
	               Date artiDate = rs.getDate(4);
	               String artiTag = rs.getString(5);
	               double articnt = rs.getDouble(6);
	               double teamSeq = rs.getDouble(7);
	               String memId = rs.getString(8);
	               
	               System.out.println("========================artiDate : "  + artiDate.getTime());
	               
	                  comdto = new t_commuDTO(artiSeq, artiTitle, artiConte, artiDate, artiTag, articnt, teamSeq, memId);
	                  arr.add(comdto);
	               }
	         
	         } catch (Exception e) {
	            System.out.println("클래스파일 로딩 실패");
	            e.printStackTrace();
	         } finally {
	            close();
	         }
	      return arr;
	   }
	public ArrayList<t_workDTO> getWork(double teamSeq1) {
	      ArrayList<t_workDTO> arr = new ArrayList<t_workDTO>();
	      try {
	            getConn();
	            
	            String sql = "select * from t_community where team_seq = ?";
	            
	            psmt = conn.prepareStatement(sql);
	            psmt.setDouble(1, teamSeq1);
	            
	            rs = psmt.executeQuery();
	            
	            while(rs.next()) {
	               double workSeq = rs.getDouble(1);
	               String workTitle = rs.getString(2);
	               String workContent = rs.getString(3);
	               Date startDt = rs.getDate(4);
	               Date endDt = rs.getDate(5);
	               String memId = rs.getString(6);
	               double teamSeq = rs.getDouble(7);
	               Date workDate = rs.getDate(8);
	               String refmem = rs.getString(9);
	               String workProgress = rs.getString(10);
	               
	               System.out.println("========================artiDate : "  + workDate.getTime());
	               
	                  workdto = new t_workDTO(workSeq, workTitle, workContent, startDt, endDt, memId, teamSeq, workDate, refmem, workProgress);
	                  arr.add(workdto);
	               }
	         
	         } catch (Exception e) {
	            System.out.println("클래스파일 로딩 실패");
	            e.printStackTrace();
	         } finally {
	            close();
	         }
	      return arr;
	   }
}
