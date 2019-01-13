import "package:reading_list/book_progress.dart";
import "package:reading_list/book.dart";
import "package:reading_list/read_time.dart";

class ReadList {
  // _readingList is indexed by the category names - each category has a
  // List of BookProgress objects, one for each book in the category.
  // (each BookProgress has a Book object)

  Map<String, List<BookProgress>> _readingList = {};

  void createCategory(String categoryName) {
    _readingList[categoryName] = <BookProgress>[];
  }

  List<String> getCategories() {
    return _readingList.keys.toList();
  }

  List<Book> getBooksInCategory(String category) {
    List<BookProgress> progressList = _readingList[category];
    List<Book> books = [];

    // get the Book object from each BookProgress object
    for (BookProgress bp in progressList) {
      books.add(bp.book);
    }

    return books;
  }

  bool addBook(String categoryName, Book book, [bool insert = true]) {
    // check if the book is already there?
    List<BookProgress> cat = _readingList[categoryName];
    if (cat == null && insert == false) {
      return false; // category doesn't exist and insert == false
    } else {
      // category doesn't exist yet - create it
      createCategory(categoryName);
      cat = _readingList[categoryName];
    }

    cat.add(new BookProgress(book));
    return true;
  }

  void updateBook(String categoryName, Book book, ReadTime readTime,
      [bool insert = true]) {
    //get the correct list

    //find the book in the list of BookProgress objects
  }
}
