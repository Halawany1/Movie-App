import 'package:equatable/equatable.dart';

class Movie {
  final dynamic id;
  final String ?title;
  final String ?backdropPath;
  final List<int> ?genreIds;
  final double ?voteAverage;
  final String ?posterPath;
  final String ?overview;
  final String ?profilePath;
  final String ?originalName;
  final String ?author;
  final String ?content;
  final String? avatarPath;
  final String ?releaseDate;
  final String ?originalLanguage;

  const Movie({
    required this.id,
    required this.posterPath,
    required this.profilePath,
    required this.originalName,
    required this.content,
    required  this.releaseDate,
    required this.originalLanguage,
    required this.overview,
    required this.avatarPath,
    required this.author,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.voteAverage
  });




}