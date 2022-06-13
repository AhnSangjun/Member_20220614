<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-19
  Time: 오후 1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="<c:url value="/resources/js/jquery.js"/>"></script>
    <style>
        .container {
            max-width: 500px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="display-4 fw-normal">회원가입</h2>
    <div class="py-5 text-center">

        <form action="/save" method="post">
            <input class="form-control mb-2" type="text" onblur="duplicateCheck()" id="memberId" name="memberId" placeholder="아이디">
            <span id="dup-check-result"></span>
            <input class="form-control mb-2" type="password" onblur="pwCheck()" id="memberPassword" name="memberPassword" placeholder="비밀번호 8~16자 숫자,영문소문자, 특수문자">
            <p id="pw-check-result"></p>
            <input class="form-control mb-2" type="text" name="memberName" placeholder="이름">
            <input class="form-control mb-2" type="email" name="memberEmail" placeholder="이메일">
            <input class="form-control mb-2" type="text" name="memberMobile" placeholder="전화번호">
            <input class="form-control mb-2" type="file" name="memberProfile" placeholder="프로필사진">
            <input class="btn btn-primary" type="submit" value="회원가입">
        </form>
    </div>
</div>
</body>
<script>
    const duplicateCheck = () => {
        const  memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        $.ajax({
            type: "post", // http request method
            url: "duplicate-check", // 요청주소(컨트롤러 주소값)
            data: {"memberId":memberId}, // 전송하는 파라미터
            dataType: "text", // 리턴받을 데이터 형식
            success: function (result) {
                if (result == "ok"){
                    // 사용가능한 아이디
                    checkResult.innerHTML = "사용가능합니다.";
                    checkResult.style.color = "green";
                } else {
                    // 이미 사용중인 아이디
                    checkResult.innerHTML = "이미 사용중인 아이디입니다."
                    checkResult.style.color = "red";
                }
                alert("ajax 성공");
            },
            error: function () {
                alert("오타체크");
            }
        });
    }
    const pwCheck = () => { <%-- 비밀번호 innerHTML 형태로 확인 추가 --%>
        const memberPassword = document.getElementById("memberPassword").value;
        const checkResult = document.getElementById("pw-check-result");
        if ( memberPassword !== pwCheck ) {
            checkResult.innerHTML = "일치합니다.";
            checkResult.style.color = "green";
        }  else {
            checkResult.innerHTML = "일치하지않습니다.";
            checkResult.style.color = "red";
        }
    }
</script>
</html>
