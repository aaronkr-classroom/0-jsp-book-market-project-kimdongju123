<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String sessionId = (String) session.getAttribute("sessionId");
%>

<header class="pb-3 mb-4 border-bottom">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="./welcome.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                <svg width="32" height="32" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                    <path d="M8.707 1.5a1 1 0 0 1 .414.6L6.646 8.146a.5.5 0 0 0 .708.708L8.707 1.5zM1 8.5V2.707L7.5.707a.5.5 0 0 0 .5 0l.5.5L1 8.5z"/>
                </svg>
                <span class="fs-4">Home</span>
            </a>
            <ul class="nav nav-pills">
                <c:choose>
                    <c:when test="${empty sessionId}">
                        <li class="nav-item"><a class="nav-link" href="<c:url value='/member/loginMember.jsp'/>">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value='/member/addMember.jsp'/>">회원 가입</a></li>
                    </c:when>
                    <c:otherwise>
                        <li style="padding-top: 7px; color: white;">${sessionId} 님</li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value='/member/logoutMember.jsp'/>">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value='/member/updateMember.jsp'/>">회원 수정</a></li>
                    </c:otherwise>
                </c:choose>
                <li class="nav-item"><a href="<c:url value='/books.jsp'/>" class="nav-link">도서 목록</a></li>
                <li class="nav-item"><a href="<c:url value='/addBook.jsp'/>" class="nav-link">도서 등록</a></li>
                <li class="nav-item"><a href="<c:url value='/editBook.jsp?edit=update'/>" class="nav-link">도서 수정</a></li>
                <li class="nav-item"><a href="<c:url value='/editBook.jsp?edit=delete'/>" class="nav-link">도서 삭제</a></li>
                <li class="nav-item"><a href="<c:url value='/BoardListAction.do?pageNum=1'/>" class="nav-link">게시판</a></li>
            </ul>
        </div>
    </div>
</header>
