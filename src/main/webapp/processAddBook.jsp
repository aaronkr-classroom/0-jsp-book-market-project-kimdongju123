<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.book" %>
<%@ page import="dao.BookRepository"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>


<%
    request.setCharacterEncoding("UTF-8");

    String filename="";
    String realFolder = "C:\\바탕 화면\\sl\\src\\main\\webapp\\resources\\images";
    int maxSize=5 * 1024 * 1024;
    String encType = "UTF-8";

    MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());


    String bookId=multi.getParameter("bookId");
    String name=multi.getParameter("name");
    String unitPrice=multi.getParameter("unitPrice");
    String author=multi.getParameter("author");
    String publisher=multi.getParameter("publisher");
    String releaseDate=multi.getParameter("releaseDate");
    String description=multi.getParameter("description");
    String category=multi.getParameter("category");
    String unitInStock=multi.getParameter("unitInStock");
    String condition=multi.getParameter("condition");

    Enumeration files=multi.getFilenames();
    String fname=(String) files.nextElement();
    String fileName=multi.getFilesystemName(fname);

    Integer price;

    if(unitPrice.isEmpty())
        price=0;
    else
        price=Integer.valueOf(unitPrice);
    
    long stock;

    if(unitInStock.isEmpty())
        stock=0;
    else
        stock=Long.valueOf(unitInStock);
    
    BookRepository dao=BookRepository.getInstance();

    Book newBook=new book();
    newBook.setBookId(bookId);
    newBook.setName(name);
    newBook.setPrice(price);
    newBook.setAuthor(author);
    newBook.setPublisher(publisher);
    newBook.setReleaseDate(releaseDate);
    newBook.setDescription(description);
    newBook.setCategory(category);
    newBook.setUnitsInStock(stock);
    newBook.setCondition(condition);
    newBook.setFilename(fileName);

    dao.addBook(newBook);

    response.sendRedirect("books.jsp");
%>