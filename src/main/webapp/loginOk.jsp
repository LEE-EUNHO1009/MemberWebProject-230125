<%@page import="com.eunocompany.exe.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인 체크</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String mid = request.getParameter("id");
		String mpw = request.getParameter("pw");
		
		MemberDao dao = new MemberDao();
		
		int loginResult = dao.loginCheck(mid, mpw);//1이면 로그인 성공, 0이면 로그인 실패
		
		if(loginResult == 1) { //로그인 성공
			session.setAttribute("memberId", mid);//로그인 성공->세션에 아이디 저장
			session.setAttribute("ValidSession", "yes");
	%>
		<script type="text/javascript">
			alert('로그인 성공!메인페이지로 이동합니다.');
			document.location.href="main.jsp";
		</script>
	<%		
			
			
		} else { //로그인 실패
	%>
		<script type="text/javascript">
			alert('로그인 실패! 아이디와 비밀번호를 다시 확인해 주세요.');
			history.go(-1);
		</script>
	<%		
		}
	
	%>
</body>
</html>