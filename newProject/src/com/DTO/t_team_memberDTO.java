package com.DTO;

import java.sql.Date;

public class t_team_memberDTO {
	// 팀 소속 회원 테이블

	// 팀회원 순번
	private Double tmSeq;

	// 팀원 아이디
	private String memId;

	// 팀 순번
	private Double teamSeq;

	// 등록 일자
	private Date regDate;

	// 팀회원 메모
	private String tmMemo;

	private String teamName;
	// 팀회원 사진
	private String adminYN;

	public t_team_memberDTO(Double teamSeq, String teamName) {
		this.teamSeq = teamSeq;
		this.teamName = teamName;
	}

	public t_team_memberDTO(String tmMemo) {
		super();
		this.tmMemo = tmMemo;
	}

	public String getAdminYN() {
		return adminYN;
	}

	public void setAdminYN(String adminYN) {
		this.adminYN = adminYN;
	}

	public t_team_memberDTO(Double tmSeq, String memId, Double teamSeq, Date regDate, String tmMemo, String adminYN) {
		super();
		this.tmSeq = tmSeq;
		this.memId = memId;
		this.teamSeq = teamSeq;
		this.regDate = regDate;
		this.tmMemo = tmMemo;
		this.adminYN = adminYN;
	}

	public t_team_memberDTO(Double tmSeq, String memId, Double teamSeq, Date regDate, String tmMemo) {
		this.tmSeq = tmSeq;
		this.memId = memId;
		this.teamSeq = teamSeq;
		this.regDate = regDate;
		this.tmMemo = tmMemo;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public t_team_memberDTO(String memId, Double teamSeq, Date regDate, String tmMemo, String adminYN) {
		this.memId = memId;
		this.teamSeq = teamSeq;
		this.regDate = regDate;
		this.tmMemo = tmMemo;
		this.adminYN = adminYN;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getTmMemo() {
		return tmMemo;
	}

	public void setTmMemo(String tmMemo) {
		this.tmMemo = tmMemo;
	}

}