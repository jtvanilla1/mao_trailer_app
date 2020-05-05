//TODO: DONT IMPORT ON LOAD OF EACH WIDGET -> instead load data on main app build; save json as map and pass to page

// const String apiKey = '7e999f95b6fe62b9c76d090acb9dcc42'; //make sure its a top-level value that can be accessed by any function from .gitignore
// const String apiReadAccessTokenV4auth = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZTk5OWY5NWI2ZmU2MmI5Yzc2ZDA5MGFjYjlkY2M0MiIsInN1YiI6IjVlYTc4NjIxMDcyOTFjMDAyMGVhNWM4NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bkBnd3RfAClGIDcCIuZgr_C-XUVftMUXJSyjW8NvO-k';

//Trailer details
//
//String movieJson = await get(http://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey)
//map movieMap => return map["key"] of the result map["name"] that contains the word "Official" or just the first one on the list
//youtubeKey = movieMap['key']
//String youtubeUrl = https://www.youtube.com/watch?v=$youtubeKey
//stream this url through video streaming service on the Trailer widget => Trailer(this.youtubeUrl)


//Image details
//String imageJson = await get(https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey)
//Image movieImage = Image.network(https://image.tmdb.org/t/p/original/$imageName)

//Build Movie API parser class that takes each movieId and compiles their various important details as member values, to then be rendered on the widget frontend

// Movie {
//  String movieID; //passed in from constructor
//  String movieUrl = "http://api.themoviedb.org/3/movie/$movieId/api_key=$apiKey";
//  String trailerUrl = "http://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey";
//  
//  Map<String,dynamic> map = await getMapFromMovieUrl(movieUrl); //build function
//  Map<String,dynamic> trailerMap = await getMapFromMovieUrl(trailerUrl); //build function

//  String youtubeKey = trailerMap['key'];

//  Image posterImage = Image.network("https://image.tmdb.org/t/p/original${map['poster_path']}");
//  String trailerUrl = "https://www.youtube.com/watch?v=$youtubeKey"
//}