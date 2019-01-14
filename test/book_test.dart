import "package:test/test.dart";
import "package:reading_list/book.dart";

void main() {
  test("Book title should be 'Quarter Share' and numPages should be 0", () {
    Book book = new Book(title: "Quarter Share");
    expect(book.title, equals("Quarter Share"));
    expect(book.numPages, equals(0));
  });

  test("Two books with the same title should be the same", () {
    Book b1 = new Book(title: "Quarter Share");
    Book b2 = new Book(title: "Quarter Share");

    expect(b1 == b2, equals(true));
  });
}
