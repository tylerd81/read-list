import "package:reading_list/book.dart";
import "package:reading_list/read_time.dart";

class BookProgress {
  // readTimeList is the list of all the times we have read this book
  List<ReadTime> readTimeList = [];
  Book book;
  DateTime dateFinished;

  bool finished = false;

  // constructor
  BookProgress(this.book);

  int get percentageComplete {
    int totalPagesRead = 0;

    if (book.numPages == 0 || readTimeList.isEmpty) {
      return 0;
    }

    for (ReadTime rt in readTimeList) {
      totalPagesRead += rt.numPagesRead;
    }

    return ((totalPagesRead / book.numPages) * 100).floor();
  }

  void add(ReadTime readTime) {
    readTimeList.add(readTime);
  }
}
