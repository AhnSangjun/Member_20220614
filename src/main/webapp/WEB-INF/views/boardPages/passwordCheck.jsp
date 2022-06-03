<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>passwordCheck.jsp</h2>
    <form action="/board/delete" method="post">
        <label for="passwordConfirm">비밀번호를 입력해주세요</label>
        <input type="text" id="passwordConfirm"> <br>
        <input type="button" onclick="function passwordCheck() {

        }
        passwordCheck()" value="확인">
    </form>
</body>
</html>
