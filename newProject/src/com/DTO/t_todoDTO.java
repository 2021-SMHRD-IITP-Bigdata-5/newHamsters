package com.DTO;

import java.sql.Date;

public class t_todoDTO {
	// 팀 할일 테이블 

	    // 할일 순번 
	    private double todoSeq;

	    // 할일 제목 
	    private String todoTitle;

	    // 할일 설명 
	    private String todoContent;

	    // 등록 일자 
	    private Date regDate;

	    // 팀 순번 
	    private double teamSeq;

	    // 작성자 아이디 
	    private String memId;

	    // 관련자 아이디 
	    private String todoAttendance;

	    private String eventDate;
	    
		public t_todoDTO(String todoTitle, String todoContent, double teamSeq, String memId,
				String todoAttendance, String eventDate) {
			this.todoTitle = todoTitle;
			this.todoContent = todoContent;
			this.teamSeq = teamSeq;
			this.memId = memId;
			this.todoAttendance = todoAttendance;
			this.eventDate = eventDate;
		}

		public String getEventDate() {
			return eventDate;
		}

		public void setEventDate(String eventDate) {
			this.eventDate = eventDate;
		}


	    public String getTodoTitle() {
	        return todoTitle;
	    }

	    public void setTodoTitle(String todoTitle) {
	        this.todoTitle = todoTitle;
	    }

	    public String getTodoContent() {
	        return todoContent;
	    }

	    public void setTodoContent(String todoContent) {
	        this.todoContent = todoContent;
	    }

	    public Date getRegDate() {
	        return regDate;
	    }

	    public void setRegDate(Date regDate) {
	        this.regDate = regDate;
	    }


	    public double getTodoSeq() {
			return todoSeq;
		}

		public void setTodoSeq(double todoSeq) {
			this.todoSeq = todoSeq;
		}

		public double getTeamSeq() {
			return teamSeq;
		}

		public void setTeamSeq(double teamSeq) {
			this.teamSeq = teamSeq;
		}

		public String getMemId() {
	        return memId;
	    }

	    public void setMemId(String memId) {
	        this.memId = memId;
	    }

	    public String getTodoAttendance() {
	        return todoAttendance;
	    }

	    public void setTodoAttendance(String todoAttendance) {
	        this.todoAttendance = todoAttendance;
	    }

	    // TTodoList 모델 복사
}
