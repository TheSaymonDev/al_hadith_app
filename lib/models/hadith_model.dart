class HadithModel {
  final int bookId;
  final String? bookName;
  final int chapterId;
  final int sectionId;
  final String? hadithKey;
  final int hadithId;
  final String? narrator;
  final String? bn;
  final String? ar;
  final String? arDiacless;
  final String? grade;

  // Constructor to create HadithModel from a Map, handling potential null values
  HadithModel.fromMap(Map<dynamic, dynamic> map)
      : bookId = map['book_id'] as int? ?? 0,
        bookName = map['book_name'] as String?,
        chapterId = map['chapter_id'] as int? ?? 0,
        sectionId = map['section_id'] as int? ?? 0,
        hadithKey = map['hadith_key'] as String?,
        hadithId = map['hadith_id'] as int? ?? 0,
        narrator = map['narrator'] as String?,
        bn = map['bn'] as String?,
        ar = map['ar'] as String?,
        arDiacless = map['ar_diacless'] as String?,
        grade = map['grade'] as String?;

  // Named constructor for creating HadithModel with individual values
  HadithModel({
    required this.bookId,
    this.bookName,
    required this.chapterId,
    required this.sectionId,
    this.hadithKey,
    required this.hadithId,
    this.narrator,
    this.bn,
    this.ar,
    this.arDiacless,
    this.grade,
  });
}
