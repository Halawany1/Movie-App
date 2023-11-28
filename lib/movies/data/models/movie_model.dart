import 'package:wather_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({required super.id,
    required super.releaseDate,
    required super.overview,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.voteAverage});

  factory MovieModel.fromJson(Map<String,dynamic> json)=>
      MovieModel(id: json['id'],
          releaseDate: json['release_date'],
          overview: json['overview'],
          title: json['title'],
          backdropPath: json['backdrop_path'],
          genreIds: List<int>.from(json['genre_ids'].map((e)=>e)),
          voteAverage:  json['vote_average'].toDouble());
}
