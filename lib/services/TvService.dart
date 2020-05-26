import 'package:mao_trailer_app/models/tvShow_model.dart';
import 'APIService.dart';
import 'keys.dart';

class TvService {
//build movie object from url
//TODO: state management for api calls
  Future<TvShow> getTvShow(int id) async {
    const apiBaseUrl = 'https://api.themoviedb.org/3/tv';
    String videoUrl = '$apiBaseUrl$id/videos?api_key=$TMDB_KEY&language=en-US';
    String tvUrl = "$apiBaseUrl$id?api_key=$TMDB_KEY";

    String youtubeId;
    Map<String, dynamic> tvData;

    //get video details
    apiService.getDataFromUrl(videoUrl)
        .then((value) => youtubeId = value['results'][0]['key']);

    //get movie details
    tvData = await apiService.getDataFromUrl(tvUrl);

    return TvShow(
      json: tvData,
      id: id,
      youtubeId: youtubeId,
    );
  }

  
}
