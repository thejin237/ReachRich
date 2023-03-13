<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	table{border:1px solid black;}
	th,td{border:1px solid black;"}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		//아이디 중복 체크 JSON 배워야한다?
		$('#btn1').click(function() {
			alert("버튼확인");
			var userid= user.user_id.value;
			alert("아이디는 " + userid);//테스트
			$.ajax({
				url:'idCheck', //서블릿 이름
				type:'post',
				data:{'userid':userid},
				success:function(result){//성공시
					alert(result.value);
					if(result == 0){
						id_c.innerHTML='사용가능한 아이디입니다';
						$('#user_pass').focus();
					}else if(result == 1){
						id_c.innerHTML='중복된 아이디입니다';
						$('#user_id').val('');
						$('#user_id').focus();//포커스 이동
					}else{
						id_c.innerHTML='?'; //아이디 admin포함일시 해당아이디 사용불가능
						$('#user_id').val('');
						$('#user_id').focus();						
					}
				},
				error:function(error){//실패시
					alert("error : " + error);
				}
			});	 
		});
		
		//비번체크
		$("input[name='repasswd']").on("change", function(){
			var passwd = $('#passwd').val();
			var repasswd = $('#repasswd').val();
			if(passwd == repasswd){
				repass_c.innerHTML="확인되었습니다.";
				$('#tel').focus();
			}else{
				repass_c.innerHTML="비밀번호를 확인해주세요.";
				$('#repasswd').val('');
				$('#repasswd').focus();
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
		alert("test");
		
		if(document.getElementById("em_c").value != 1){
			alert("이메일이 인증되지 않았습니다");
			return;
		}
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" name="user" action="NewUser">
		<table>
			<tr>
				<th>유저아이디</th>
				<td><input type="text" name="user_id"> <input type="button" value="중복확인" id="btn1"><b id="id_c"></b></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="user_pass"></td>
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
					</select>
					<input type="button" value="이메일 인증" onclick="chk_em()"> <b id="em_c">인증이 필요합니다</b>
				</td>
			</tr>
			<tr>
				<th>관심종목</th>
				<td>
					<input type="checkbox" name="interest" value="IT">IT
					<input type="checkbox" name="interest" value="경제">경제
					<input type="checkbox" name="interest" value="자동차">자동차
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
</html>