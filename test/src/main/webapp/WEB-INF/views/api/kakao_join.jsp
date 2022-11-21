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
		<input name="id" type="hidden" value="${ vo.id }"> <br>
		<input name="pwd" type="hidden" value="kakao"> <br>
		<input name="gender" type="hidden" value="${ vo.gender }"> <br>
		<input name="email" type="hidden" value="${ vo.email }"> <br>
		<label>이름 : </label><input name="name" type="text"> <br>
		<label>주소 : </label><input name="address" class="address_kakao" type="text">
		<input class="address_kakao" type="button" value="주소찾기"> <br>
		<label>상세 주소 : </label><input name="address_detail" class="address_kakao" type="text"> <br>
		<label>휴대폰 번호 : </label><input id="phonenumber" name="phonenumber" type="text" placeholder="휴대폰 번호를 입력해주세요" maxlength="13"> <br>
		<label>주민번호 : </label><input id="identity_num" name="identity_num" type="text" placeholder="주민번호 13자리를 입력해주세요" maxlength="14">
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
						document.getElementsByClassName("address_kakao")[2].focus(); //상세입력 포커싱
						}
				}).open();
			});
			document.getElementsByClassName("address_kakao")[1].addEventListener("click", function(){ //주소 버튼을 클릭
				new daum.Postcode({
					oncomplete: function(data) { //선택시 입력값 세팅
						document.getElementsByClassName("address_kakao")[0].value = data.address; // 주소 넣기
						document.getElementsByClassName("address_kakao")[2].focus(); //상세입력 포커싱
						}
				}).open();
			});
		}
		// 휴대폰용 자동 하이픈
		function phone_AutoHyphen(str){
			str = str.replace(/[^0-9]/g, ''); // 입력값에 숫자만 적용
			let tmp = '';
			if ( str.length < 4 ) { // 입력값이 4자리보다 작을시
				return str;
			} else if ( str.length < 7 ) { // 입력값이 7자리보다 작을시
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3);
				return tmp;
			} else if ( str.length < 11 ) { // 입력값이 11자리보다 작을시
				tmp += str.substr(0, 3); // 000
				tmp += '-'; // 000-
				tmp += str.substr(3, 3); // 000-000
				tmp += '-'; // 000-000-
				tmp += str.substr(6); // 000-000-0000
				return tmp;
			} else { // 입력값이 11자리일시
				tmp += str.substr(0, 3); // 000
				tmp += '-'; // 000-
				tmp += str.substr(3, 4); // 000-0000
				tmp += '-'; // 000-0000-
				tmp += str.substr(7); // 000-0000-0000
				return tmp;
			}
			return str;
		}
		// 휴대폰 입력값 가져오기
		const phonenumber = document.getElementById("phonenumber");
		phonenumber.onkeyup = function(event) { // 값을 입력시 발동
			event = event || window.event;
			let val = this.value.trim(); // 입력값 가져오기
			this.value = phone_AutoHyphen(val); // 입력값에 자동 하이픈 메소드 적용
		}
		
		// 주민번호용 자동 하이픈
		function identity_AutoHyphen(str){
			str = str.replace(/[^0-9]/g, ''); // 입력값에 숫자만 적용
			let tmp = '';
			if ( str.length < 7 ) { // 입력값이 7자리보다 작을시
				return str;
			} else { // 입력값이 13자리일시
				tmp += str.substr(0, 6); // 000000
				tmp += '-'; // 000000-
				tmp += str.substr(6); // 000000-0000000
				return tmp;
			}
			return str;
		}
		// 주민번호 입력값 가져오기
		const identity_num = document.getElementById("identity_num");
		identity_num.onkeyup = function(event) { // 값을 입력시 발동
			event = event || window.event;
			let val = this.value.trim(); // 입력값 가져오기
			this.value = identity_AutoHyphen(val); // 입력값에 자동 하이픈 메소드 적용
		}
		
		// DB저장하러 이동
		function join(f) {
			f.action = "welcome.do";
			f.method = "POST";
			f.submit();
		}
	</script>
</body>
</html>