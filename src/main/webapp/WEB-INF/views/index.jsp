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
        const saveForm = () => {
            location.href = "/board/save";
        }
        const saveFileForm = () => {
            location.href = "/board/saveFile";
        }
        const findAll = () => {
            location.href = "/board/findAll";
        }
        const paging = () => {
            location.href = "/board/paging";
        }

        //    회원가입: /member-save => /member/save
        //    글쓰기 : /board-save   => /board/save
    </script>
</head>
<body>
    <h2>index.jsp</h2>
    <a href="/save-form">회원가입</a> <br>
    <a href="/login-form">로그인</a> <br>
    <a href="/findAll">글목록</a> <br>
    <a href="/findAll">회원목록</a> <br>

    로그인 회원 정보: ${loginMember}
    세션에 담은 memberId: ${sessionScope.loginMemberId}
    세션에 담은 id: ${sessionScope.loginId}

    <button class="btn btn-outline-success" onclick="findAll()">글목록</button>
</body>
</html>
