<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #fff;
    position: relative;
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
.pswdImg {
    width: 18px;
    height: 20px;
    display: inline-block;
    position: absolute;
    top: 50%;
    right: 16px;
    margin-top: -10px;
    cursor: pointer;
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

/* 에러메세지 */

.error_next_box {
    margin-top: 9px;
    font-size: 12px;
    color: red;    
    display: none;
}

#alertTxt {
    position: absolute;
    top: 19px;
    right: 38px;
    font-size: 12px;
    color: red;
    display: none;
}

/* 버튼 */

.btn_area {
    margin: 30px 0 91px;
}
.btnJoin {
    width: 100%;
    padding: 21px 0 17px;
    border: 0;
    cursor: pointer;
    color: #fff;
    background-color: #08a600;
    font-size: 20px;
    font-weight: 400;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}
</style>
    <meta charset="UTF-8">
    <title>네이버 : 회원가입</title>
    <link rel="stylesheet" href="new_main.css">
 </head>
<body>
<form method="post" name="user" action="NewUser">
  <!-- header -->
        <div id="header">
            <h1>ReachRich</h1>
        </div>
        <!-- wrapper -->
        <div id="wrapper">
            <!-- content-->
            <div id="content">
                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20" name="id">
                        <span class="step_url"></span>
                    </span>
                    <span class="error_next_box"></span>
                </div>
                <div>
                <h3></h3>
				<input type="button" value="중복검사" onclick="IDcheck()"> <font id="id_c" color="red">인증이 필요합니다</font>
				</div>
                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pswd1" class="int" maxlength="20" name="pswd1">
                        <span id="alertTxt">사용불가</span>
                        <img src="/img/m_icon_pass.png" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="text" id="pswd2" class="int" maxlength="20">
                        <img src="/img/m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int" maxlength="20" name="name">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- BIRTH -->
                <div>
                    <h3 class="join_title"><label for="yy">생년월일</label></h3>

                    <div id="bir_wrap">
                        <!-- BIRTH_YY -->
                        <div id="bir_yy">
                            <span class="box">
                                <input type="text" id="yy" class="int" maxlength="4" placeholder="년(4자)" name="yy">
                            </span>
                        </div>

                        <!-- BIRTH_MM -->
                        <div id="bir_mm">
                            <span class="box">
                                <select id="mm" class="sel" name="mm">
                                    <option>월</option>
                                    <option value="01">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                    <option value="07">7</option>
                                    <option value="08">8</option>
                                    <option value="09">9</option>                                    
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                            </span>
                        </div>

                        <!-- BIRTH_DD -->
                        <div id="bir_dd">
                            <span class="box">
                                <input type="text" id="dd" class="int" maxlength="2" placeholder="일" name="dd">
                            </span>
                        </div>

                    </div>
                    <span class="error_next_box"></span>    
                </div>

                <!-- GENDER -->
                <div>
                    <h3 class="join_title"><label for="gender">성별</label></h3>
                    <span class="box gender_code">
                        <select id="gender" class="sel" name="gender">
                            <option>성별</option>
                            <option value="M">남자</option>
                            <option value="F">여자</option>
                        </select>                            
                    </span>
                    <span class="error_next_box">필수 정보입니다.</span>
                </div>

                <!-- EMAIL -->
                <div>
                
                    <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional"></span></label></h3>
                    <span class="box int_email">
                        <input type="email" id="email" name=email class="int" maxlength="100" placeholder="선택입력">
                    </span>
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>
  				<div>
  				<h3></h3>
                  <input type="button" value="이메일 인증" onclick="chk_em()"> <font id="em_c" color="red">인증이 필요합니다</font>
                </div>
                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력" name="mobile">
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                
                <div>
                    <h3 class="join_title">관심종목</h3>
					<span class="boxs">
                        <input type="checkbox" name="interest" value="IT">IT
						<input type="checkbox" name="interest" value="경제">경제
						<input type="checkbox" name="interest" value="자동차">자동차<br>
						<input type="checkbox" name="interest" value="항공">항공
						<input type="checkbox" name="interest" value="의학">의학
						<input type="checkbox" name="interest" value="외">그 외
					</span>
                </div>


                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="button" class="btnJoin" onclick="insert()">
                        <span>가입하기</span>
                    </button>
                </div>

                

            </div> 
            <!-- content-->

        </div>
        </form> 
        <!-- wrapper -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
    function IDcheck(){
		alert("검사시작");
		var id= user.id.value;
		$.ajax({
			url:'/ReachRich/idCheck', //서블릿(컨트롤러) 이름
			type:'post',
			data:{'id':id},
			success:function(result){//성공시
				if(result == 0){
					id_c.value = 1;
					id_c.innerHTML='사용가능한 아이디입니다';
					user.pwsd1.focus();
				}else if(result == 1){
					id_c.value = 0;
					id_c.innerHTML='중복된 아이디입니다';
					user.id.value = "";
					user.id.focus();
				}else{
					id_c.value = 0;
					id_c.innerHTML='아이디를 작성해주세요';
					user.user_id.focus();
				}
			},
			error:function(error){//실패시
				alert("error : " + error);
			}
		})
	};
	function insert(){
		alert("등록시작");
		if(user.id.value == ""){
			alert("유저 아이디를 작성해주세요");
			user.id.focus();
			return;
		}
		if(user.pswd1.value == ""){
			alert("비밀번호를 작성해주세요");
			user.pswd1.focus();
			return;
		}
		if(user.mobile.value == ""){
			alert("전화번호를 작성해주세요");
			user.mobile.focus();
			return;
		}
		if(user.email.value == ""){
			alert("이메일을 작성해주세요");
			user.email.focus();
			return;
		}
		for(var x=0,i=0; i < user.interest.length; i++){
			if(user.interest[i].checked){
				x++;
			}
		}
		if(x < 1){
			alert("관심종목 최소 1개이상 선택해주세요");
			return;
		}
		/*if(document.getElementById("id_c").value != 1){
			alert("유저아이디 중복확인이 필요합니다");
			user.user_id.focus();
			return;
		}*/
		if(document.getElementById("em_c").value != 1){
			alert("이메일이 인증되지 않았습니다");
			return;
		}
		user.submit();
	}
    </script>
    <script>

    /*변수 선언*/

    var id = document.querySelector('#id');

    var pw1 = document.querySelector('#pswd1');
    var pwMsg = document.querySelector('#alertTxt');
    var pwImg1 = document.querySelector('#pswd1_img1');

    var pw2 = document.querySelector('#pswd2');
    var pwImg2 = document.querySelector('#pswd2_img1');
    var pwMsgArea = document.querySelector('.int_pass');

    var userName = document.querySelector('#name');

    var yy = document.querySelector('#yy');
    var mm = document.querySelector('#mm');
    var dd = document.querySelector('#dd');

    var gender = document.querySelector('#gender');

    var email = document.querySelector('#email');

    var mobile = document.querySelector('#mobile');

    var error = document.querySelectorAll('.error_next_box');



    /*이벤트 핸들러 연결*/

    id.addEventListener("focusout", checkId);
    pw1.addEventListener("focusout", checkPw);
    pw2.addEventListener("focusout", comparePw);
    userName.addEventListener("focusout", checkName);
    yy.addEventListener("focusout", isBirthCompleted);
    mm.addEventListener("focusout", isBirthCompleted);
    dd.addEventListener("focusout", isBirthCompleted);
    gender.addEventListener("focusout", function() {
        if(gender.value === "성별") {
            error[5].style.display = "block";
        } else {
            error[5].style.display = "none";
        }
    })
    email.addEventListener("focusout", isEmailCorrect);
    mobile.addEventListener("focusout", checkPhoneNum);





    /*콜백 함수*/

    function checkId() {
        var idPattern = /[a-zA-Z0-9_-]{5,20}/;
        if(id.value === "") {
            error[0].innerHTML = "필수 정보입니다.";
            error[0].style.display = "block";
        } else if(!idPattern.test(id.value)) {
            error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
            error[0].style.display = "block";
        } else {
            error[0].innerHTML = "멋진 아이디네요!";
            error[0].style.color = "#08A600";
            error[0].style.display = "block";
        }
    }

    function checkPw() {
        var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
        if(pw1.value === "") {
            error[1].innerHTML = "필수 정보입니다.";
            error[1].style.display = "block";
        } else if(!pwPattern.test(pw1.value)) {
            error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
            pwMsg.innerHTML = "사용불가";
            pwMsgArea.style.paddingRight = "93px";
            error[1].style.display = "block";
            
            pwMsg.style.display = "block";
            pwImg1.src = "/img/m_icon_not_use.png";
        } else {
            error[1].style.display = "none";
            pwMsg.innerHTML = "안전";
            pwMsg.style.display = "block";
            pwMsg.style.color = "#03c75a";
            pwImg1.src = "/img/m_icon_safe.png";
        }
    }

    function comparePw() {
        if(pw2.value === pw1.value && pw2.value != "") {
            pwImg2.src = "/img/m_icon_check_enable.png";
            error[2].style.display = "none";
        } else if(pw2.value !== pw1.value) {
            pwImg2.src = "/img/m_icon_check_disable.png";
            error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
            error[2].style.display = "block";
        } 

        if(pw2.value === "") {
            error[2].innerHTML = "필수 정보입니다.";
            error[2].style.display = "block";
        }
    }

    function checkName() {
        var namePattern = /[a-zA-Z가-힣]/;
        if(userName.value === "") {
            error[3].innerHTML = "필수 정보입니다.";
            error[3].style.display = "block";
        } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
            error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
            error[3].style.display = "block";
        } else {
            error[3].style.display = "none";
        }
    }


    function isBirthCompleted() {
        var yearPattern = /[0-9]{4}/;

        if(!yearPattern.test(yy.value)) {
            error[4].innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
            error[4].style.display = "block";
        } else {
            isMonthSelected();
        }

        function isMonthSelected() {
            if(mm.value === "월") {
                error[4].innerHTML = "태어난 월을 선택하세요.";
            } else {
                isDateCompleted();
            }
        }

        function isDateCompleted() {
            if(dd.value === "") {
                error[4].innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
            } else {
                isBirthRight();
            }
        }
    }

    function isBirthRight() {
        var datePattern = /\d{1,2}/;
        if(!datePattern.test(dd.value) || Number(dd.value)<1 || Number(dd.value)>31) {
            error[4].innerHTML = "생년월일을 다시 확인해주세요.";
        } else {
            checkAge();
        }
    }

    function checkAge() {
        if(Number(yy.value) < 1920) {
            error[4].innerHTML = "정말이세요?";
            error[4].style.display = "block";
        } else if(Number(yy.value) > 2020) {
            error[4].innerHTML = "미래에서 오셨군요. ^^";
            error[4].style.display = "block";
        } else if(Number(yy.value) > 2005) {
            error[4].innerHTML = "만 14세 미만의 어린이는 보호자 동의가 필요합니다.";
            error[4].style.display = "block";
        } else {
            error[4].style.display = "none";
        }
    }

    function isEmailCorrect() {
        var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;

        if(email.value === ""){ 
        	error[6].innerHTML = "필수 정보입니다.";
            error[6].style.display = "block"; 
        } else if(!emailPattern.test(email.value)) {
            error[6].style.display = "block";
        } else {
            error[6].style.display = "none"; 
        }

    }

    function checkPhoneNum() {
        var isPhoneNum = /([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})/;

        if(mobile.value === "") {
            error[7].innerHTML = "필수 정보입니다.";
            error[7].style.display = "block";
        } else if(!isPhoneNum.test(mobile.value)) {
            error[7].innerHTML = "형식에 맞지 않는 번호입니다.";
            error[7].style.display = "block";
        } else {
            error[7].style.display = "none";
        }
    }
    
    function chk_em(){
		var url = "em_check?email=" + user.email.value;
		window.open(url,"이메일 인증창","width=450 height=300");
    }
    
    /*
    2월 : 윤년에는 29일까지, 평년에는 28일까지.
    1,3,5,7, 8,10,12 -> 31일
    2,4,6, 9,11 -> 30일

        var days31 = [1, 3, 5, 7, 8, 10, 12];
        var days30 = [4, 6, 9, 11];

        if(mm.value )

    var sel = document.getElementById("sel");
    var val = sel.options[sel.selectedIndex].value;

    var id = document.querySelector('#id');
    var pw1 = document.querySelector('#pswd1');
    var pw2 = document.querySelector('#pswd2');
    var yourName = document.querySelector('#name');
    var yy = document.querySelector('#yy');
    var mm = document.querySelector('#mm');
    var dd = document.querySelector('#dd');
    var email = document.querySelector('#email');
    var mobile = document.querySelector('#mobile');
    var error = document.querySelectorAll('.error_next_box');

    var pattern_num = /[0-9]/;
    var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/;


    id.onchange = checkId;
    pw1.onchange = checkPw;
    pw2.onchange = comparePw;
    yourName.onchange = checkName;
    yy.onchange = checkYear;


    function checkId() {
        if(id.value === "") {
            error[0].style.display = "block";
        } else if(id.value.length < 5 || id.value.length > 20){
            error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
            error[0].style.display = "block";
        }
    }

    function checkPw() {
        if(pw1.value === "") {
            error[1].style.display = "block";
        } else if (pw1.value.length < 8 || pw1.value.length > 16) {
            error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
            error[1].style.display = "block";
        }
    }

    function comparePw() {
        if(pw2.value === "") {
            error[2].style.display = "block";
        } else if (pw2.value !== pw1.value) {
            error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
            error[2].style.display = "block";
        }
    }

    function checkName() {
        if( yourName.value.indexOf(" ") >= 0 || pattern_spc.test(yourName.value) || pattern_num.test(yourName.value) ) {
            error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
            error[3].style.display = "block";
        } else if(yourName.value.length === 0) {
            error[3].style.display = "block";
        } else {
            error[3].style.display = "none";
        }
    }

    function checkYear() {
        isBirthEntered();
        if(yy.value.length !== 4 || !pattern_num.test(yy.value)) {
            error[4].innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
        } else if (parseInt(yy.value) < 1920) {
            error[4].innerHTML = "정말이세요?";
            error[4].style.display = "block";
        }

    }

    function isBirthEntered() {
        
    }

    function checkEmail() {
        
    }

    function checkNumber() {
        
    }
    */
    
    </script>
   
</body>
</html>