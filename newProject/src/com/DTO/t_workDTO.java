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
	    private Date workStartDt;

	    // ���� �������� 
	    private Date workEndDt;

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

//	    double workSeq = rs.getDouble(1);
//        String workTitle = rs.getString(2);
//        String workContent = rs.getString(3);
//        Date startDt = rs.getDate(4);
//        Date endDt = rs.getDate(5);
//        String workProgress = rs.getString(10);
//        String memId = rs.getString(6);
//        double teamSeq = rs.getDouble(7);
//        String refmem = rs.getString(9);
//        Date regDate = rs.getDate(8);
	    
	    public t_workDTO(String workTitle, String workContent, Date workStartDt, Date workEndDt,
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

		

		public t_workDTO(double workSeq, String workTitle, String workContent, Date workStartDt, Date workEndDt,
				String workProgress, String memId, double teamSeq, String referenceId, Date regDate) {
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


		public t_workDTO(double workSeq2, String workTitle2, String workContent2, Date startDt, Date endDt,
				String memId2, double teamSeq2, Date workDate, String refmem, String workProgress2) {
			// TODO Auto-generated constructor stub
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
