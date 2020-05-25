import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mao_trailer_app/models/movie_model.dart';
import 'keys.dart';

class MovieService {
//build movie object from url
//TODO: state management for api calls
  Future<Movie> getMovie(int id) async {
    const apiBaseUrl = 'https://api.themoviedb.org/3/movie/';
    String videoUrl = '$apiBaseUrl$id/videos?api_key=$TMDB_KEY&language=en-US';
    String backdropUrl = '$apiBaseUrl$id/images?api_key=$TMDB_KEY';
    String movieUrl = "$apiBaseUrl$id?api_key=$TMDB_KEY";

    String youtubeId;
    String backdropPath;
    Map<String, dynamic> movieData;

    //get video details
    getDataFromUrl(videoUrl)
        .then((value) => youtubeId = value['results'][0]['key']);

    //get backdrops
    getDataFromUrl(backdropUrl)
        .then((value) => backdropPath = value['backdrops'][0]['file_path']);

    //get movie details
    movieData = await getDataFromUrl(movieUrl);

    return Movie(
        json: movieData,
        id: id,
        youtubeId: youtubeId,
        backdropPath: backdropPath);
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
}
