package com.DTO;

import java.sql.Date;

public class t_scheduleDTO {
   // 팀 캘린더 테이블 

       // 일정 순번 
       private Double scheSeq;

       // 일정 제목 
       private String scheTitle;

       // 일정 내용 
       private String scheContnet;

       // 일정 시작일자일정 
       private String scheStartDt;

       // 일정 마감일자 
       private String scheEndDt;

       // 등록 일자 
       private Date regDate;

       // 참석자 
       private String scheAttendance;

       // 팀 순번 
       private Double teamSeq;
       
       private String memId;

       public t_scheduleDTO(String scheTitle, String scheContnet, String scheStartDt, String scheEndDt,
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

       public String getScheStartDt() {
           return scheStartDt;
       }

       public void setScheStartDt(String scheStartDt) {
           this.scheStartDt = scheStartDt;
       }

       public String getScheEndDt() {
           return scheEndDt;
       }

       public void setScheEndDt(String scheEndDt) {
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

       // TSchedule 모델 복사
       

}