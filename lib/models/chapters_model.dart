class ChapterModel {
  final int chapterId;
  final int bookId;
  final String? title;
  final int number;
  final String? hadisRange;
  final String? bookName;

  // Constructor to create ChapterModel from a Map, handling potential null values
  ChapterModel.fromMap(Map<dynamic, dynamic> map)
      : chapterId = map['chapter_id'] as int? ?? 0,
        bookId = map['book_id'] as int? ?? 0,
        title = map['title'] as String?,
        number = map['number'] as int? ?? 0,
        hadisRange = map['hadis_range'] as String?,
        bookName = map['book_name'] as String?;

  // Named constructor for creating ChapterModel with individual values
  ChapterModel({
    required this.chapterId,
    required this.bookId,
    this.title,
    required this.number,
    this.hadisRange,
    this.bookName,
  });
}
