class Movie {
  final String title;
  final int id;

  Movie({this.title, this.id});
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      id: json['id'],
    );
  }
}