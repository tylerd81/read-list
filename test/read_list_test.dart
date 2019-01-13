import "package:test/test.dart";
import "package:reading_list/book.dart";
import "package:reading_list/book_progress.dart";
import "package:reading_list/read_time.dart";
import "package:reading_list/read_list.dart";

void main() {
  test("Create a 'Sci Fi' Reading List", () {
    ReadList rl = new ReadList();

    rl.createCategory("Sci Fi");

    var lists = rl.getCategories();

    expect(lists[0], equals("Sci Fi"));
  });

  test("Get all books from a list - There should be none.", () {
    ReadList rl = new ReadList();
    rl.createCategory("Sci Fi");
    List<Book> books = rl.getBooksInCategory("Sci Fi");

    expect(books.length, equals(0));
  });

  test("Add a book to a category that doesn't exist and create category", () {
    ReadList rl = new ReadList();
    rl.addBook("Sci Fi", new Book(title: "Quarter Share"));
    expect(rl.getCategories().contains("Sci Fi"), equals(true));
  });

  test("Add a book and get it from the list", () {
    ReadList rl = new ReadList();
    rl.createCategory("Sci Fi");
    rl.addBook("Sci Fi", new Book(title: "Quarter Share"));
    List<Book> books = rl.getBooksInCategory("Sci Fi");
    expect(books.length, equals(1));
  });
}
