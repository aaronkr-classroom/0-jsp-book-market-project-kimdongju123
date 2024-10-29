package dto;

import java.io.Serializable;
public class Book implements Serializable{
    private static final long serialVersionUID = -4274700572038677000L;

    private String bookId;
    private String name;
    private int unitPrice;
    private String author;
    private String description;
    private String publisher;
    private String category;
    private long unitInStock;
    private String relesaseDate;
    private String condition;
    private String filename;

    public Book() {
        super();
    }

    public Book(String bookId, String name, Integer unitPrice) {
        this.bookId = bookId;
        this.name = name;
        this.unitPrice = unitPrice;
    }

    public String getBookId() {
        return this.bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUnitPrice() {
        return this.unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getAuthor() {
        return this.author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPublisher() {
        return this.publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getCategory() {
        return this.category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public long getUnitInStock() {
        return this.unitInStock;
    }

    public void setUnitInStock(int unitInStock) {
        this.unitInStock = unitInStock;
    }

    public String getRelesaseDate() {
        return this.relesaseDate;
    }

    public void setRelesaseDate(String relesaseDate) {
        this.relesaseDate = relesaseDate;
    }

    public String getCondotion() {
        return this.condition;
    }

    public void setCondotion(String condition) {
        this.condition = condition;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename=filename;
    }


}
