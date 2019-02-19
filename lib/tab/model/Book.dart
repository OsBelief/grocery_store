class Book {
  String id;
  String title;
  List<dynamic> author;
  String imageUrl;

  Book(this.id, this.title, this.author, this.imageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;  /// 在Dart中和在Java中一样, 重写==时要同时重写hashCode
}
