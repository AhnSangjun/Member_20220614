<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        const saveFrom = () => {
            location.href = "/board/save";
        }
        const saveFileFrom = () => {
            location.href = "/board/saveFile";
        }
        const findAll = () => {
            location.href = "/board/findAll";
        }
        const paging = () => {
            location.href = "/board/paging";
        }
    </script>
</head>
<body>
    <h2>index.jsp</h2>
    <a href="/member/save-form">회원가입</a> <br>
    <a href="/member/login-form">로그인</a> <br>

    <button class="btn btn-outline-success" onclick="findAll()">글목록</button>
</body>
</html>
