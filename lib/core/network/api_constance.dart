class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  //static const String apiKey = "4f9c6fc51df3cd9d211b2972b653e092";
  static const String nowPlayingMoviePath =
      "movie/now_playing";

  static const String popularMoviePath =
      "movie/popular";

  static const String topRatedMoviePath =
      "movie/top_rated";


  static const String upComingMoviePath =
      "movie/upcoming";

  static String castMoviePath(int id)=>
      "movie/$id/credits";

  static String detailsMoviePath(int id)=>
      "movie/$id";

  static String similarMoviePath(int id)=>
      "movie/$id/similar";

  static String addToWatchListMoviePath()=>
      "account/1153/watchlist";

  static String reviewsMoviePath(int id)=>
      "movie/$id/reviews";

  static String searchMoviePath= "search/collection";
  static String recommendationMoviePath(int id)=>
      "movie/$id/recommendations";

  static const String baseImageUrl='https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path)=>'$baseImageUrl$path';

}
