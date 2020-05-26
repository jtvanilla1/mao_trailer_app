import 'package:mao_trailer_app/models/movie_model.dart';
import 'package:mao_trailer_app/services/APIService.dart';
import 'keys.dart';

class MovieService {
//build movie object from url
//TODO: state management for api calls
  Future<Movie> getMovie(int id) async {
    const apiBaseUrl = 'https://api.themoviedb.org/3/movie/';
    String videoUrl = '$apiBaseUrl$id/videos?api_key=$TMDB_KEY&language=en-US';
    String movieUrl = "$apiBaseUrl$id?api_key=$TMDB_KEY";

    String youtubeId;
    Map<String, dynamic> movieData;

    //get video details
    apiService.getDataFromUrl(videoUrl)
        .then((value) => youtubeId = value['results'][0]['key']);

    //get movie details
    movieData = await apiService.getDataFromUrl(movieUrl);

    return Movie(
      json: movieData,
      id: id,
      youtubeId: youtubeId,
    );
  }
}
