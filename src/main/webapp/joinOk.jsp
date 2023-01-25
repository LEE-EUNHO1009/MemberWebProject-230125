<%@page import="com.eunocompany.exe.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 체크</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");//한글 처리
		
		String mid = request.getParameter("id");
		String mpw = request.getParameter("pw");
		String mname = request.getParameter("name");
		String memail = request.getParameter("email");
		
		int resultInt = 0;
		
		MemberDao dao = new MemberDao();
		
		int checkId = dao.checkId(mid);//1이면 가입하려는 아이디가 이미 존재
		
		
		if(checkId == 0) {
			resultInt = dao.joinMember(mid, mpw, mname, memail);//1이면 삽입 성공
		} else {
	%>
		<script type="text/javascript">
			alert('이미 가입된 아이디 입니다! 다시 확인해 주세요.');
			history.go(-1);
		</script>		
	<%			
			
		}
		
		if (resultInt == 1) {
	%>
		<script type="text/javascript">
			alert('회원 가입을 축하합니다!');
			document.location.href="login.jsp";
		</script>
	<%		
		} else {	
	%>
		<script type="text/javascript">
			alert('회원 가입이 실패! 다시 확인해주세요.');
			document.location.href="join.jsp";
		</script>
	
	<%
		}
	%>
</body>
</html>