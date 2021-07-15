import 'package:flutter/cupertino.dart';
import 'package:movie_app2/modal/search_movies_modal.dart';
import 'package:movie_app2/service/search_movies.dart';


class MovieProvider with ChangeNotifier {
  SearchMoviesService _searchMoviesService;
  MovieProvider({@required SearchMoviesService searchMoviesService})
      : _searchMoviesService = searchMoviesService,
        super();

  List<Result> _movies;

  bool isLoading=true;

  void getMovieResult(String name) async {
    isLoading=true;
    notifyListeners();
    _movies = await _searchMoviesService.searchMovies(name);
    isLoading=false;
    notifyListeners();
  }

  List<Result> get movies => _movies;
}
