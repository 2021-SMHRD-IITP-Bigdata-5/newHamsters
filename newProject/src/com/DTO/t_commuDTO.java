package com.DTO;

import java.sql.Date;

public class t_commuDTO {
	// �� Ŀ�´�Ƽ �Խ��� ���̺� 

	    // �� ���� 
	    private Double articleSeq;

	    // �� ���� 
	    private String articleTitle;

	    // �� ���� 
	    private String articleContent;

	    // �� �ۼ����� 
	    private Date articleDate;

	    // �ؽ� �±� 
	    private String hashTag;

	    // �� ��ȸ�� 
	    private Double articleCnt;

	    // �� ���� 
	    private Double teamSeq;

	    // �ۼ��� ���̵� 
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