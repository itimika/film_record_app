class Movie {
  final String title;
  final int id;
  final String overview;
  final String posterPath;
  final String backdropPath;

  Movie({
    this.title,
    this.id,
    this.overview,
    this.posterPath,
    this.backdropPath,
  });
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      id: json['id'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }
}