<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberManager : 회원리스트</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/index.css"/>" rel="stylesheet"
	type="text/css">
<style>
</style>
</head>
<body>
	<div id="wrap">
		<%-- header 시작 --%>
		<%@ include file="/WEB-INF/views/frame/header.jsp"%>
		<%-- header 끝 --%>

		<%-- nav 시작 --%>
		<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
		<%-- nav 끝 --%>

		<!-- 컨텐츠 시작 -->
		<div id="contents">
			<h3>회원 리스트</h3>
			<hr>
			<table>
				<tr>
					<td>no</td>
					<td>아이디</td>
					<td>비밀번호</td>
					<td>이름</td>
					<td>사진</td>
					<td>가입일</td>
				</tr>

				<c:forEach items="${viewData.memberList}" var="memberInfo"
					varStatus="stat">
					<tr>
						<td><%-- ${memberInfo.idx} / ${stat.index} / ${stat.count} / ${viewData.totalCount} /  --%>${viewData.no-stat.index}</td>
						<td>${memberInfo.userId}</td>
						<td>${memberInfo.userPw}</td>
						<td>${memberInfo.userName}</td>
						<td><img
							src="<c:url value='/uploadfile/userphoto/${memberInfo.userPhoto}'/>"
							height="30"></td>
						<td><fmt:formatDate value="${memberInfo.regDate}"
								pattern="yyyy.MM.dd" /></td>
					</tr>
				</c:forEach>

			</table>
			<c:if test="${viewData.totalCount>0}">
				<div id="pagingBox">
					<div>
						<c:forEach begin="1" end="${viewData.pageTotalCount}" var="num">
							<a href="memberList?p=${num}">${num}</a>
						</c:forEach>
					</div>
				</div>
			</c:if>
		</div>
		<!-- 컨텐츠 끝 -->


		<!-- footer 시작 -->
		<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>