<%@page import="com.ReachRich.domain.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    UserDTO user = (UserDTO)session.getAttribute("user");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 레이아웃 틀 */
html {
    height: 100%;
}

body {
    margin: 0;
    height: 100%;
    background: #f5f6f7;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}
#logo {
    width: 240px;
    height: 44px;
    cursor: pointer;
}
#header {
    padding-top: 62px;
    padding-bottom: 20px;
    text-align: center;
}
#wrapper {
    position: relative;
    height: 100%;
}
#content {
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    width: 460px;
}


/* 입력폼 */

input:focus {
    outline: none;
}


h3 {
    margin: 19px 0 8px;
    font-size: 14px;
    font-weight: 700;
}

.box {
    display: block;
    width: 100%;
    height: 45px;
    border: solid 1px #dadada;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #fff;
    position: relative;
    font-size: 20px;
}
.boxs {
    display: block;
    width: 100%;
    height: 60px;
    border: solid 1px #dadada;
    padding: 10px 14px;
    box-sizing: border-box;
    background: #fff;
    position: relative;
}
.int {
    display: block;
    position: relative;
    width: 100%;
    height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
}
input {
    font-family: Dotum,'돋움',Helvetica,sans-serif;    
}

.box.int_id {
    padding-right: 110px;
 
}
.box.int_pass {
    padding-right: 40px;
}
.box.int_pass_check {
    padding-right: 40px;
}
.step_url {
    /*@naver.com*/
    position: absolute;
    top: 16px;
    right: 13px;
    font-size: 15px;
    color: #8e8e8e;
}
#bir_wrap {
    display: table;
    width: 100%;
}
#bir_yy {
    display: table-cell;
    width: 147px;
    
}
#bir_mm {
    display: table-cell;
    width: 147px;
    vertical-align: middle;
}
#bir_dd {
    display: table-cell;
    width: 147px;
}

#bir_mm, #bir_dd {
    padding-left: 10px;
}
select {
    width: 100%;
    height: 29px;
    font-size: 15px;
    background: #fff url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100% 50% no-repeat;
    background-size: 20px 8px;
    -webkit-appearance: none;
    display: inline-block;
    text-align: start;
    border: none;
    cursor: default;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}

/* 버튼 */

.btn_area {
	display : flex;
	justify-content: space-evenly;
    margin: 30px 0 91px;
}
.btnJoin {
  border-radius: 20px;
  border: 1px solid gold;
  background-color: gold;
  color: #FFFFFF;
  font-size: 12px;
  font-weight: bold;
  padding: 12px 45px;
  letter-spacing: 1px;
  text-transform: uppercase;
  transition: transform 80ms ease-in;
}
</style>
    <meta charset="UTF-8">
    <title>프로필</title>
    <link rel="stylesheet" href="new_main.css">
 </head>
<body>
<<<<<<< HEAD
<form name="profile" action="modify" method="get">
=======
<form name="profile" action="reachrich_modify" method="get">
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b
  <!-- header -->
        <div id="header">
            <h1>회원정보</h1>
        </div>
        <!-- wrapper -->
        <div id="wrapper">
            <!-- content-->
            <div id="content">
                <!-- ID -->
                <div>
                    <h3 class="join_title">
                    아이디
                    </h3>
                    <span class="box int_id">
                        <%= user.getUser_id() %>                  
                    </span>
                </div>
                <!-- NAME -->
                <div>
                    <h3 class="join_title">이름</h3>
                    <span class="box int_name">
<<<<<<< HEAD
                        <%= user.getUser_id() %> 
=======
                        <%= user.getUser_name() %> 
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b
                    </span>
                </div>

                <!-- BIRTH -->
                <div>
                    <h3 class="join_title">생년월일</h3>
                    <div id="bir_wrap">
                        <!-- BIRTH_YY -->
                        <div id="bir_yy">
                            <span class="box">
<<<<<<< HEAD
                                <%= user.getUser_id() %> 
=======
                                <%= user.getUser_birth().substring(0,4) %>년 <%= user.getUser_birth().substring(4,6) %>월 <%= user.getUser_birth().substring(6,8) %>일
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b
                            </span>
                        </div>
                    </div>
                </div>
                <!-- GENDER -->
          		<div>
<<<<<<< HEAD
                    <h3 class="join_title">휴대전화</h3>
                    <span class="box int_mobile">
                        <%= user.getUser_id() %> 
=======
                    <h3 class="join_title">성별</h3>
                    <span class="box int_mobile">
                    <%
                    if(user.getUser_gender().equals("M")){
                    %>
                    남성
                    <%
                    }else{
                    %>
                    여성
                    <%
                    }
                    %>
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b
                    </span>  
                </div>    

                <!-- EMAIL -->
                <div>
                    <h3 class="join_title">이메일</h3>
                    <span class="box int_email">
<<<<<<< HEAD
                       <%= user.getUser_id() %> 
=======
                       <%= user.getUser_email() %> 
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b
                    </span> 
                </div>
                <!-- MOBILE -->
                <div>
                    <h3 class="join_title">휴대전화</h3>
                    <span class="box int_mobile">
<<<<<<< HEAD
                        <%= user.getUser_id() %> 
=======
                        <%= user.getUser_phone().substring(0,3) %>-<%= user.getUser_phone().substring(3,7) %>-<%= user.getUser_phone().substring(7,11) %>  
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b
                    </span>  
                </div>
                 <div>
                    <h3 class="join_title">관심종목</h3>
                    <span class="box int_mobile">
<<<<<<< HEAD
                        <%= user.getUser_id() %> 
=======
                        <%= user.getInterest() %> 
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b
                    </span>  
                </div>         
                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="button" class="btnJoin" onclick="javascript:history.back()">
                        <span>뒤로가기</span>
                    </button>
<<<<<<< HEAD
                    <button type="button" class="btnJoin" onclick="modify()">
=======
                    <button type="button" class="btnJoin" onclick="profile.submit()">
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b
                        <span>수정하기</span>
                    </button>
                </div>
            </div> 
            <!-- content-->
        </div>
        </form>
</body>
</html>