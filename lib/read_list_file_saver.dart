import "dart:io";

import "package:reading_list/read_list.dart";
import "package:reading_list/read_list_saver.dart";

// A simple save method. It just writes the data to a text file.
// the format is:
// category:book title:date:num pages read:num seconds read

class ReadListFileSaver extends ReadListSaver {
  String filename = "readlist.dat";

  Future<bool> save(ReadList readList) {
    return _save(readList);
    //return false;
  }
}

Future<bool> _save(ReadList readList) {
  return new Future(() async {
    StringBuffer buffer = new StringBuffer();
    // get all the categories
    var categories = readList.getCategories();

    // very inefficient way of looping through all the items
    //TODO: find a better way to loop through the Map
    for (String category in categories) {
      List<Book> books = readList.getBooksInCategory(category);

      for (Book book in books) {
        // get the list of BookProgress from each category
        // get each book from the BookProgress objects
        BookProgress bp = readList.getBookProgress(category, book);
        for (ReadTime rt in bp.readTimeList) {
          buffer.write(
              "$category:${book.title}:${rt.when.toString()}:${rt.numPagesRead}:${rt.numSeconds}\n");
        }
      }
    }

    File file = new File("readlist.txt");
    await file.writeAsString(buffer.toString());
    return true;
  });
}
