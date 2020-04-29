import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String apiKey = '7e999f95b6fe62b9c76d090acb9dcc42';
const String apiReadAccessTokenV4auth = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZTk5OWY5NWI2ZmU2MmI5Yzc2ZDA5MGFjYjlkY2M0MiIsInN1YiI6IjVlYTc4NjIxMDcyOTFjMDAyMGVhNWM4NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bkBnd3RfAClGIDcCIuZgr_C-XUVftMUXJSyjW8NvO-k';


//API Search Full List of Movies
Future<Movie> getMovie() async {
  String searchUrl = "https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=true&page=1";
  final response = await http.get(searchUrl);
  if (response.statusCode == 200) {
    return Movie.fromJson(json.decode(response.body));
  }
  else {
    throw Exception('Failed to load movie');
  }
}

Future<Image> getImageFromPath(Movie movie) async {
    String posterPath = movie.posterPath.substring(1);
    String imageUrl = "https://image.tmdb.org/t/p/original$posterPath";
    movie.image = Image.network(imageUrl);
}

class Movie {
  final String title;
  final String movieId;
  final String releaseDate;
  final List<int> genreIds;
  final String overview;
  final String posterPath;
  final Float popularity;
  Image image;

  Movie({this.title, this.movieId, this.releaseDate, this.genreIds, this.overview, this.posterPath, this.popularity});



  factory Movie.fromJson(Map<String,dynamic> json) {
    return Movie(
      title: json['title'],
      movieId: json['id'],
      releaseDate: json['release_date'],
      genreIds: json['genre_ids'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      popularity: json['popularity'],
    );
  }

}