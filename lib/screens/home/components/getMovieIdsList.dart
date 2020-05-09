import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> getPopularMovieIdsList(int pageNum) async {
  final String popUrl = "https://api.themoviedb.org/3/movie/popular?api_key=7e999f95b6fe62b9c76d090acb9dcc42&language=en-US&page=$pageNum";

  List<String> popularMovieIds = List<String>();

  http.Response popResponse = await http.get(popUrl);

  Map<String, dynamic> popData = json.decode(popResponse.body);
  if (popResponse.statusCode == 200) {
    int numResults = popData['results'].length;
    
    for (int i = 0; i < numResults; i++) {
      int id = popData['results'][i]['id'];
      popularMovieIds.add(id.toString());
    }
  } else {
    throw Exception('Failed to load movies');
  }
  return popularMovieIds;
}
