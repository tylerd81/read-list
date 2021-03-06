import "package:test/test.dart";
import "package:reading_list/read_list.dart";

void main() {
  //create a reading list
  ReadList rl = new ReadList();

  //create some categories
  rl.createCategory("Sci Fi");
  rl.createCategory("Fantasy");
  rl.createCategory("Technology");

  //add some books
  rl.addBook("Sci Fi", Book(title: "Quarter Share", numPages: 320));
  rl.addBook("Sci Fi", Book(title: "Second Ship", numPages: 410));

  rl.addBook("Fantasy", Book(title: "Lord of the Rings", numPages: 510));
  rl.addBook("Fantasy", Book(title: "The Hobbit", numPages: 482));
  rl.addBook("Fantasy", Book(title: "The Halfling's Gem", numPages: 321));

  rl.addBook(
      "Technology", Book(title: "Head First Design Patterns", numPages: 341));

  // do some reading on a couple books
  rl.updateBookProgress(
      "Sci Fi", Book(title: "Second Ship"), ReadTime(DateTime.now(), 600, 20));

  rl.updateBookProgress("Sci Fi", Book(title: "Quarter Share"),
      ReadTime(DateTime.now(), 600, 20));
  rl.updateBookProgress("Sci Fi", Book(title: "Quarter Share"),
      ReadTime(DateTime.now(), 600, 20));
  rl.updateBookProgress("Sci Fi", Book(title: "Quarter Share"),
      ReadTime(DateTime.now(), 600, 20));

  test("All the books categories are created", () {
    var cat = rl.getCategories();

    expect(cat.length, equals(3));
    expect(cat.contains("Sci Fi"), equals(true));
    expect(cat.contains("Fantasy"), equals(true));
    expect(cat.contains("Technology"), equals(true));
  });

  test("The correct number of books are in each category", () {
    var scifi = rl.getBooksInCategory("Sci Fi");
    var fantasy = rl.getBooksInCategory("Fantasy");
    var tech = rl.getBooksInCategory("Technology");

    expect(scifi.length, equals(2));
    expect(fantasy.length, equals(3));
    expect(tech.length, equals(1));
  });

  test("Some progress has been made on the book...", () {
    var bp = rl.getBookProgress("Sci Fi", Book(title: "Second Ship"));
    expect(bp.totalPagesRead, equals(20));
  });

  test("A lot of progress has been made on Quarter Share", () {
    var bp = rl.getBookProgress("Sci Fi", Book(title: "Quarter Share"));
    expect(bp.totalPagesRead, equals(60));
  });
}
