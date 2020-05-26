import 'package:flutter/material.dart';

class TvShow {
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

  TvShow({this.id, Map<String, dynamic> json, this.youtubeId}) {
    this.originalTitle = json['original_name'];
    this.overview = json['overview'];
    this.popularity = json['popularity'];
    this.releaseDate = json['first_air_date'];
    this.posterImage = Image.network('$imageBaseUrl${json['poster_path']}');
    this.genres = _generateGenresList(json);
    this.backgroundImage = Image.network('$imageBaseUrl${json['backdrop_path']}');
  }

  _generateGenresList(Map<String,dynamic> json) {
    return List.generate(json['genres'].length, (index) => json['genres'][index]['name'].toString());
  }

}
