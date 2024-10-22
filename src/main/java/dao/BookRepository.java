package dao;

import java.util.ArrayList;
import dto.Book;

public class BookRepository {
	
	private ArrayList<Book> listOfBooks=new ArrayList<Book>();
	private static BookRepository instance=new BookRepository();
	
	public static BookRepository getInstance() {
		return instance;
	}
	
	
	public BookRepository() {
		Book book1 = new Book("ISBN1234", "C# 프로그래밍", 27000);
		  book1.setAuthor("우재남");
		  book1.setPublisher("한빛아카데미");
		  book1.setCategory("IT모바일");
		  book1.setUnitsInStock(1000);
		  book1.setReleaseDate("2022/10/06");
		  book1.setFilename("ISBN1234.jpg");
		  
		  Book book2 = new Book("ISBN1235", "자바마스터", 30000);
		  book2.setAuthor("송미영");
		  book2.setPublisher("한빛아카데미");
		  book2.setCategory("IT모바일");
		  book2.setUnitsInStock(1000);
		  book2.setReleaseDate("2023/01/01");
		  book2.setFilename("ISBN1235.jpg");
		  
		  Book book3 = new Book("ISBN1236", "파이", 30000);
		  book3.setAuthor("최성철");
		  book3.setPublisher("한빛아카데미");
		  book3.setCategory("IT모바일");
		  book3.setUnitsInStock(1000);
		  book3.setReleaseDate("2023/01/10");
		  book3.setFilename("ISBN1236.jpg");
		
		  listOfBooks.add(book1);
		  listOfBooks.add(book2);
		  listOfBooks.add(book3);
	}
	
	
		  
	  public ArrayList<Book> getAllBooks() {
		  return listOfBooks;
	  
}
	  
	  public Book getBookById(String bookId) {
			 Book bookById= null;
			 
			 for (int i=0; i < listOfBooks.size(); i++) {
				 Book book=listOfBooks.get(i);
				 if (book!= null && book.getBookId()!=null &&
						 book.getBookId().equals(bookId)) {
					 bookById=book;
					 break;
				 }
			 }
			 return bookById;
				
		 }
	  
	  public void addBook(Book book) {
		  listOfBooks.add(book);
	  }
		 

}
