package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.lang.model.element.ExecutableElement;

import com.DTO.memberDTO;
import com.DTO.t_commuDTO;
import com.DTO.t_scheduleDTO;
import com.DTO.t_teamDTO;
import com.DTO.t_team_memberDTO;
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
	t_teamDTO t_DTO = null;
	t_commuDTO comdto = null;
	t_workDTO workdto = null;
	t_todoDTO tododto = null;
	t_team_memberDTO t_memdto = null;
	t_scheduleDTO schedto = null;

	public void getConn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
			String dbid = "cgi_7_1_1216";
			String dbpw = "smhrd1";

			conn = DriverManager.getConnection(url, dbid, dbpw);

			if (conn != null) {
				System.out.println("연결성공");
			} else {
				System.out.println("연결실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {

		System.out.println("무조건 실행");
		try {
			if (rs != null) {
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
			System.out.println("dao" + dto.getWorkStartDt() + "." + dto.getWorkEndDt());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		} finally {
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

			if (rs.next()) {
				double rteamSeq = rs.getDouble(1);
				String teamName = rs.getString(2);
				String teamCon = rs.getString(3);
				Date teamDate = rs.getDate(4);

				getCommu(rteamSeq);
				getWork(rteamSeq);
				if (team_seq == rteamSeq) {
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
			psmt.setDate(6, dto.getEventDate());

			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		} finally {
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

			String sql = "select * from t_community where team_seq = ? order by article_seq desc";

			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, teamSeq1);

			rs = psmt.executeQuery();

			while (rs.next()) {
				double artiSeq = rs.getDouble(1);
				String artiTitle = rs.getString(2);
				String artiConte = rs.getString(3);
				Date artiDate = rs.getDate(4);
				String artiTag = rs.getString(5);
				double articnt = rs.getDouble(6);
				double teamSeq = rs.getDouble(7);
				String memId = rs.getString(8);

				System.out.println("========================artiDate : " + artiDate.getTime());

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
		ArrayList<t_workDTO> arr2 = new ArrayList<t_workDTO>();
		try {
			getConn();

			String sql = "select * from t_work where team_seq = ? order by work_seq desc";

			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, teamSeq1);

			rs = psmt.executeQuery();

			while (rs.next()) {
				double workSeq = rs.getDouble(1);
				String workTitle = rs.getString(2);
				String workContent = rs.getString(3);
				Date startDt = rs.getDate(4);
				Date endDt = rs.getDate(5);
				String memId = rs.getString(6);
				double teamSeq = rs.getDouble(7);
				String refmem = rs.getString(8);
				Date workDate = rs.getDate(9);
				String workProgress = rs.getString(10);

				System.out.println("========================artiDate : " + workDate.getTime());

				workdto = new t_workDTO(workSeq, workTitle, workContent, startDt, endDt, workProgress, memId, teamSeq,
						refmem, workDate);
				arr2.add(workdto);
			}

		} catch (Exception e) {
			System.out.println("클래스파일 로딩 실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return arr2;
	}

	public ArrayList<t_todoDTO> getTodoDTO(double teamSeq1) {
		ArrayList<t_todoDTO> arr3 = new ArrayList<t_todoDTO>();
		try {
			getConn();

			String sql = "select * from t_todo_list where team_seq = ? order by todo_seq desc";

			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, teamSeq1);

			rs = psmt.executeQuery();

			while (rs.next()) {
				double todoSeq = rs.getDouble(1);
				String todoTitle = rs.getString(2);
				String todoContent = rs.getString(3);
				Date regDate = rs.getDate(4);
				double teamSeq = rs.getDouble(5);
				String memId = rs.getString(6);
				String todoAtten = rs.getString(7);
				Date todoEvd = rs.getDate(8);

				System.out.println("========================todoDate : " + regDate.getTime());

				tododto = new t_todoDTO(todoSeq, todoTitle, todoContent, regDate, teamSeq, memId, todoAtten, todoEvd);
				arr3.add(tododto);
			}

		} catch (Exception e) {
			System.out.println("클래스파일 로딩 실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return arr3;
	}

	public int createTeam(t_teamDTO dto) {

		try {

			getConn();

			String sql = "INSERT INTO t_team (team_name, team_content, reg_date, mem_id) VALUES (?, ?, sysdate, ?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getTeamName());
			psmt.setString(2, dto.getTeamContent());
			psmt.setString(3, dto.getMemId());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("클래스파일 로딩 실패");
			e.printStackTrace();
		} finally {
			close();
		}

		return 1;
	}

	public ArrayList<t_team_memberDTO> getMembers(double teamSeq1) {
		ArrayList<t_team_memberDTO> arr4 = new ArrayList<t_team_memberDTO>();
		try {
			getConn();

			String sql = "select * from t_team_members where team_seq = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, teamSeq1);

			rs = psmt.executeQuery();

			while (rs.next()) {

				String memId = rs.getString(2);
				double teamSeq = rs.getDouble(3);
				String memo = rs.getString(4);
				String adminyn = rs.getString(5);
				Date regDate = rs.getDate(6);

				t_memdto = new t_team_memberDTO(memId, teamSeq, regDate, memo, adminyn);
				arr4.add(t_memdto);
			}

		} catch (Exception e) {
			System.out.println("클래스파일 로딩 실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return arr4;
	}

	/*
	 * public ArrayList<t_scheduleDTO> getScheDTO(double teamSeq1) {
	 * ArrayList<t_scheduleDTO> arr5 = new ArrayList<t_scheduleDTO>(); try {
	 * getConn();
	 * 
	 * String sql = "select * from t_schedule where team_seq = ?";
	 * 
	 * psmt = conn.prepareStatement(sql); psmt.setDouble(1, teamSeq1);
	 * 
	 * rs = psmt.executeQuery();
	 * 
	 * while (rs.next()) { double scheSeq = rs.getDouble(1); String scheTitle =
	 * rs.getString(2); String scheContent = rs.getString(3); Date scheStd =
	 * rs.getDate(4); Date scheEndd = rs.getDate(5); Date regDate = rs.getDate(6);
	 * double teamSeq = rs.getDouble(7); String scheAtten = rs.getString(8); String
	 * memId = rs.getString(9);
	 * 
	 * System.out.println("========================todoDate : " +
	 * regDate.getTime());
	 * 
	 * if (teamSeq1 == teamSeq) { schedto = new t_scheduleDTO(scheSeq, scheTitle,
	 * scheContent, scheStd, scheEndd, regDate, scheAtten, teamSeq, memId);
	 * arr5.add(schedto); } }
	 * 
	 * } catch (Exception e) { System.out.println("클래스파일 로딩 실패");
	 * e.printStackTrace(); } finally { close(); } return arr5; }
	 */

	public int getteamSeq(t_teamDTO dto) {
		String seq = "";
		try {
			System.out.println("팀시퀀스실행");
			getConn();

			String sql = "select max(team_seq) from t_team where mem_id = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getMemId());

			rs = psmt.executeQuery();
			if (rs.next()) {
				seq = rs.getString(1);
				System.out.println("리턴값" + seq);
				sql = "insert into t_team_members(mem_id, team_seq, tm_memo, admin_yesno, reg_date) values(?, ?, '하윙', '1', sysdate)";
				psmt = conn.prepareStatement(sql);

				psmt.setString(1, dto.getMemId());
				System.out.println(dto.getMemId());
				psmt.setString(2, seq);
				System.out.println(seq);
				cnt = psmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("클래스파일 로딩 실패");
			e.printStackTrace();
		} finally {
			close();

		}
		return cnt;

	}

	public int deleteTeam(String teamSeq) {

		try {
			getConn();

			String sql = "delete from t_team where team_seq = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, teamSeq);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("클래스파일 로딩 실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public ArrayList<t_scheduleDTO> getScheDTO(double teamSeq1) {
		ArrayList<t_scheduleDTO> arr5 = new ArrayList<t_scheduleDTO>();
		try {
			getConn();

			String sql = "select * from t_schedule where team_seq = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, teamSeq1);

			rs = psmt.executeQuery();

			while (rs.next()) {
				double scheSeq = rs.getDouble(1);
				String scheTitle = rs.getString(2);
				String scheContent = rs.getString(3);
				String scheStd = rs.getString(4);
				String scheEndd = rs.getString(5);
				Date regDate = rs.getDate(6);
				String scheAtten = rs.getString(7);
				double teamSeq = rs.getDouble(8);
				String memId = rs.getString(9);

				System.out.println("========================todoDate : " + regDate.getTime());

				if (teamSeq1 == teamSeq) {
					schedto = new t_scheduleDTO(scheSeq, scheTitle, scheContent, scheStd, scheEndd, regDate, scheAtten,
							teamSeq, memId);
					arr5.add(schedto);
				}
			}

		} catch (Exception e) {
			System.out.println("클래스파일 로딩 실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return arr5;
	}
	
	  public t_team_memberDTO teamMemberdto(String memid, double teamseq) {
		   t_team_memberDTO ttmem = null;
		   try {
				getConn();

				String sql = "select * from t_team_members where team_seq = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setDouble(1, teamseq);
				
				rs = psmt.executeQuery();

				if (rs.next()) {
					Double gettmMemSeq = rs.getDouble(1);
					String gettmId = rs.getString(2);
					Double gettmSeq = rs.getDouble(3);
					String gettmMemo = rs.getString(4);
					String gettmAdmin = rs.getString(5);
					Date gettmDate = rs.getDate(6);
					
					if(memid.equals(gettmId)) {
						ttmem = new t_team_memberDTO(gettmMemSeq, gettmId, gettmSeq, gettmDate, gettmMemo, gettmAdmin);
						
					}
					
				}
			} catch (Exception e) {
				System.out.println("클래스파일 로딩실패");
				e.printStackTrace();
			} finally {
				close();
			}
		
		   
		   return ttmem;
	   }
	  
	   public int insertTeam(String memid, double teamseq) {
		      
		      try {
		         getConn();
		         
		         String sql = "insert into t_team_members(mem_id, team_seq, tm_memo, admin_yesno, reg_date) values(?, ?, '팀원', '0', sysdate)";
		         
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, memid);
		         psmt.setDouble(2, teamseq);

		         cnt = psmt.executeUpdate();
		         
		      } catch (Exception e) {
		         System.out.println("클래스파일 로딩 실패");
		         e.printStackTrace();
		      }finally {
		         close();
		      }
		      
		      return cnt;
		   }
	   
		public int changeProgress(String progress, double workseq) {

				try {
					getConn();
					
					String sql = "update t_work set work_progress = ? where work_seq = ?";
					
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, progress);
			        psmt.setDouble(2, workseq);

					cnt = psmt.executeUpdate();
				} catch (Exception e) {
					System.out.println("클래스파일 로딩 실패");
			         e.printStackTrace();
				} finally {
					close();
				}
				return cnt;

			}
		
		
}
