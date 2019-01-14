class Book {
  String title;
  String Author;
  int numPages;

  Book({this.title, this.Author, this.numPages = 0});

  bool operator ==(dynamic book) {
    return title == book.title;
  }
}
