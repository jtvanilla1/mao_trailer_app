import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mao_trailer_app/models/movie_model.dart';
import 'package:mao_trailer_app/services/keys.dart';

class APIService {
  
  Future<List<Movie>> searchMovie(String query) async {
    int pagenum = 1;
    final String url =
        "https://api.themoviedb.org/3/search/movie?api_key=$TMDB_KEY&language=en-US&query=$query&page=$pagenum&include_adult=false";

    List<Movie> results = List<Movie>();

    http.Response response = await http.get(url);

    Map<String, dynamic> data = json.decode(response.body);
    //get movieIds
    if (response.statusCode == 200) {
      int numResults = data['results'].length;

      for (int i = 0; i < numResults; i++) {
        int id = data['results'][i]['id'];
        results.add(await getMovie(id));
      }
    } else {
      throw Exception('Failed to load movies');
    }

    return results;
  }

  Future<List<int>> getMovieIdsList(int pageNum, String param) async {
    final String popUrl =
        "https://api.themoviedb.org/3/movie/$param?api_key=$TMDB_KEY&language=en-US&page=$pageNum";

    List<int> popularMovieIds = List<int>();

    http.Response popResponse = await http.get(popUrl);

    Map<String, dynamic> popData = json.decode(popResponse.body);
    if (popResponse.statusCode == 200) {
      int numResults = popData['results'].length;

      for (int i = 0; i < numResults; i++) {
        int id = popData['results'][i]['id'];
        popularMovieIds.add(id);
      }
    } else {
      throw Exception('Failed to load movies');
    }
    return popularMovieIds;
  }
}

final APIService apiService = APIService();
