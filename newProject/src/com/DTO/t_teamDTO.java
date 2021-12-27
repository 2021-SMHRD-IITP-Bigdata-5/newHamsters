package com.DTO;

import java.util.Date;

public class t_teamDTO {

    // 팀 순번 
    private double teamSeq;

    // 팀 이름 
    private String teamName;

    // 팀 설명 
    private String teamContent;

    // 등록 일자 
    private Date regDate;

    // 등록자 아이디 
    private String memId;

    
    public t_teamDTO(double teamSeq, String teamName, String teamContent, Date regDate) {
		super();
		this.teamSeq = teamSeq;
		this.teamName = teamName;
		this.teamContent = teamContent;
		this.regDate = regDate;
	}

	public t_teamDTO(double teamSeq, String teamName, String teamContent, Date regDate, String memId) {
		super();
		this.teamSeq = teamSeq;
		this.teamName = teamName;
		this.teamContent = teamContent;
		this.regDate = regDate;
		this.memId = memId;
	}

	public double getTeamSeq() {
        return teamSeq;
    }

    public void setTeamSeq(double teamSeq) {
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
