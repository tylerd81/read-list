import "package:test/test.dart";
import "package:reading_list/book.dart";
import "package:reading_list/book_progress.dart";
import "package:reading_list/read_time.dart";
import "package:reading_list/read_list.dart";

void main() {
  test("Percentage complete should be 0", () {
    Book book = new Book(title: "Quarter Share");
    BookProgress bp = new BookProgress(book);

    expect(bp.percentageComplete, equals(0));
  });

  test("Percentage complete should be 100", () {
    Book book = new Book(title: "Quarter Share", numPages: 300);
    BookProgress bp = new BookProgress(book);
    bp.add(ReadTime(new DateTime.now(), 100, 300));
    expect(bp.percentageComplete, equals(100));
  });

  test("Number of pages read should be 300", () {
    Book book = new Book(title: "Quarter Share", numPages: 300);
    BookProgress bp = new BookProgress(book);
    bp.add(ReadTime(new DateTime.now(), 100, 300));
    expect(bp.totalPagesRead, equals(300));
  });

  test("Total Time Read should be 100", () {
    Book book = new Book(title: "Quarter Share", numPages: 300);
    BookProgress bp = new BookProgress(book);
    bp.add(ReadTime(new DateTime.now(), 100, 300));
    expect(bp.totalTimeRead, equals(100));
  });
}
