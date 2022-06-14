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
    <title>회원가입</title>
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

        <form action="/member/save-form" method="post">
            <input class="form-control mb-2" type="text" onblur="duplicateCheck()" id="memberId" name="memberId" placeholder="아이디">
            <span id="dup-check-result"></span>
            <input class="form-control mb-2" type="password" onblur="pwCheck()" id="memberPassword" name="memberPassword" placeholder="비밀번호 8~16자 숫자,영문소문자, 특수문자">
            <p id="pw-check-result"></p>
            <input class="form-control mb-2" type="text" onblur="nameCheck()" id="memberName" name="memberName" placeholder="이름">
            <span id="name-check-result"></span>
            <input class="form-control mb-2" type="email" onblur="emailCheck()" id="memberEmail" name="memberEmail" placeholder="이메일">
            <span id="email-check-result"></span>
            <input class="form-control mb-2" type="text" onblur="mobileCheck()" id="memberMobile" name="memberMobile" placeholder="전화번호">
            <span id="mobile-check-result"></span>
            <input class="form-control mb-2" type="file" onblur="profileCheck()" name="memberProfile" placeholder="프로필사진">
            <p id="profile-check-result"></p>
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
                    checkResult.innerHTML = "멋진 아이디네요!";
                    checkResult.style.color = "green";
                } else {
                    // 이미 사용중인 아이디
                    checkResult.innerHTML = "이미 사용중인 아이디이거나 탈퇴한 회원입니다."
                    checkResult.style.color = "red";
                }
              //  alert("ajax 성공");
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
        } else {
            checkResult.innerHTML = "8~16자 대 소문자 숫자 특수문자를 사용하세요.";
            checkResult.style.color = "red";
        }
    }

    const nameCheck = () => {
        const memberName = document.getElementById("memberName").value;
        const checkResult = document.getElementById("name-check-result");
        if ( memberName !== nameCheck ) {
            checkResult.innerHTML = "멋진 이름이네요!";
            checkResult.style.color = "green";
        } else {
            checkResult.innerHTML = "2~6자 공백없이 입력해주세요.";
            checkResult.style.color = "red";
        }
    }

    const emailCheck = () => {
        const memberEmail = document.getElementById("memberEmail").value;
        const checkResult = document.getElementById("email-check-result");
        if ( memberEmail !== emailCheck ) {
            checkResult.innerHTML = "올바른 이메일형식입니다.";
            checkResult.style.color = "green";
        } else {
            checkResult.innerHTML = "이미 가입된 이메일입니다.";
            checkResult.style.color = "red";
        }
    }

    const mobileCheck = () => {
        const memberMobile = document.getElementById("memberMobile").value;
        const checkResult = document.getElementById("mobile-check-result");
        if ( memberMobile !== mobileCheck ) {
            checkResult.innerHTML = "전화번호가 확인되었습니다.";
            checkResult.style.color = "green";
        } else {
            checkResult.innerHTML = "이미 가입된 전화번호입니다.";
            checkResult.style.color = "red";
        }
    }

    const profileCheck = () => {
        const memberProfile = document.getElementById("memberProfile").value;
        const profileCheck = document.getElementById("profile-check-result");
        if ( memberProfile !== profileCheck ) {
            alert("해당 파일은 이미지 파일입니다.");
        } else {
            alert("해당 파일은 이미지 파일이 아닙니다.");
        }
    }
</script>
</html>
