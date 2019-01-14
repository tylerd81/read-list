import "dart:io";

import "package:reading_list/read_list.dart";
import "package:reading_list/read_list_saver.dart";

class ReadListFileSaver extends ReadListSaver {
  Future<bool> save(ReadList readList) {
    return Future(() => _save(readList));
    //return false;
  }
}

bool _save(ReadList readList) {
  StringBuffer buffer = new StringBuffer();
  // get all the categories
  // get the list of BookProgress from each category
  // get each book from the BookProgress objects

  // category, bookTitle, date, seconds, pages

  return true;
}
