package com.DTO;

import java.sql.Date;

public class t_workDTO {
	// �� ���� ���̺� 

	    // ���� ���� 
	    private double workSeq;

	    // ���� ���� 
	    private String workTitle;

	    // ���� ���� 
	    private String workContent;

	    // ���� �������� 
	    private String workStartDt;

	    // ���� �������� 
	    private String workEndDt;

	    // ���� �����Ȳ 
	    private String workProgress;

	    // �ۼ��� ���̵� 
	    private String memId;

	    // �� ���� 
	    private double teamSeq;

	    // ���� ���̵� 
	    private String referenceId;

	    // ��� ���� 
	    private Date regDate;

	    
	    public t_workDTO(String workTitle, String workContent, String workStartDt, String workEndDt,
				String workProgress, String memId, double teamSeq, String referenceId) {
			this.workTitle = workTitle;
			this.workContent = workContent;
			this.workStartDt = workStartDt;
			this.workEndDt = workEndDt;
			this.workProgress = workProgress;
			this.memId = memId;
			this.teamSeq = teamSeq;
			this.referenceId = referenceId;
		}

		public double getWorkSeq() {
	        return workSeq;
	    }

	    public void setWorkSeq(double workSeq) {
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

	    public String getWorkStartDt() {
	        return workStartDt;
	    }

	    public void setWorkStartDt(String workStartDt) {
	        this.workStartDt = workStartDt;
	    }

	    public String getWorkEndDt() {
	        return workEndDt;
	    }

	    public void setWorkEndDt(String workEndDt) {
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

	    public double getTeamSeq() {
	        return teamSeq;
	    }

	    public void setTeamSeq(double teamSeq) {
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
