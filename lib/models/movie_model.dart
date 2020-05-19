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
  //genres: map id to name? just get id and map to tmdb api values?

  String youtubeId;
  Image posterImage;
  Image backgroundImage;

  Movie({this.id, Map<String, dynamic> json, this.youtubeId, String backdropPath}) {
    this.originalTitle = json['original_title'];
    this.overview = json['overview'];
    this.popularity = json['popularity'];
    this.releaseDate = json['release_date'];
    this.posterImage = Image.network('https://image.tmdb.org/t/p/original${json['poster_path']}');
    this.genres = List.generate(json['genres'].length, (index) => json['genres'][index]['name']);
    this.backgroundImage = Image.network(backdropPath);
  }
}

//build movie object from url
Future<Movie> getMovie(int id) async {
  String url = "https://api.themoviedb.org/3/movie/$id?api_key=$TMDB_KEY";
  String videoUrl ='https://api.themoviedb.org/3/movie/$id/videos?api_key=$TMDB_KEY&language=en-US';
  String backdropUrl = 'https://api.themoviedb.org/3/movie/$id/images?api_key=$TMDB_KEY';
  String youtubeId;
  String backdropPath;

  //get video details
  http.Response response = await http.get(videoUrl);
  Map<String, dynamic> videodata = json.decode(response.body);
  if (response.statusCode == 200) {
    youtubeId = videodata['results'][0]['key'];
  } else {
    youtubeId = null;
  }

  //get backdrops
  response = await http.get(backdropUrl);
  Map<String, dynamic> backdropData= json.decode(response.body);
  if (response.statusCode == 200) {
    backdropPath = 'https://image.tmdb.org/t/p/original${backdropData['backdrops'][0]['file_path']}';
  } else {
    backdropPath = null;
  }


  //get movie details
  response = await http.get(url);
  Map<String, dynamic> data = json.decode(response.body);
  if (response.statusCode == 200) {
    return Movie(json: data, id: id, youtubeId: youtubeId, backdropPath: backdropPath);
  } else {
    throw Exception('Failed to load movie');
  }
}
  