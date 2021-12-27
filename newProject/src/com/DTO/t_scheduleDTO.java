package com.DTO;

import java.sql.Date;

public class t_scheduleDTO {
	// 팀 캘린더 테이블 

	    // 일정 순번 
	    private int scheSeq;

	    // 일정 제목 
	    private String scheTitle;

	    // 일정 내용 
	    private String scheContnet;

	    // 일정 시작일자일정 
	    private Date scheStartDt;

	    // 일정 마감일자 
	    private Date scheEndDt;

	    // 등록 일자 
	    private Date regDate;

	    // 일정 알람 
	    private String scheAlarm;

	    // 참석자 
	    private String scheAttendance;

	    // 팀 순번 
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
