<%@page import="com.eunocompany.exe.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<%
		String sessionId = (String) session.getAttribute("memberId");
		//현재 로그인한 유저의 아이디를 세션에서 불러와서 저장
		
		MemberDao dao = new MemberDao();
		int resultFlag = dao.delete(sessionId);
		//1이 반환되면 삭제 성공
		
		if(resultFlag == 1) {
			session.invalidate();//세션 삭제->로그아웃
	%>
		<script type="text/javascript">
			alert('회원탈퇴 성공! 안녕히 가십시오.');
			document.location.href="login.jsp";
		</script>
	<%		
		} else {
	%>
		<script type="text/javascript">
			alert('회원탈퇴 실패! 다시 확인 후 시도해주세요.');
			history.go(-1);//이전 페이지로 이동(입력했던 데이터가 그대로 살아있음) 
		</script>
	
	<%
		}
	%>
	
	
</body>
</html>