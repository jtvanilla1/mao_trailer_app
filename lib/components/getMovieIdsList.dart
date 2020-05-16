import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mao_trailer_app/services/keys.dart';

Future<List<int>> getMovieIdsList(int pageNum, String param) async {
  final String popUrl = "https://api.themoviedb.org/3/movie/$param?api_key=$TMDB_KEY&language=en-US&page=$pageNum";

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
