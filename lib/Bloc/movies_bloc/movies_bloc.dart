import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'movies_event.dart';
import 'movies_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieLoadingState()) {
    on<FetchMoviesEvent>(_onFetchMovies);
  }

  void _onFetchMovies(FetchMoviesEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoadingState());

    try {
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
      if (response.statusCode == 200) {
        final movies = json.decode(response.body);
        emit(MovieLoadedState(movies));
      } else {
        print('Failed to load movies');
        emit(MovieErrorState('Failed to load movies'));
      }
    } catch (error) {
      print('An error occurred: $error');
      emit(MovieErrorState('An error occurred: $error'));
    }
  }
}
