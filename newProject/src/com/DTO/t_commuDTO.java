package com.DTO;

import java.sql.Date;

public class t_commuDTO {
	// �� Ŀ�´�Ƽ �Խ��� ���̺� 

	    // �� ���� 
	    private int articleSeq;

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

	    // ÷������1 
	    private String articleFile1;

	    // ÷������2 
	    private String articleFile2;

	    // �� ���� 
	    private int teamSeq;

	    public t_commuDTO(int articleSeq, String articleTitle, String articleContent, Date articleDate, String hashTag,
				Double articleCnt, String articleFile1, String articleFile2, int teamSeq, String articleFile3,
				String memId) {
			this.articleSeq = articleSeq;
			this.articleTitle = articleTitle;
			this.articleContent = articleContent;
			this.articleDate = articleDate;
			this.hashTag = hashTag;
			this.articleCnt = articleCnt;
			this.articleFile1 = articleFile1;
			this.articleFile2 = articleFile2;
			this.teamSeq = teamSeq;
			this.articleFile3 = articleFile3;
			this.memId = memId;
		}

		// ÷������3 
	    private String articleFile3;

	    // �ۼ��� ���̵� 
	    private String memId;

	    public int getArticleSeq() {
	        return articleSeq;
	    }

	    public void setArticleSeq(int articleSeq) {
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

	    public String getArticleFile1() {
	        return articleFile1;
	    }

	    public void setArticleFile1(String articleFile1) {
	        this.articleFile1 = articleFile1;
	    }

	    public String getArticleFile2() {
	        return articleFile2;
	    }

	    public void setArticleFile2(String articleFile2) {
	        this.articleFile2 = articleFile2;
	    }

	    public int getTeamSeq() {
	        return teamSeq;
	    }

	    public void setTeamSeq(int teamSeq) {
	        this.teamSeq = teamSeq;
	    }

	    public String getArticleFile3() {
	        return articleFile3;
	    }

	    public void setArticleFile3(String articleFile3) {
	        this.articleFile3 = articleFile3;
	    }

	    public String getMemId() {
	        return memId;
	    }

	    public void setMemId(String memId) {
	        this.memId = memId;
	    }

}
