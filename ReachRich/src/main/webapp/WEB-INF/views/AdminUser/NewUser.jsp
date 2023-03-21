<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
	table{border:1px solid black;}
	th,td{border:1px solid black;"}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" name="user" action="NewUser">
		<table>		
			<tr>
				<th>유저아이디</th>
				<td><input type="text" name="user_id"> <input type="button" value="중복확인" id="btn1"> <font id="id_c" color="blue"></font></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="user_pass"></td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td><input type="password" name="repasswd"> <font id="pw_c" color="red"></font></td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td>
					<input type="text" name="user_phone1" size="4" maxlength="3">-
					<input type="text" name="user_phone2" size="4" maxlength="4">-
					<input type="text" name="user_phone3" size="4" maxlength="4">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" name="email1">@<input type="email" name="email2" id="em2">	
					<select name="email3" onchange="change_em()">
						<option value="">직접입력
						<option value="gmail.com">gmail.com
						<option value="naver.com">naver.com
						<option value="daum.net">daum.net
						<option value="nate.com">nate.com
					</select>
					<input type="button" value="이메일 인증" onclick="chk_em()"> <font id="em_c" color="red">인증이 필요합니다</font>
				</td>
			</tr>
			<tr>
				<th>관심종목</th>
				<td>
					<input type="checkbox" name="interest" value="IT">IT
					<input type="checkbox" name="interest" value="경제">경제
					<input type="checkbox" name="interest" value="자동차">자동차<br>
					<input type="checkbox" name="interest" value="항공">항공
					<input type="checkbox" name="interest" value="의학">의학
					<input type="checkbox" name="interest" value="외">그 외
				</td>		
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="button" value="회원등록" onclick="test()">				
					<input type="button" value="다시쓰기" onclick="user.reset()">				
				</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		//아이디 중복 체크
		$('#btn1').click(function() {
			var userid= user.user_id.value;
			$.ajax({
				url:'idCheck', //서블릿(컨트롤러) 이름
				type:'post',
				data:{'userid':userid},
				success:function(result){//성공시
					if(result == 0){
						id_c.value = 1;
						id_c.innerHTML='사용가능한 아이디입니다';
						user.user_pass.focus();
					}else if(result == 1){
						id_c.value = 0;
						id_c.innerHTML='중복된 아이디입니다';
						user.user_id.value = "";
						user.user_id.focus();
					}else{
						id_c.value = 0;
						id_c.innerHTML='아이디를 작성해주세요';
						user.user_id.focus();
					}
				},
				error:function(error){//실패시
					alert("error : " + error);
				}
			});	 
		});
		
		//비번체크
		$("input[name='repasswd']").on("change", function(){
			if(user.user_pass.value == user.repasswd.value){
				pw_c.value = 1;
				pw_c.innerHTML="비밀번호가 일치합니다";
				user.user_phone1.focus();
			}else{
				pw_c.value = 0;
				pw_c.innerHTML="비밀번호를 확인해주세요";
				user.repasswd.value = "";
				user.repasswd.focus();
			}
		});
		//비번체크 후 원본 비번을 변경했을때 진행불가 + 비번입력후 비번체크로 이동
		$("input[name='user_pass']").on("change", function(){
			pw_c.value = 0;
			pw_c.innerHTML="";
			user.repasswd.value = "";
			user.repasswd.focus();
		});
		//전화번호 길이 
		$("input[name='user_phone1']").on("change",function(){
			if(user.user_phone1.value.length < 3){
				alert("핸드폰번호를 다시 확인해주세요");
				user.user_phone1.focus();
			}
		});
		$("input[name='user_phone2']").on("change",function(){
			if(user.user_phone2.value.length < 4){
				alert("핸드폰번호를 다시 확인해주세요");
				user.user_phone2.focus();
			}
		});
		$("input[name='user_phone3']").on("change",function(){
			if(user.user_phone3.value.length < 4){
				alert("핸드폰번호를 다시 확인해주세요");
				user.user_phone3.focus();
			}
		});
	});
</script>
<script>
	function chk_em(){
		if(user.email1.value == ""){
			alert("이메일을 작성해주세요");
			user.email1.focus();
			return;
		}
		if(user.email2.value == ""){
			alert("이메일을 작성해주세요");
			user.email2.focus();
			return;
		}
		var url = "em_check?email1=" + user.email1.value + "&email2=" + user.email2.value;
		window.open(url,"이메일 인증창","width=450 height=300");
	}
	function test(){
		alert("등록시작");
		if(user.user_id.value == ""){
			alert("유저 아이디를 작성해주세요");
			user.user_id.focus();
			return;
		}
		if(user.user_pass.value == ""){
			alert("비밀번호를 작성해주세요");
			user.user_pass.focus();
			return;
		}
		if(user.user_phone1.value == ""){
			alert("전화번호를 작성해주세요");
			user.user_phone1.focus();
			return;
		}
		if(user.user_phone2.value == ""){
			alert("전화번호를 작성해주세요");
			user.user_phone2.focus();
			return;
		}
		if(user.user_phone3.value == ""){
			alert("전화번호를 작성해주세요");
			user.user_phone3.focus();
			return;
		}
		if(user.email1.value == ""){
			alert("이메일을 작성해주세요");
			user.email1.focus();
			return;
		}
		if(user.email2.value == ""){
			alert("이메일을 작성해주세요");
			user.email2.focus();
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
		if(document.getElementById("id_c").value != 1){
			alert("유저아이디 중복확인이 필요합니다");
			user.user_id.focus();
			return;
		}
		if(document.getElementById("pw_c").value != 1){
			alert("비밀번호를 확인해주세요");
			user.repasswd.focus();
			return;
		}
		if(document.getElementById("em_c").value != 1){
			alert("이메일이 인증되지 않았습니다");
			return;
		}
		user.submit();
	}
	function change_em(){
		if(user.email3.value != ""){
			 document.getElementById("em2").readOnly=true;
		}else{
			 document.getElementById("em2").readOnly=false;			
		}
		user.email2.value = user.email3.value;
	}
</script>
</html>