<%@page import="java.util.ArrayList"%>
<%@page import="com.DTO.t_teamDTO"%>
<%@page import="com.DTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>업무추가</title>
    <style>
        #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;

            background: radial-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)); 
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgb(255, 255, 255);
        }

        #modal .modal-window {

            background: rgb(246, 243, 246);
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba(36, 3, 3, 0.418);

            width: 400px;
            height: 300px;
            position: relative;
            top: -50px;
            padding: 10px;
        }

        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: black;
            
        }

        #modal .title h2 {
            display: inline;
        }

        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: rgb(244, 237, 245);
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }

        div#button{
            align-items: center;
            font-size: 15px;
            cursor : pointer;
            display: flex;
            flex-direction: column;
        }
    </style>
</head>

<body>
    <div id="container"></div>
        <div id="lorem-ipsum"></div>
    </div>

    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>업무추가</h2>
            </div>
              <span onclick="this.parentElement.style.display='none'" class="close" style= "float: right;"> X </span> 
            
            <div class="content">
                <input type = "text" style="border: none; background: transparent; width:370px;height:30px;" placeholder="제목을 입력하세요">
                <button type ="submit">요청</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type ="submit">진행</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type ="submit">피드백</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type ="submit">완료</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type ="submit">보류</button>
                <br>
                <input type = "text" style ="width:370px;height:145px;" placeholder="내용을 입력하세요.">
                <br>
                <br>
                <div id="button">
                    <button type="submit">올리기</button>
                </div>

                
                
            </div>
        </div>
    </div>

    
</body>
</html>