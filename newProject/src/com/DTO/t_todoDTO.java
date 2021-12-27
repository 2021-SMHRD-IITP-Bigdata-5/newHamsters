package com.DTO;

import java.sql.Date;

public class t_todoDTO {
	// 팀 할일 테이블 

	    // 할일 순번 
	    private int todoSeq;

	    // 할일 제목 
	    private String todoTitle;

	    // 할일 설명 
	    private String todoContent;

	    // 등록 일자 
	    private Date regDate;

	    // 팀 순번 
	    private int teamSeq;

	    // 작성자 아이디 
	    private String memId;

	    // 관련자 아이디 
	    private String todoAttendance;

	    
	    
	    
	    public t_todoDTO(int todoSeq, String todoTitle, String todoContent, Date regDate, int teamSeq, String memId,
				String todoAttendance) {
			super();
			this.todoSeq = todoSeq;
			this.todoTitle = todoTitle;
			this.todoContent = todoContent;
			this.regDate = regDate;
			this.teamSeq = teamSeq;
			this.memId = memId;
			this.todoAttendance = todoAttendance;
		}

		public int getTodoSeq() {
	        return todoSeq;
	    }

	    public void setTodoSeq(int todoSeq) {
	        this.todoSeq = todoSeq;
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

	    public int getTeamSeq() {
	        return teamSeq;
	    }

	    public void setTeamSeq(int teamSeq) {
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
