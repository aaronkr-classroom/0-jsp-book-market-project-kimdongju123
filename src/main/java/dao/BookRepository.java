package dao;

import java.util.ArrayList;
import dto.book;

public class BookRepository {
    private ArrayList<book> listOfBook = new ArrayList<book>();
    private static BookRepository instance=new BookRepository();

    public static BookRepository getInstance() {
        return instance;
    }

    public BookRepository() {
        book book1 = new book("ISBN1234", "C# 프로그래밍", 27000);
        book1.setAuthor("우재남");
        book1.setDescription("C#을 처음 접하는 독가를 대상으로 일대일 수업처럼 자세히 설명한 책");
        book1.setPublisher("한빛아카데미");
        book1.setCategory("IT 모바일");
        book1.setUnitInStock(1000);
        book1.setRelesaseDate("2022/10/06");
        book1.setFilename("ISBN1234.jpg");

        book book2 = new book("ISBN1235", "자바마스터", 30000);
        book2.setAuthor("송미영");
        book2.setDescription("자바를 처음 접하는 독가를 대상으로 일대일 수업처럼 자세히 설명한 책");
        book2.setPublisher("한빛아카데미");
        book2.setCategory("IT 모바일");
        book2.setUnitInStock(1000);
        book2.setRelesaseDate("2023/01/01");
        book2.setFilename("ISBN1235.jpg");

        book book3 = new book("ISBN1236", "파이썬 프로그래밍", 27000);
        book3.setAuthor("최성철");
        book3.setDescription("파이썬을 처음 접하는 독가를 대상으로 일대일 수업처럼 자세히 설명한 책");
        book3.setPublisher("한빛아카데미");
        book3.setCategory("IT 모바일");
        book3.setUnitInStock(1000);
        book3.setRelesaseDate("2023/01/01");
        book3.setFilename("ISBN1236.jpg");

        listOfBook.add(book1);
        listOfBook.add(book2);
        listOfBook.add(book3);
    }

    public ArrayList<book> getAllBooks() {
        return listOfBook;
    }

    public book getBookById(String bookId) {
        book bookById = null;

        for (int i = 0; i < listOfBook.size(); i++) {
            book book=listOfBook.get(i);
            if (book != null && book.getBookId() != null && book.getBookId().equals(bookId)) {
                bookById=book;
                break;
            }
        }

        return bookById;
    }

    public void addBook(book book) {
        listOfBook.add(book);
    }
}
