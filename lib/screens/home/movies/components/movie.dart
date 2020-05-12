import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mao_trailer_app/services/keys.dart';

class Movie {
  final String id;
  String originalTitle;
  String overview;
  String posterPath;
  double popularity;
  String releaseDate;
  //genres: map id to name? just get id and map to tmdb api values?

  String movieUrl;
  String trailerUrl;
  Image posterImage;
  Image backgroundImage;

  Movie({this.id, Map<String,dynamic> json, this.trailerUrl}){
    this.originalTitle= json['original_title'];
    this.overview= json['overview']; 
    this.posterPath= json['poster_path'];
    this.popularity= json['popularity'];
    this.releaseDate= json['release_date'];
    this.posterImage= Image.network('https://image.tmdb.org/t/p/original${json['poster_path']}');
  }
  
    //movieUrl = "http://api.themoviedb.org/3/movie/$id/api_key=$apiKey";
    //trailerUrl ="http://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey";
    //print('movie object created. Getting other details');
    
    // trailerUrl = "https://www.youtube.com/watch?v=$youtubeKey";


}

//TODO: display movie list
  Future<List<Movie>> searchMovie(String search) async {
    //access database of movies
    await Future.delayed(Duration(seconds: 2));
    print("searched for $search");
    return null;
  }


  //build movie object from url
  Future<Movie> getMovie(String id) async {
    String url = "https://api.themoviedb.org/3/movie/$id?api_key=$tmdbKey";
    String videoUrl = 'https://api.themoviedb.org/3/movie/$id/videos?api_key=$tmdbKey&language=en-US';
    String trailerUrl;

    final httpUrl = await http.get(videoUrl);
    Map<String,dynamic> videodata = json.decode(httpUrl.body);
    if(httpUrl.statusCode == 200){
      trailerUrl = 'https://www.youtube.com/watch?v=${videodata['results']['key']}';
    }
    else{
      trailerUrl = null;
    }

    final response = await http.get(url);
    Map<String,dynamic> data = json.decode(response.body);
    if (response.statusCode == 200) {
      return Movie(json: data, id: id, trailerUrl: trailerUrl);
    }
    else {
      throw Exception('Failed to load movie');
    }
  }
