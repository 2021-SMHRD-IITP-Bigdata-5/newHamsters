package com.DTO;

import java.sql.Date;

public class t_scheduleDTO {
	// �� Ķ���� ���̺� 

	    // ���� ���� 
	    private int scheSeq;

	    // ���� ���� 
	    private String scheTitle;

	    // ���� ���� 
	    private String scheContnet;

	    // ���� ������������ 
	    private Date scheStartDt;

	    // ���� �������� 
	    private Date scheEndDt;

	    // ��� ���� 
	    private Date regDate;

	    // ���� �˶� 
	    private String scheAlarm;

	    // ������ 
	    private String scheAttendance;

	    // �� ���� 
	    private int teamSeq;

	    
	    
	    
	    public t_scheduleDTO(int scheSeq, String scheTitle, String scheContnet, Date scheStartDt, Date scheEndDt,
				Date regDate, String scheAlarm, String scheAttendance, int teamSeq) {
			super();
			this.scheSeq = scheSeq;
			this.scheTitle = scheTitle;
			this.scheContnet = scheContnet;
			this.scheStartDt = scheStartDt;
			this.scheEndDt = scheEndDt;
			this.regDate = regDate;
			this.scheAlarm = scheAlarm;
			this.scheAttendance = scheAttendance;
			this.teamSeq = teamSeq;
		}

		public int getScheSeq() {
	        return scheSeq;
	    }

	    public void setScheSeq(int scheSeq) {
	        this.scheSeq = scheSeq;
	    }

	    public String getScheTitle() {
	        return scheTitle;
	    }

	    public void setScheTitle(String scheTitle) {
	        this.scheTitle = scheTitle;
	    }

	    public String getScheContnet() {
	        return scheContnet;
	    }

	    public void setScheContnet(String scheContnet) {
	        this.scheContnet = scheContnet;
	    }

	    public Date getScheStartDt() {
	        return scheStartDt;
	    }

	    public void setScheStartDt(Date scheStartDt) {
	        this.scheStartDt = scheStartDt;
	    }

	    public Date getScheEndDt() {
	        return scheEndDt;
	    }

	    public void setScheEndDt(Date scheEndDt) {
	        this.scheEndDt = scheEndDt;
	    }

	    public Date getRegDate() {
	        return regDate;
	    }

	    public void setRegDate(Date regDate) {
	        this.regDate = regDate;
	    }

	    public String getScheAlarm() {
	        return scheAlarm;
	    }

	    public void setScheAlarm(String scheAlarm) {
	        this.scheAlarm = scheAlarm;
	    }

	    public String getScheAttendance() {
	        return scheAttendance;
	    }

	    public void setScheAttendance(String scheAttendance) {
	        this.scheAttendance = scheAttendance;
	    }

	    public int getTeamSeq() {
	        return teamSeq;
	    }

	    public void setTeamSeq(int teamSeq) {
	        this.teamSeq = teamSeq;
	    }

}
