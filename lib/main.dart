import 'repositories/movie_api_client.dart';

void main() {
  TMDBClient.fetchMovie('ドラえもん').then((movies) => {
    movies.forEach((movie) => {
      print(movie.title)
    })
  });
}