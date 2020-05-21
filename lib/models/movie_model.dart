import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mao_trailer_app/services/keys.dart';

class Movie {
  final int id;
  String originalTitle;
  String overview;
  double popularity;
  String releaseDate;
  List<String> genres;

  String youtubeId;
  Image posterImage;
  Image backgroundImage;
  String imageBaseUrl = 'https://image.tmdb.org/t/p/original';

  Movie({this.id, Map<String, dynamic> json, this.youtubeId, String backdropPath}) {
    this.originalTitle = json['original_title'];
    this.overview = json['overview'];
    this.popularity = json['popularity'];
    this.releaseDate = json['release_date'];
    this.posterImage = Image.network('$imageBaseUrl${json['poster_path']}');
    this.genres = _generateGenresList(json);
    this.backgroundImage = Image.network('$imageBaseUrl$backdropPath');
  }

  _generateGenresList(Map<String,dynamic> json) {
    return List.generate(json['genres'].length, (index) => json['genres'][index]['name'].toString());
  }

}

//build movie object from url
Future<Movie> getMovie(int id) async {
  String apiBaseUrl = 'https://api.themoviedb.org/3/movie/';
  String videoUrl ='$apiBaseUrl$id/videos?api_key=$TMDB_KEY&language=en-US';
  String backdropUrl = '$apiBaseUrl$id/images?api_key=$TMDB_KEY';
  String movieUrl = "$apiBaseUrl$id?api_key=$TMDB_KEY";

  String youtubeId;
  String backdropPath;
  Map<String, dynamic> movieData;

  //get video details
  getDataFromUrl(videoUrl).then((value) => youtubeId = value['results'][0]['key']);

  //get backdrops
  getDataFromUrl(backdropUrl).then((value) => backdropPath = value['backdrops'][0]['file_path']);

  //get movie details
  movieData = await getDataFromUrl(movieUrl);
  
  return Movie(json: movieData, id: id, youtubeId: youtubeId, backdropPath: backdropPath);
}

Future<Map<String, dynamic>> getDataFromUrl(String url) async {
  http.Response response = await http.get(url);
  Map<String, dynamic> data = json.decode(response.body);
  if (response.statusCode == 200) {
    return data;
  } else {
    throw Exception(response.statusCode);
  }
}