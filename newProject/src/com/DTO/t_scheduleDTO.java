package com.DTO;

import java.sql.Date;

public class t_scheduleDTO {
   // �� Ķ���� ���̺� 

       // ���� ���� 
       private Double scheSeq;

       // ���� ���� 
       private String title;

       // ���� ���� 
       private String scheContnet;

       // ���� ������������ 
       private String start;

       // ���� �������� 
       private String end;

       // ��� ���� 
       private Date regDate;

       // ������ 
       private String scheAttendance;

       // �� ���� 
       private Double teamSeq;
       
       private String memId;

       public t_scheduleDTO(String scheTitle, String scheContnet, String scheStartDt, String scheEndDt,
            String scheAttendance, Double teamSeq, String memId) {
         this.title = scheTitle;
         this.scheContnet = scheContnet;
         this.start = scheStartDt;
         this.end = scheEndDt;
         this.scheAttendance = scheAttendance;
         this.teamSeq = teamSeq;
         this.memId = memId;
      }
     


      public t_scheduleDTO(Double scheSeq, String scheTitle, String scheContnet, String scheStartDt, String scheEndDt,
         String scheAttendance, Double teamSeq, String memId) {
      super();
      this.scheSeq = scheSeq;
      this.title = scheTitle;
      this.scheContnet = scheContnet;
      this.start = scheStartDt;
      this.end = scheEndDt;
      this.scheAttendance = scheAttendance;
      this.teamSeq = teamSeq;
      this.memId = memId;
   }

   public Double getScheSeq() {
           return scheSeq;
       }

       public t_scheduleDTO(Double scheSeq, String title, String scheContnet, String start, String end, Date regDate,
         String scheAttendance, Double teamSeq, String memId) {
      super();
      this.scheSeq = scheSeq;
      this.title = title;
      this.scheContnet = scheContnet;
      this.start = start;
      this.end = end;
      this.regDate = regDate;
      this.scheAttendance = scheAttendance;
      this.teamSeq = teamSeq;
      this.memId = memId;
   }








public void setScheSeq(Double scheSeq) {
           this.scheSeq = scheSeq;
       }

       public String getScheTitle() {
           return title;
       }

       public void setScheTitle(String scheTitle) {
           this.title = scheTitle;
       }

       public String getScheContnet() {
           return scheContnet;
       }

       public void setScheContnet(String scheContnet) {
           this.scheContnet = scheContnet;
       }

       public String getScheStartDt() {
           return start;
       }

       public void start(String scheStartDt) {
           this.start = scheStartDt;
       }

       public String getScheEndDt() {
           return end;
       }

       public void setScheEndDt(String scheEndDt) {
           this.end = scheEndDt;
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