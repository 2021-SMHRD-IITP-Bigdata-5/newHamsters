package com.DTO;

import java.sql.Date;

public class t_commuDTO {
	// 팀 커뮤니티 게시판 테이블 

	    // 글 순번 
	    private Double articleSeq;

	    // 글 제목 
	    private String articleTitle;

	    // 글 내용 
	    private String articleContent;

	    // 글 작성일자 
	    private Date articleDate;

	    // 해시 태그 
	    private String hashTag;

	    // 글 조회수 
	    private Double articleCnt;

	    // 팀 순번 
	    private Double teamSeq;

	    // 작성자 아이디 
	    private String memId;


	    public t_commuDTO(String articleTitle, String articleContent,
				String hashTag, Double articleCnt, Double teamSeq, String memId) {
			this.articleTitle = articleTitle;
			this.articleContent = articleContent;
			this.hashTag = hashTag;
			this.articleCnt = articleCnt;
			this.teamSeq = teamSeq;
			this.memId = memId;
		}

	    public t_commuDTO(Double articleSeq, String articleTitle, String articleContent, Date articleDate,
				String hashTag, Double articleCnt, Double teamSeq, String memId) {
			this.articleSeq = articleSeq;
			this.articleTitle = articleTitle;
			this.articleContent = articleContent;
			this.articleDate = articleDate;
			this.hashTag = hashTag;
			this.articleCnt = articleCnt;
			this.teamSeq = teamSeq;
			this.memId = memId;
		}

		public Double getArticleSeq() {
	    	return articleSeq;
	    }
	    
		public void setArticleSeq(Double articleSeq) {
	        this.articleSeq = articleSeq;
	    }

	    public String getArticleTitle() {
	        return articleTitle;
	    }

	    public void setArticleTitle(String articleTitle) {
	        this.articleTitle = articleTitle;
	    }

	    public String getArticleContent() {
	        return articleContent;
	    }

	    public void setArticleContent(String articleContent) {
	        this.articleContent = articleContent;
	    }

	    public Date getArticleDate() {
	        return articleDate;
	    }

	    public void setArticleDate(Date articleDate) {
	        this.articleDate = articleDate;
	    }

	    public String getHashTag() {
	        return hashTag;
	    }

	    public void setHashTag(String hashTag) {
	        this.hashTag = hashTag;
	    }

	    public Double getArticleCnt() {
	        return articleCnt;
	    }

	    public void setArticleCnt(Double articleCnt) {
	        this.articleCnt = articleCnt;
	    }

	    public Double getTeamSeq() {
	        return teamSeq;
	    }

	    public void setTeamSeq(Double teamSeq) {
	        this.teamSeq = teamSeq;
	    }

	    public String getMemId() {
	        return memId;
	    }

	    public void setMemId(String memId) {
	        this.memId = memId;
	    }

	    
}