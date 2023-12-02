// ignore_for_file: constant_identifier_names

class BaseUrl {
  static String baseUrl = 'https://api.themoviedb.org/3';
  static const String TRENDING_MOVIES_IMAGE_BASE_URL =
      'https://image.tmdb.org/t/p/w500';
  static const String API_KEY = '30481acf88ffb89f68486b89e778b6e3';
}

class ApiEndPoints {
  //Search Endpoints
  static const String Search_Movie =
      'https://api.themoviedb.org/3/search/movie?query=John wick&api_key={{api_key}}';

  //Movies Endpoints
  static const String Now_Playing_Movies = '/movie/now_playing';
  static const String Upcoming_Movies = '/movie/upcoming';
  static const String Popular_Movies = '/movie/popular';
  static const String Latest_Movies = '/movie/latest';
  static const String Top_Rated_Movies = '/movie/top_rated';
  static const String Movies_Changes = '/movie/changes';
  static const String Trending_Movies = '/trending/person/week';
  static const String Movie_Detail = '/movie/'; /*500 is movie id /movie/500*/
  static const String Movie_Videos = '/videos';
  static const String Similar_movies = '/movie/500/similar';
  static const String Movies_Recommendations = '/movie/500/recommendations';
  static const String Movie_Keywords = '/movie/500/keywords';
  static const String Movie_Reviews = '/movie/500/reviews';
  static const String Movie_Credits = '/movie/500/credits';
  static const String Movie_Images = '/images';
  static const String Movie_Alternative_Titles =
      '/movie/500/alternative_titles';

  // Genre Endpoints
  static const String Movies_Genre = '/genre/movie/list?language=en';
  static const String TV_Genre = '/genre/tv/list';

  //Discover Endpoints
  static const String Discover_Movies =
      '/discover/movie?sort_by=popularity.desc&language=en-US&page=10&vote_average.gte=5.5&with_genres=27';
  static const String Discover_TV_SHOWS =
      '/discover/tv?sort_by=popularity.desc&language=en-US&page=10&vote_average.gte=5.5&with_genres=10759';

  //TV Shows Endpoints
}

class ApiParam {
  //Common
  static const String AUTHORIZATION = "Authorization";
  static const String Bearer = "Bearer";
  // static const String ACCEPT = "Accept";
  // static const String ACCEPT_LANGUAGE = "Accept-Language";
  // static const String CONTENT_TYPE = "Content-Type";
  // static const String APPLICATION_JSON = "application/json";
  static const String apiKey = 'api_key';
  static const String page = 'page';
  static const String id = 'id';
  static const String videoId = 'videoId';


  // Response Params
  static const String DATA = "data";
  static const String STATUS_CODE = "status_code";
  static const String STATUS_MESSAGE = "status_message";

  // static const String TOKEN = "token";
  // static const String STATUS_CODE = "status_code";

  // Login and Register Api Params
  // static const String EMAIL = "email";
  // static const String PASSWORD = "password";

  // static const String FIRST_NAME = "fullname";
  // static const String LAST_NAME = "last_name";

  // static const String CONFIRM_PASSWORD = "password_confirmation";
}
