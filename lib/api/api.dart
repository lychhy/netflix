import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:netflix/api/constants.dart';
import '../model/movie_model.dart';

class Api{
  final upComingApiUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";
  final popularApiUrl = "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
  final topRatedApiUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey";

  // Create popularApiUrl and topRatedApiUrl with refering upcomingapiurl. you can check 'get' in TMDB website and add "?api_key=$apiKey"

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(upComingApiUrl));

    if (response.statusCode == 200){
      final List<dynamic> date = json.decode(response.body)['results'];

      List<Movie> movies = date.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }
  /// todo: create getpopularMovie(), getTopRatedMovies() with refering getUpcomingMovies()
  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(popularApiUrl));

    if (response.statusCode == 200){
      final List<dynamic> date = json.decode(response.body)['results'];

      List<Movie> movies = date.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedApiUrl));

    if (response.statusCode == 200){
      final List<dynamic> date = json.decode(response.body)['results'];

      List<Movie> movies = date.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }

}