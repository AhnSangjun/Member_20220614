<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글목록</title>
    <!-- CSS only -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <table class="table">
        <tr>
            <th>글번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>조회시간</th>
            <th>조회수</th>
        </tr>
        <c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>${board.boardWriter}</td>
            <a><a href="/board/detail?id=${board.id}" ${board.boardtitle}</a></td>
            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.boardCreatedDate}"></fmt:formatDate></td>
            <td>${boardtime}</td>
        </tr>
        </c:forEach>
</body>
</html>
