import 'package:equatable/equatable.dart';

abstract class MovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieLoadingState extends MovieState {}

class MovieLoadedState extends MovieState {
  final List<dynamic> movies;

  MovieLoadedState(this.movies);

  @override
  List<Object?> get props => [movies];
}

class MovieErrorState extends MovieState {
  final String error;

  MovieErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
