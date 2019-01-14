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

  test("save() should return true", () async {
    bool status = await saver.save(rl);
    expect(status, equals(true));
  });
}
