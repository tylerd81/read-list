import "package:reading_list/book.dart";

class BookProgress {
  Book book;
  int numPagesRead;
  DateTime dateStarted;
  DateTime dateFinished;
  bool finished = false;

  int get percentageComplete {
    if (book.numPages == 0 || numPagesRead == 0) {
      return 0;
    }
    return ((numPagesRead / book.numPages) * 100).floor();
  }

  BookProgress(this.book,
      {this.numPagesRead, this.dateStarted, this.dateFinished, this.finished});
}
