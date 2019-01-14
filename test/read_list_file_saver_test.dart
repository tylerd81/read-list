import "dart:async";
import "package:test/test.dart";
import "package:reading_list/read_list.dart";
import "package:reading_list/read_list_file_saver.dart";

void main() async {
  ReadListFileSaver saver = new ReadListFileSaver();
  ReadList rl = new ReadList();
  Book book = new Book(title: "Quarter Share");

  rl.createCategory("Sci Fi");
  rl.addBook("Sci Fi", book);
  rl.updateBookProgress("Sci Fi", book, ReadTime(DateTime.now(), 100, 100));
  rl.updateBookProgress("Sci Fi", book, ReadTime(DateTime.now(), 200, 200));

  test("save() should return true", () async {
    bool status = await saver.save(rl);
    expect(status, equals(true));
  });
}
