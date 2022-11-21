<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>${ vo.name }님 가입을 환영합니다.</h2>
	<input type="button" value="네이버 로그아웃" onclick="naverLogout();">
	<input type="button" value="카카오 로그아웃" onclick="kakaoLogout();">
	
	<!-- 네이버 로그인 API -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<!-- 네이버 로그아웃 -->
	<script>
		let logoutPopUp; // 팝업창 만들기
		function openPopUp() { // 팝업 열기 메소드
			// 팝업에 로그아웃 실행 기능 추가 - 네이버 로그아웃이 가능한 주소를 가져다 사용
			logoutPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
		}
		function closePopUp(){ // 팝업 닫기 메소드
			logoutPopUp.close(); // 열린 팝업창을 다시 닫는 기능
		}
		function naverLogout() {
			openPopUp(); // 팝업 열기
			setTimeout(function() {
				closePopUp(); // 팝업 닫기
				location.href = "logout.do"; // 첫 페이지로 이동
				}, 500); // 팝업 여는거부터 순차적으로 0.5초 간격으로 실행
		}
	</script>
	<!-- 카카오 로그인 API -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<!-- 카카오 로그아웃 -->
	<script>
		// 카카오 로그인 API 검증
		window.Kakao.init("299930f187d00dde5908962ec35a19c9");
		//카카오로그아웃
		function kakaoLogout() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url: '/v1/user/unlink',
					success: function (response) {
						location.href = "logout.do";
					},
					fail: function (error) {
						console.log(error)
					},
				});
				Kakao.Auth.setAccessToken(undefined)
			}
		}
	</script>
</body>
</html>