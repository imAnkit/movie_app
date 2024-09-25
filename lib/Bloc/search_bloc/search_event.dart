import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class PerformSearch extends SearchEvent {
  final String searchTerm;

  const PerformSearch(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}
