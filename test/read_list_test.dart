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

  test("Update the read time on a book", () {
    ReadList rl = new ReadList();
    Book book = new Book(title: "Quarter Share");
    rl.createCategory("Sci Fi");
    rl.addBook("Sci Fi", book);
    ReadTime rt = new ReadTime(new DateTime.now(), 100, 100);

    BookProgress bp = rl.updateBookProgress("Sci Fi", book, rt);
    expect(bp.totalTimeRead, equals(100));
  });

  test("Add a book and then remove it", () {
    ReadList rl = new ReadList();
    Book book = new Book(title: "Quarter Share");
    rl.createCategory("Sci Fi");
    rl.addBook("Sci Fi", book);

    rl.removeBook("Sci Fi", book);
    expect(rl.getBooksInCategory("Sci Fi").contains(book), equals(false));
  });

  test("Add a category and then remove it", () {
    ReadList rl = new ReadList();
    rl.createCategory("Sci Fi");
    expect(rl.getCategories().contains("Sci Fi"), equals(true));
    rl.removeCategory("Sci Fi");
    expect(rl.getCategories().contains("Sci Fi"), equals(false));
  });

  test("Getting a BookProgress from a non existing category should be null",
      () {
    ReadList rl = new ReadList();
    BookProgress bp =
        rl.getBookProgress("Sci Fi", new Book(title: "Second Ship"));
    expect(bp, equals(null));
  });

  test("Getting a list from an empty category should be an empty list", () {
    ReadList rl = new ReadList();
    var bl = rl.getBooksInCategory("Sci Fi");
    expect(bl, equals(null));
  });

  test("Add a book and get its progress", () {
    ReadList rl = new ReadList();
    Book book = new Book(title: "Quarter Share");
    rl.createCategory("Sci Fi");
    rl.addBook("Sci Fi", book);

    var progress = rl.getBookProgress("Sci Fi", book);
    expect(progress.book == book, equals(true));
  });
}
