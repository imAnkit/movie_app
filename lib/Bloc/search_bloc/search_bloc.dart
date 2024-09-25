import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<PerformSearch>(_onPerformSearch);
  }
  Future<void> _onPerformSearch(
      PerformSearch event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final response = await http.get(Uri.parse(
          'https://api.tvmaze.com/search/shows?q=${event.searchTerm}'));
      if (response.statusCode == 200) {
        final movies = json.decode(response.body);
        emit(SearchSuccess(movies));
      } else {
        print('Failed to load movies');
        emit(const SearchFailure('Failed to load movies'));
      }
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }
}
