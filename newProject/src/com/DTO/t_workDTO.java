package com.DTO;

import java.sql.Date;

public class t_workDTO {
	// 팀 업무 테이블 

	    // 업무 순번 
	    private int workSeq;

	    // 업무 제목 
	    private String workTitle;

	    // 업무 내용 
	    private String workContent;

	    // 업무 시작일자 
	    private Date workStartDt;

	    // 업무 종료일자 
	    private Date workEndDt;

	    // 업무 진행상황 
	    private String workProgress;

	    // 작성자 아이디 
	    private String memId;

	    // 팀 순번 
	    private int teamSeq;

	    // 참조 아이디 
	    private String referenceId;

	    // 등록 일자 
	    private Date regDate;

	    
	    public t_workDTO(int workSeq, String workTitle, String workContent, Date workStartDt, Date workEndDt,
				String workProgress, String memId, int teamSeq, String referenceId, Date regDate) {
			super();
			this.workSeq = workSeq;
			this.workTitle = workTitle;
			this.workContent = workContent;
			this.workStartDt = workStartDt;
			this.workEndDt = workEndDt;
			this.workProgress = workProgress;
			this.memId = memId;
			this.teamSeq = teamSeq;
			this.referenceId = referenceId;
			this.regDate = regDate;
		}

		public int getWorkSeq() {
	        return workSeq;
	    }

	    public void setWorkSeq(int workSeq) {
	        this.workSeq = workSeq;
	    }

	    public String getWorkTitle() {
	        return workTitle;
	    }

	    public void setWorkTitle(String workTitle) {
	        this.workTitle = workTitle;
	    }

	    public String getWorkContent() {
	        return workContent;
	    }

	    public void setWorkContent(String workContent) {
	        this.workContent = workContent;
	    }

	    public Date getWorkStartDt() {
	        return workStartDt;
	    }

	    public void setWorkStartDt(Date workStartDt) {
	        this.workStartDt = workStartDt;
	    }

	    public Date getWorkEndDt() {
	        return workEndDt;
	    }

	    public void setWorkEndDt(Date workEndDt) {
	        this.workEndDt = workEndDt;
	    }

	    public String getWorkProgress() {
	        return workProgress;
	    }

	    public void setWorkProgress(String workProgress) {
	        this.workProgress = workProgress;
	    }

	    public String getMemId() {
	        return memId;
	    }

	    public void setMemId(String memId) {
	        this.memId = memId;
	    }

	    public int getTeamSeq() {
	        return teamSeq;
	    }

	    public void setTeamSeq(int teamSeq) {
	        this.teamSeq = teamSeq;
	    }

	    public String getReferenceId() {
	        return referenceId;
	    }

	    public void setReferenceId(String referenceId) {
	        this.referenceId = referenceId;
	    }

	    public Date getRegDate() {
	        return regDate;
	    }

	    public void setRegDate(Date regDate) {
	        this.regDate = regDate;
	    }

}
