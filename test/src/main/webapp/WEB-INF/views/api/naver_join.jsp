<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<input name="name" type="hidden" value="${ vo.name }"> <br>
		<input name="id" type="hidden" value="${ vo.id }"> <br>
		<input name="pwd" type="hidden" value="${ vo.pwd }"> <br>
		<input name="gender" type="hidden" value="${ vo.gender }"> <br>
		<input name="email" type="hidden" value="${ vo.email }"> <br>
		<label>주소 : </label><input name="address" class="address_kakao" type="text">
		<input class="address_kakao" type="button" value="주소찾기"> <br>
		<label>상세 주소 : </label><input name="address_detail" class="address_kakao" type="text"> <br>
		<label>휴대폰 번호 : </label><input name="phonenumber" type="text"> <br>
		<label>주민번호 : </label><input name="identity_num" type="text">
		<input type="button" value="가입" onclick="join(this.form)">
	</form>
	
	<!-- 다음 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = function(){
			document.getElementsByClassName("address_kakao")[0].addEventListener("click", function(){ //주소 입력칸을 클릭하면
				new daum.Postcode({
					oncomplete: function(data) { //선택시 입력값 세팅
						document.getElementsByClassName("address_kakao")[0].value = data.address; // 주소 넣기
						document.getElementsByClassName("address_kakao")[1].focus(); //상세입력 포커싱
						}
				}).open();
			});
			document.getElementsByClassName("address_kakao")[2].addEventListener("click", function(){ //주소 버튼을 클릭
				new daum.Postcode({
					oncomplete: function(data) { //선택시 입력값 세팅
						document.getElementsByClassName("address_kakao")[0].value = data.address; // 주소 넣기
						document.getElementsByClassName("address_kakao")[1].focus(); //상세입력 포커싱
						}
				}).open();
			});
		}
		function join(f) {
			f.action = "welcome.do";
			f.method = "POST";
			f.submit();
		}
	</script>
</body>
</html>