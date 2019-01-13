import "package:test/test.dart";
import "package:reading_list/book.dart";
import "package:reading_list/book_progress.dart";

void main() {
  test("Percentage complete should be 0", () {
    Book book = new Book(title: "Quarter Share");
    BookProgress bp = new BookProgress(book);

    expect(bp.percentageComplete, equals(0));
  });

  test("Percentage complete should be 100", () {
    Book book = new Book(title: "Quarter Share", numPages: 300);
    BookProgress bp = new BookProgress(book, numPagesRead: 300);

    expect(bp.percentageComplete, equals(100));
  });
}
