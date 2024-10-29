<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository" %>

<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>

<title>도서 정보</title>
</head>

<body>
<div class="container py-4">
    <%@ include file="menu.jsp"%>

    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">도서정보</h1>
            <p class="col-md-8 fs-4">BookInfo</p>
        </div>
    </div>

    <%
        String id=request.getParameter("id");
        BookRepository dao=BookRepository.getInstance();
        Book Book=dao.getBookById(id);
    %>
    <div class="row align-items-md-stretch">
        <div class="col-md-5">
            <img src="./resources/images/<%=Book.getFilename() %>" style="width : 70%">
        </div>
        <div class="col-md-6">
            <h3><b><%=Book.getName() %></b></h3>
            <p> <%=Book.getDescription()%>
            <p> <b>도서코드: </b><span class="badge text-bg-danger">
            <%=Book.getBookId() %></span>
            <p> <b>저자</b>: <%=Book.getAuthor()%>
            <p> <b>출판사</b>: <%=Book.getPublisher()%>
            <p> <b>출판일</b>: <%=Book.getReleaseDate()%>
            <p> <b>분류</b>: <%=Book.getCategory()%>
            <p> <b>재고수</b>: <%=Book.getUnitsInStock()%>
            <h4><%=Book.getUnitPrice() %>원</h4>
            <a href="./books.jsp" class="btn btn-secondary">도서 목록</a>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</div>
</body>
</html>