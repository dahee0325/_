<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	
	//empno 를 숫자타입을 변경
	int eno = Integer.parseInt(empno);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultCnt = 0;
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pw = "tiger";
	
	try{
	//1. 데이터베이스 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//2. 데이터베이스 연결
	conn = DriverManager.getConnection(url,user,pw);
	//3. PreparedStatement 생성
	//사용자 정보 업데이트를 위한 SQL 작성
	String sql = "update emp set ename=? where empno=?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, ename);
	pstmt.setInt(2, eno);
	
	
	//4. SQL 실행
	resultCnt = pstmt.executeUpdate();
	
	//5. 실행결과 출력 : 수정되었습니다. 출력
	} catch(ClassNotFoundException cs) {
		
	} catch(SQLException se) {
		
	} finally {
		//6. 객체 close
		if(pstmt != null){
			try{
				pstmt.close();				
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null){
			try{
				conn.close();				
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<h1>사원 정보 수정</h1>
	<h3><%= resultCnt %> 개 행이 처리되었습니다.</h3>
</body>
</html>