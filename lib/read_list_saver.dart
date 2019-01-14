import "package:reading_list/read_list.dart";

abstract class ReadListSaver {
  Future<bool> save(ReadList readList);
}
