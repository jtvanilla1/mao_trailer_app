import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String apiKey ='7e999f95b6fe62b9c76d090acb9dcc42'; //make sure its a top-level value that can be accessed by any function from .gitignore

class Movie {
  final String id;
  String originalTitle;
  String overview;
  String posterPath;
  double popularity;
  String releaseDate;
  //genres: map id to name? just get id and map to tmdb api values?

  String movieUrl;
  //String trailerUrl;
  // String youtubeKey;
  Image posterImage;
  Image backgroundImage;

  Movie({this.id, Map<String,dynamic> json}){
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
    

    // trailerMap = await getMapFromUrl(trailerUrl); //build function
    // youtubeKey = trailerMap['key'];
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
    String url = "https://api.themoviedb.org/3/movie/$id?api_key=$apiKey";

    final response = await http.get(url);
    Map<String,dynamic> data = json.decode(response.body);
    if (response.statusCode == 200) {
      return Movie(json: data, id: id);
    }
    else {
      throw Exception('Failed to load movie');
    }
  }
