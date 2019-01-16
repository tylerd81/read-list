import "dart:io";
import "data_access.dart";
import "book.dart";

class DataAccessFile extends DataAccess {
  String filename;
  File dataFile;
  String fileData;
  List<String> fileLines;
  List<_Category> categories = [];
  List<Book> books = [];

  DataAccessFile(this.filename) {
    _openFile();
    _loadCategories();
  }

  void _openFile() {
    dataFile = new File(filename);
    try {
      fileData = dataFile.readAsStringSync();
      fileLines = fileData.split("\n");
      dataFile = null;
    } on Exception {
      print("Error reading the file");
    }
  }

  void _loadCategories() {
    // find the line that starts with @categories
    int lineNum = 0;
    bool found = false;

    if (fileLines.isEmpty) {
      throw "The data file hasn't been read yet...";
    }

    while (!found && lineNum < fileLines.length) {
      if (fileLines[lineNum].contains("@categories")) {
        found = true;
        lineNum++; // go passed @categories line
      } else {
        lineNum++;
      }
    }

    if (!found) {
      throw "Error in the data file.";
    }

    bool done = false;
    while (!done && lineNum < fileLines.length) {
      var line = fileLines[lineNum].trim();

      if (line.contains("@progress")) {
        done = true;
      } else if (line[0] != "#" && line.isNotEmpty) {
        var cat = line.split(":");
        categories.add(_Category(cat[0], cat[1]));
      }
      lineNum++;
    }

    if (!done) {
      // we ran to the end of the datafile before hitting @progress
      throw "Error in the data file";
    }
  }

  @override
  List<String> categoryList() {
    // var cat = ["fantasy", "sci fi", "technology", "finished", "wish list"];
    // return List<String>.from(cat);
    List<String> cats = [];

    for (_Category cat in categories) {
      cats.add(cat.name);
    }
    return cats;
  }
}

class _Category {
  String name;
  String id;

  _Category(this.name, this.id);
}
