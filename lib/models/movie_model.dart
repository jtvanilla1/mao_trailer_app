import 'package:flutter/material.dart';

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
  final imageBaseUrl = 'https://image.tmdb.org/t/p/original';

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
