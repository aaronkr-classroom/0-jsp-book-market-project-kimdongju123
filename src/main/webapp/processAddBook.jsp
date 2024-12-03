<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.Book" %>
<%@page import="dao.BookRepository" %>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart"%>
<%@page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<% 
request.setCharacterEncoding("UTF-8");

String filename="";
String realFolder="D:\webcode\0-directives-actions-swallow02\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\bookmarket";

int maxSize = 5 * 1024 * 1024;
String encType="utf-8";

MultipartRequest multi=new MultipartRequest(request,realFolder,
		maxSize,encType,new DefaultFileRenamePolicy())

String bookId=multi.getParameter("bookId");
String name=multi.getParameter("name");
String unitPrice=multi.getParameter("unitPrice");
String author=multi.getParameter("author");
String publisher=multi.getParameter("publisher");
String releaseDate=multi.getParameter("releaseDate");
String description=multi.getParameter("description");
String category=multi.getParameter("category");
String unitsInStock=multi.getParameter("unitInStock");
String condition=multi.getParameter("condition");

Enumeration files=multi.getFileNames();
String fname=(String) files.nextElement();
String fileName=multi.getFilesystemName(fname);

Integer price;

if(unitPrice.isEmpty())
	price=0;
else
	price=Integer.valueOf(unitPrice);

long stock;

if(unitsInStock.isEmpty())
	stock=0;
else
	stock=Long.valueOf(unitsInStock);

PreparedStatement pstmt=null;
String sql = "INSERT INTO book VALUES(?,?,?,?,?,?,?,?,?,?,?)";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, bookId);
pstmt.setString(2, name);
pstmt.setInt(3, price);
pstmt.setString(4, author);
pstmt.setString(5, description);
pstmt.setString(6, publisher);
pstmt.setString(7, category);
pstmt.setLong(8, stock);
pstmt.setString(9, releaseDate);
pstmt.setString(10, condition);
pstmt.setString(11, fileName);
pstmt.executeUpdate();

if (pstmt != null)
    pstmt.close();
if (conn != null)
    conn.close();


BookRepository dao=BookRepository.getInstance();
Book newBook=new Book();
newBook.setBookId(bookId);
newBook.setName(name);
newBook.setUnitPrice(price);
newBook.setAuthor(author);
newBook.setPublisher(publisher);
newBook.setPublisher(releaseDate);
newBook.setDescription(description);
newBook.setCategory(category);
newBook.setUnitsInStock(stock);
newBook.setCondition(condition);
newBook.setFilename(fileName);
dao.addBook(newBook);

response.sendRedirect("books.jsp");
%>
