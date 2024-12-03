<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import= "java.sql.*" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@page import="dto.Book" %>
    <%@page import="dao.BookRepository" %>
    <jsp:useBean id="bookDAO" class = "dao.BookRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/
bootstrap.main.css" rel="stylesheet">
<meta charset="UTF-8">
<link rel = "stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서 목록</title>
<script type="text/javascript">
function addToCart() {
	if (confirm"도서를 장바구니에 추가하시겠습니까?")) {
		document.addForm.submit();	
	}else{
		document.addForm.reset();
	}	
}
</script>


</head>
<body>
<div class = "container py-4">
<%@ include file = "menu.jsp" %>

<div class = "p-5 mb-4 bg-body-tertiary rounded-3">
<div class = "container-fluid py-5">
<h1 class = "display-5 fw-bold">도서목록</h1>
<p class = "col-md-8 fs-4">Book List</p>
</div>
</div>
<%
BookRepository dao=BookRepository.getInstance();
ArrayList<Book> listOfBooks = bookDAO.getAllBooks();
%>

<%@ include file="dbconn.jsp" %>
<div class="row align-items-md-stretch text-center">
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = "SELECT * FROM book";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while (rs.next()) {

%>

<%
for(int i = 0; i < listOfBooks.size(); i++){
	Book book=listOfBooks.get(i);
%>
<div class = "col-md-4">
  <div class = "h-100 p-2">
  <img src = "./resources/images/<%=rs.getString("b_filename") %> style="width:250; height : 350"/>
   <h4><%=book.getUnitPrice() %>원</h4>
    <p><form name="addForm" action="./addCart.jsp?id=<%=book.getBookId() %>" method="post">
    <a href="#" class="btn btn-info" onclick="addToCart()">도서 주문&raquo;</a>
    <a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
    <a href="./books.jsp" class="btn btn-secondary"> 도서목록 &raquo;</a>
    </form>
    
     <h5><b><%=rs.getString("b_name") %></b></h5>
     <p> <%=rs.getString("b_author") %>
     <br><%=rs.getString("b_publisher") %> |<%=rs.getString("b_unitPrice") %>원
     <p> <%=rs.getString("b_description").substring(0,60) %>...
     <p> <%=rs.getString("b_unitPrice") %> 원
   
     <p> <a href ="./book.jsp?id=<%=rs.getString("b_id")%>"
     class="btn btn-secondary" role ="button">상세 정보 &raquo;></a>
      </div>
</div>
<%
 }
%>
</div>
<%@ include file = "footer.jsp" %>
</div>
</body>
</html>