<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="footer">
	<%-- 파라메타 값 ( value 값을 가져와서 출력) --%>
	이메일 : <%= request.getParameter("email") %> <br>
	전화번호 : <%= request.getParameter("tel") %>
</div>