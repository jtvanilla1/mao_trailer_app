import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String apiKey ='7e999f95b6fe62b9c76d090acb9dcc42'; //make sure its a top-level value that can be accessed by any function from .gitignore

class Movie {
  final String originalTitle;
  final String overview;
  final String id;
  final String posterPath;
  final String popularity;
  final String releaseDate;
  //genres: map id to name? just get id and map to tmdb api values?

  String movieUrl;
  //String trailerUrl;
  Future<Movie> futureMovie;
  // Map<String, dynamic> map;
  // Map<String, dynamic> trailerMap;
  // String youtubeKey;
  Image posterImage;
  Image backgroundImage;

  //constructor: build urls and movie object
  Movie({this.originalTitle, this.overview, this.id, this.posterPath, this.popularity, this.releaseDate}){
    movieUrl = "http://api.themoviedb.org/3/movie/$id/api_key=$apiKey";
    //trailerUrl ="http://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey";
    futureMovie = getMovie(movieUrl);

    // trailerMap = await getMapFromUrl(trailerUrl); //build function
    // youtubeKey = trailerMap['key'];
    // trailerUrl = "https://www.youtube.com/watch?v=$youtubeKey";

    posterImage = Image.network("https://image.tmdb.org/t/p/original$posterPath");
    
  }

  //build movie object from url
  Future<Movie> getMovie(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load movie');
    }
  }

  //build Movie object from json string
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      originalTitle: json['original_title'], 
      overview: json['overview'], 
      id: json['id'],
      posterPath: json['poster_path'],
      popularity: json['popularity'],
      releaseDate: json['release_date']
    );
  }

  
}

//TODO: display movie list
  Future<List<Movie>> searchMovie(String search) async {
    //access database of movies
    await Future.delayed(Duration(seconds: 2));
    print("searched for $search");
    return null;
  }