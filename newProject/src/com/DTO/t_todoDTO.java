package com.DTO;

import java.sql.Date;

public class t_todoDTO {
	// �� ���� ���̺� 

	    // ���� ���� 
	    private int todoSeq;

	    // ���� ���� 
	    private String todoTitle;

	    // ���� ���� 
	    private String todoContent;

	    // ��� ���� 
	    private Date regDate;

	    // �� ���� 
	    private int teamSeq;

	    // �ۼ��� ���̵� 
	    private String memId;

	    // ������ ���̵� 
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

	    // TTodoList �� ����
}
