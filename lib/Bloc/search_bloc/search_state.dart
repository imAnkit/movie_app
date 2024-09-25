import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
    @override

  List<Object> get props => [];
}

class SearchLoading extends SearchState {
    @override

  List<Object> get props => [];
}

class SearchSuccess extends SearchState {
  final List<dynamic> movies;

  const SearchSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}

class SearchFailure extends SearchState {
  final String error;

  const SearchFailure(this.error);

  @override
  List<Object> get props => [error];
}

