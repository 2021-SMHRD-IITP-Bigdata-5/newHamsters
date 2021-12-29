package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

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
	
public void getConn() {
	
	
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			System.out.println("Ŭ���������غ�");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
			String dbid = "cgi_7_1_1216";
			String dbpw = "smhrd1";

			conn = DriverManager.getConnection(url, dbid, dbpw);

			if (conn != null) {
				System.out.println("���Ἲ��");
			} else {
				System.out.println("�������");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		
		System.out.println("������ ����");
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
//        // Date�� �����ϱ� ���ؼ��� ��¥ ������ yyyy-mm-dd�� �����ؾ� �Ѵ�.
//        SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
//        
//        java.util.Date tempDate = null;
//        
//        try {
//            // ���� yyyymmdd�ε� ��¥ �������� java.util.Date��ü�� �����.
//            tempDate = beforeFormat.parse(date);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//        
//        // java.util.Date�� yyyy-mm-dd �������� �����Ͽ� String�� ��ȯ�Ѵ�.
//        String transDate = afterFormat.format(tempDate);
//        
//        // ��ȯ�� String ���� Date�� �����Ѵ�.
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
			psmt.setString(3, dto.getWorkStartDt());
			psmt.setString(4, dto.getWorkEndDt());
			psmt.setString(5, dto.getWorkProgress());
			psmt.setString(6, dto.getMemId());
			psmt.setDouble(7, dto.getTeamSeq());
			psmt.setString(8, dto.getReferenceId());
			System.out.println("dao" + dto.getWorkStartDt()+ "." +dto.getWorkEndDt());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Ŭ�������� �ε�����");
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
			System.out.println("Ŭ�������� �ε�����");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public t_teamDTO selectTeam(t_teamDTO dto) {
	      
	      try {
	         getConn();
	         
	         String sql = "select * from t_team where team_name = ?";
	         
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, dto.getTeamName());
	         
	         rs = psmt.executeQuery();
	         
	         if(rs.next()) {
					double teamSeq = rs.getDouble(1);
					String teamName = rs.getString(2);
					String teamCon = rs.getString(3);
					Date teamDate = rs.getDate(4);
					if(teamName.equals(dto.getTeamName())) {
						dto = new t_teamDTO(teamSeq, dto.getTeamName(), teamCon, teamDate);
					}
			}
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return dto;
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
			System.out.println("Ŭ�������� �ε�����");
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
	         System.out.println("Ŭ�������� �ε�����");
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      return cnt;
	   }
}
