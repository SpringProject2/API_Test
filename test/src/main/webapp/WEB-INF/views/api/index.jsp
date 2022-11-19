<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#btn_login {
		font-size: 40px;
	}
</style>
</head>
<body>
	<label>ID : </label><input name="id" type="text"> <br>
	<label>PWD : </label><input name="pwd" type="password"> <br>
	<input id="btn_login" type="button" value="로그인">
	<div id="naverIdLogin"></div>
	
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<script type="text/javascript">
		// 네이버 로그인 정보
		const naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "eSWj7IYuFA0SbZBBHqva",
					callbackUrl: "http://localhost:8080/test/login_naver_callback.do",
					loginButton: {color: "green", type: 3, height: 40},
					isPopup: false,
					callbackHandle: true
				}
		);
		// 로그인 정보동의 시작
		naverLogin.init();
	</script>
</body>
</html>