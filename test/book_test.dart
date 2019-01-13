import "package:test/test.dart";
import "package:reading_list/book.dart";

void main() {
  test("Book title should be 'Quarter Share' and numPages should be 0", () {
    Book book = new Book(title: "Quarter Share");
    expect(book.title, equals("Quarter Share"));
    expect(book.numPages, equals(0));
  });
}
