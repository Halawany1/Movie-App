import 'package:wather_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({required super.id,
    required super.releaseDate,
    required super.originalName,
    required super.posterPath,
    required super.profilePath,
    required super.avatarPath,
    required super.content,
    required super.author,
    required super.originalLanguage,
    required super.overview,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.voteAverage});

  factory MovieModel.fromJson(Map<String,dynamic> json)=>
      MovieModel(id: json['id'],
          originalLanguage: json['original_language'],
          releaseDate: json['release_date'],
          content: json['content'],
          posterPath: json['poster_path'],
          originalName: json['original_name'],
          profilePath: json['content'],
          avatarPath: json['profile_path'],
          author: json['author'],
          overview: json['overview'],
          title: json['title'],
          backdropPath: json['backdrop_path']??'/xgGGinKRL8xeRkaAR9RMbtyk60y.jpg',
          genreIds:  json['genre_ids'] != null
              ? List<int>.from(json['genre_ids'].map((e) => e))
              : [],
          voteAverage:  json['vote_average']);
}
