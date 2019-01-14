import "src/book_progress.dart";
import "src/book.dart";
import "src/read_time.dart";

export "src/book.dart";
export "src/read_time.dart";
export "src/book_progress.dart";

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
    if (progressList == null) {
      return null;
      // null makes more sense than an empty list since the category
      // doesn't exist at all. It's possible for the category to exist
      // but there won't be any books in it - but that's still a valid
      // list.
    }
    List<Book> books = [];

    // get the Book object from each BookProgress object
    for (BookProgress bp in progressList) {
      books.add(bp.book);
    }
    return books;
  }

  BookProgress getBookProgress(String categoryName, Book book) {
    List<BookProgress> cat = _readingList[categoryName];
    if (cat == null) {
      return null;
    }
    // find the book in the BookProgress list
    for (BookProgress bp in cat) {
      if (bp.book == book) {
        return bp;
      }
    }
    return null;
  }

  bool addBook(String categoryName, Book book, [bool insert = true]) {
    // check if the book is already there?
    List<BookProgress> cat = _readingList[categoryName];
    if (cat == null && insert == false) {
      return false; // category doesn't exist and insert == false
    } else if (cat == null && insert == true) {
      // category doesn't exist yet - create it
      createCategory(categoryName);
    }
    cat = _readingList[categoryName];

    cat.add(new BookProgress(book));
    return true;
  }

  BookProgress updateBookProgress(
      String categoryName, Book book, ReadTime readTime) {
    //get the correct list
    var progressList = _readingList[categoryName];
    if (progressList == null) {
      return null;
    }

    //find the book in the list of BookProgress objects
    bool found = false;
    BookProgress progressToUpdate = null;
    int i = 0;

    while (!found && i < progressList.length) {
      if (progressList[i].book.title == book.title) {
        found = true;
        progressToUpdate = progressList[i];
      } else {
        i++;
      }
    }

    if (!found) {
      return null;
    }

    progressToUpdate.add(readTime);
    return progressToUpdate;
  }

  BookProgress removeBook(String categoryName, Book book) {
    // removing the book also removes the BookProgress
    var cat = _readingList[categoryName];
    int i = 0;

    while (i < cat.length) {
      if (cat[i].book == book) {
        return cat.removeAt(i);
      } else {
        i++;
      }
    }
    return null; // if we are here the book wasn't found
  }

  bool removeCategory(String categoryName) {
    if (getCategories().contains(categoryName)) {
      _readingList.remove(categoryName);
      return true;
    } else {
      return false;
    }
  }
}
