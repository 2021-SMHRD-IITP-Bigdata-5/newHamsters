package com.DTO;

import java.sql.Date;

public class t_scheduleDTO {
   // �� Ķ���� ���̺� 

       // ���� ���� 
       private Double scheSeq;

       // ���� ���� 
       private String scheTitle;

       // ���� ���� 
       private String scheContnet;

       // ���� ������������ 
       private Date scheStartDt;

       // ���� �������� 
       private Date scheEndDt;

       // ��� ���� 
       private Date regDate;

       // ������ 
       private String scheAttendance;

       // �� ���� 
       private Double teamSeq;
       
       private String memId;

       public t_scheduleDTO(Double scheSeq, String scheTitle, String scheContnet, Date scheStd, Date scheEndd,
			Date regDate, String scheAttendance, Double teamSeq, String memId) {
		super();
		this.scheSeq = scheSeq;
		this.scheTitle = scheTitle;
		this.scheContnet = scheContnet;
		this.scheStartDt = scheStd;
		this.scheEndDt = scheEndd;
		this.regDate = regDate;
		this.scheAttendance = scheAttendance;
		this.teamSeq = teamSeq;
		this.memId = memId;
	}

	public t_scheduleDTO(String scheTitle, String scheContnet, Date scheStartDt, Date scheEndDt,
            String scheAttendance, Double teamSeq, String memId) {
         this.scheTitle = scheTitle;
         this.scheContnet = scheContnet;
         this.scheStartDt = scheStartDt;
         this.scheEndDt = scheEndDt;
         this.scheAttendance = scheAttendance;
         this.teamSeq = teamSeq;
         this.memId = memId;
      }

      public Double getScheSeq() {
           return scheSeq;
       }

       public void setScheSeq(Double scheSeq) {
           this.scheSeq = scheSeq;
       }

       public String getScheTitle() {
           return scheTitle;
       }

       public void setScheTitle(String scheTitle) {
           this.scheTitle = scheTitle;
       }

       public String getScheContnet() {
           return scheContnet;
       }

       public void setScheContnet(String scheContnet) {
           this.scheContnet = scheContnet;
       }

       public Date getScheStartDt() {
           return scheStartDt;
       }

       public void setScheStartDt(Date scheStartDt) {
           this.scheStartDt = scheStartDt;
       }

       public Date getScheEndDt() {
           return scheEndDt;
       }

       public void setScheEndDt(Date scheEndDt) {
           this.scheEndDt = scheEndDt;
       }

       public Date getRegDate() {
           return regDate;
       }

       public void setRegDate(Date regDate) {
           this.regDate = regDate;
       }

       public String getScheAttendance() {
           return scheAttendance;
       }

       public void setScheAttendance(String scheAttendance) {
           this.scheAttendance = scheAttendance;
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

       // TSchedule �� ����
       

}