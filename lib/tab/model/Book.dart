/// Json手动序列化/反序列化
class Book {
  String id;
  String title;
  List<String> author;
  String imageUrl;
  Rating rating;
  List<Tag> tags;

  Book(
      {this.id,
      this.title,
      this.author,
      this.imageUrl,
      this.rating,
      this.tags});

  factory Book.fromJson(Map<String, dynamic> parsedJson) {
    var tags = parsedJson["tags"] as List;
    return Book(
        id: parsedJson["id"],
        title: parsedJson["title"],
        author: List<String>.from(parsedJson["author"]),
        imageUrl: parsedJson["image"],
        rating: Rating.fromJson(parsedJson["rating"]),
        tags: tags.map((i) => Tag.fromJson(i)).toList());
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": imageUrl,
        "rating": rating,
        "author": author,
        "tags": tags
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  /// 在Dart中和在Java中一样, 重写==时要同时重写hashCode
}

class Rating {
  int max;
  int numRaters;
  String average;
  int min;

  Rating({this.max, this.numRaters, this.average, this.min});

  factory Rating.fromJson(Map<String, dynamic> parsedJson) {
    return Rating(
        max: parsedJson["max"],
        numRaters: parsedJson["numRaters"],
        average: parsedJson["average"],
        min: parsedJson["min"]);
  }

  Map<String, dynamic> toJson() =>
      {"max": max, "numRaters": numRaters, "average": average, "min": min};
}

class Tag {
  int count;
  String name;
  String title;

  Tag({this.count, this.name, this.title});

  factory Tag.fromJson(Map<String, dynamic> parseJson) {
    return Tag(
        count: parseJson["count"],
        name: parseJson["name"],
        title: parseJson["title"]);
  }

  Map<String, dynamic> toJson() =>
      {"count": count, "name": name, "title": title};
}
