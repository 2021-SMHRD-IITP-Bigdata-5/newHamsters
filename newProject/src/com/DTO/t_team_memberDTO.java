package com.DTO;

public class t_team_memberDTO {
	// �� �Ҽ� ȸ�� ���̺� 
	

	    // ��ȸ�� ���� 
	    private Double tmSeq;

	    // ���� ���̵� 
	    private String memId;

	    // �� ���� 
	    private Double teamSeq;

	    // ��� ���� 
	    private String regDate;

	    // ��ȸ�� �޸� 
	    private String tmMemo;

	    // ��ȸ�� ���� 
	    private String tmPicture;

	    
	    public t_team_memberDTO(Double tmSeq, String memId, Double teamSeq, String regDate, String tmMemo,
				String tmPicture) {
			super();
			this.tmSeq = tmSeq;
			this.memId = memId;
			this.teamSeq = teamSeq;
			this.regDate = regDate;
			this.tmMemo = tmMemo;
			this.tmPicture = tmPicture;
		}

		public Double getTmSeq() {
	        return tmSeq;
	    }

	    public void setTmSeq(Double tmSeq) {
	        this.tmSeq = tmSeq;
	    }

	    public String getMemId() {
	        return memId;
	    }

	    public void setMemId(String memId) {
	        this.memId = memId;
	    }

	    public Double getTeamSeq() {
	        return teamSeq;
	    }

	    public void setTeamSeq(Double teamSeq) {
	        this.teamSeq = teamSeq;
	    }

	    public String getRegDate() {
	        return regDate;
	    }

	    public void setRegDate(String regDate) {
	        this.regDate = regDate;
	    }

	    public String getTmMemo() {
	        return tmMemo;
	    }

	    public void setTmMemo(String tmMemo) {
	        this.tmMemo = tmMemo;
	    }

	    public String getTmPicture() {
	        return tmPicture;
	    }

	    public void setTmPicture(String tmPicture) {
	        this.tmPicture = tmPicture;
	    }

	   
	
}
