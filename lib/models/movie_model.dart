import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mao_trailer_app/services/keys.dart';

class Movie {
  final int id;
  String originalTitle;
  String overview;
  String posterPath;
  double popularity;
  String releaseDate;
  //genres: map id to name? just get id and map to tmdb api values?

  String youtubeId;
  Image posterImage;
  Image backgroundImage = Image.asset("placeholder.png");

  Movie({this.id, Map<String, dynamic> json, this.youtubeId}) {
    this.originalTitle = json['original_title'];
    this.overview = json['overview'];
    this.posterPath = json['poster_path'];
    this.popularity = json['popularity'];
    this.releaseDate = json['release_date'];
    this.posterImage = Image.network(
        'https://image.tmdb.org/t/p/original${json['poster_path']}');
  }
}

//build movie object from url
Future<Movie> getMovie(int id) async {
  String url = "https://api.themoviedb.org/3/movie/$id?api_key=$TMDB_KEY";
  String videoUrl =
      'https://api.themoviedb.org/3/movie/$id/videos?api_key=$TMDB_KEY&language=en-US';
  String youtubeId;

  final httpUrl = await http.get(videoUrl);
  Map<String, dynamic> videodata = json.decode(httpUrl.body);
  if (httpUrl.statusCode == 200) {
    youtubeId = videodata['results'][0]['key'];
  } else {
    youtubeId = null;
  }

  final response = await http.get(url);
  Map<String, dynamic> data = json.decode(response.body);
  if (response.statusCode == 200) {
    return Movie(json: data, id: id, youtubeId: youtubeId);
  } else {
    throw Exception('Failed to load movie');
  }
}
  