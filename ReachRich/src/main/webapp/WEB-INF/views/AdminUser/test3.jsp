<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.cost-area {display:flex;justify-content:space-between;width:100%;height:80px;margin:0 0 10px;padding:0 20px;border:2px solid #5345b7;}
.cost-area .currency-sign {width:20%;font-size:20px;line-height:75px;color:#333;}
.cost-area .cost {min-width:0;margin:0 0 0 15px;padding:0 10px;border:none;font-weight:bold;font-size:30px;line-height:75px;color:#f71ead;text-align:right;}
.btn-payment:disabled {background:#aaa6c7;color:rgba(255,255,255,0.5);}
.btn-payment {display:inline-block;width:100%;height:55px;font-size:20px;line-height:55px;color:#fff;background-color:#5345b7;}
</style>
<title>Insert title here</title>
</head>
<body>
	<input id="testOnchange" type="text" value="안녕하세요."> <font id="te_c" color="blue">폰트부분입니다.</font>
	 
	<div class="cost-area">
		<span class="currency-sign">KRW</span>
		<input type="number" name="" id="" value="" class="cost payment-btn-active">
	</div>
	<button class="btn btn-payment" disabled>결제</button>
</body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
      var newValue;
      
      // 모든 텍스트의 변경에 반응합니다.
      $("#testOnchange").on("propertychange change keyup paste input", function() {
        // 현재 변경된 데이터 셋팅
        newValue = $(this).val();
        
        // 현재 실시간 데이터 표츌
        te_c.innerHTML = newValue;
        
		var pw = $("#testOnchange").val();
	    var num = pw.search(/[0-9]/g);
    	var eng = pw.search(/[a-z]/ig);
      	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

        if(pw.length < 8){
    	    btnPayment.attr('disabled',true)
        	te_c.innerHTML = "8자리 ~ 20자리 이내로 입력해주세요.";
         	return false;
        }else if(pw.search(/\s/) != -1){
    	    btnPayment.attr('disabled',true)
        	te_c.innerHTML = "비밀번호는 공백 없이 입력해주세요.";
         	return false;
        }else if(num < 0 || eng < 0 || spe < 0 ){
    	    btnPayment.attr('disabled',true)
        	alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
        	testOnchange.value = "";
         	return false;
        }else if(pw.length > 20){
	        btnPayment.attr('disabled',true);
        	te_c.innerHTML = "비밀번호는 최대 20자리입니다. 다시입력해주세요.";
        	testOnchange.value = "";
			return false;
      	}else{ //비밀번호 사용가능시 버튼 활성화
       		te_c.innerHTML = "사용 가능합니다.";   		
	        btnPayment.attr('disabled',false);
        	return true;
        }
      });      
      
      
      //값 없을때 버튼 비활성화 > 값 존재시 활성화
      var oldVal="";
      var btnPayment=$('.btn-payment');
      $(".payment-btn-active").on("change keyup paste", function() {
        var currentVal = $(this).val();
        if(currentVal == oldVal) {
          btnPayment.attr('disabled',true)
        } else {
          btnPayment.attr('disabled',false)
        }
      });
</script>
</html>