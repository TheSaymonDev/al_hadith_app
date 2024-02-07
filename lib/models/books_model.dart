class BooksModel {
  final int id;
  final String title;
  final String titleAr;
  final int numberOfHadis;
  final String abvrCode;
  final String bookName;
  final String bookDescr;
  final int colorCode;

  // Constructor to create BooksModel from a Map
  BooksModel.fromMap(Map<dynamic, dynamic> map)
      : id = map['id'],
        title = map['title'],
        titleAr = map['title_ar'],
        numberOfHadis = map['number_of_hadis'],
        abvrCode = map['abvr_code'],
        bookName = map['book_name'],
        bookDescr = map['book_descr'],
        colorCode = map['color_code'];

  // Named constructor for creating BooksModel with individual values
  BooksModel({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.numberOfHadis,
    required this.abvrCode,
    required this.bookName,
    required this.bookDescr,
    required this.colorCode,
  });
}
