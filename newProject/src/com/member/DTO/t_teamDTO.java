package com.member.DTO;

import java.util.Date;

public class t_teamDTO {

    // �� ���� 
    private Double teamSeq;

    // �� �̸� 
    private String teamName;

    // �� ���� 
    private String teamContent;

    // ��� ���� 
    private Date regDate;

    // ����� ���̵� 
    private String memId;

    public t_teamDTO(Double teamSeq, String teamName, String teamContent, Date regDate, String memId) {
		super();
		this.teamSeq = teamSeq;
		this.teamName = teamName;
		this.teamContent = teamContent;
		this.regDate = regDate;
		this.memId = memId;
	}

	public Double getTeamSeq() {
        return teamSeq;
    }

    public void setTeamSeq(Double teamSeq) {
        this.teamSeq = teamSeq;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getTeamContent() {
        return teamContent;
    }

    public void setTeamContent(String teamContent) {
        this.teamContent = teamContent;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getMemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }

    
	
}
