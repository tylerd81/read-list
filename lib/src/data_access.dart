import "book.dart";
import "reading_progress.dart";

class DataAccess {
  List<String> categoryList() {
    return [];
  }

  List<Book> bookList() {
    return <Book>[];
  }

  List<Book> booksInCategory(String category) {
    return <Book>[];
  }

  List<ReadingProgress> progressOf(Book book) {
    return <ReadingProgress>[];
  }

  bool addBook(Book book) {
    return false;
  }

  bool addCategory(String category) {
    return false;
  }

  bool addProgress(Book book, ReadingProgress rp) {
    return false;
  }

  bool removeBook(Book book) {
    return false;
  }

  bool removeCategory(String category) {
    return false;
  }
}
