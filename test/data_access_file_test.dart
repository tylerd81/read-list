import "package:test/test.dart";
import "package:reading_list/src/data_access_file.dart";

void main() {
  const dataFileName = "test_data.txt";
  DataAccessFile daf = new DataAccessFile(dataFileName);

  test("The data file is being opened and read", () {
    expect(daf.fileData.substring(0, 6), equals("# Book"));
  });

  test("categoryList() should return a list", () {
    var categories = daf.categoryList();
    expect(categories, isList);
  });

  test("categoryList() should return 5 categories", () {
    var categories = daf.categoryList();
    expect(categories.length, equals(5));
  });

  test("The five categories should be correct", () {
    var cat = ["fantasy", "sci fi", "technology", "finished", "wish list"];
    var categories = daf.categoryList();
    expect(categories[0], equals(cat[0]));
    expect(categories[1], equals(cat[1]));
    expect(categories[2], equals(cat[2]));
    expect(categories[3], equals(cat[3]));
    expect(categories[4], equals(cat[4]));
  });
}
