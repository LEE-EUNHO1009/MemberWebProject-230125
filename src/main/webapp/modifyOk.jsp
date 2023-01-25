<%@page import="com.eunocompany.exe.MemberDto"%>
<%@page import="com.eunocompany.exe.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 결과</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String mid = request.getParameter("id");
		String mpw = request.getParameter("pw");
		String mname = request.getParameter("name");
		String memail = request.getParameter("email");
		
		MemberDao dao = new MemberDao();
		
		int resultFlag = dao.modify(mid, mpw, mname, memail);//1이면 수정 성공
		
		if(resultFlag == 1) {
			
			//로그인 한 유저의 아이디를 세션에서 가져오기
			
			MemberDto dto = dao.getMemberInfo(mid);
	%>	
		<h2>수정된 회원 정보</h2>
		<hr>
		아이디 : <%= dto.getId() %><br>
		이름 : <%= dto.getName() %><br>
		비밀번호 : <%= dto.getPassword() %><br>
		이메일 : <%= dto.getEmail() %><br>
		가입일 : <%= dto.getJointime() %>
	<%			
		} else {
	
	%>
		<script type="text/javascript">
			alert('정보수정 실패! 다시 확인해 주세요.');
			history.go(-1);
		</script>
		
	<%
		}
	%>
	<br><br>
	<a href="main.jsp">메인화면으로 가기</a>
</body>
</html>