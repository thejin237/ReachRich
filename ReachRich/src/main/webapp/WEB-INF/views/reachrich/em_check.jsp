<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 확인</title>
<script>
	function chk(authNum){
		if(em.pass.value == ""){
			alert("인증번호를 입력해주세요");
			em.pass.focus();
			return;
		}
		if(authNum == em.pass.value){
			alert("인증에 성공했습니다");
			opener.document.getElementById("em_c").value="1";
			opener.document.getElementById("em_c").innerHTML="인증되었습니다";
			self.close();
		}else{
			alert("인증에 실패했습니다");
			opener.document.getElementById("em_c").value="0";
			opener.document.getElementById("em_c").innerHTML="인증에 실패하였습니다";
			self.close();			
		}
	}
</script>
</head>
<body>
	<form method="post" name="em">
		<table>
			<tr>
				<th>인증번호 : </th>
				<td><input type="text" name="pass"> <input type="button" value="인증하기" onclick="chk('${authNum}')"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="button" value="닫기" onclick="self.close()"></th>
			</tr>
		</table>
	</form>
</body>
</html>