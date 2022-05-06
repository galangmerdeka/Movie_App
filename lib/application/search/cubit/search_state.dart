part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {
  final String errMessage;
  SearchError(this.errMessage);
}

class SearchMovieSuccess extends SearchState {
  final MovieSearchResponse movieSearchResponse;
  SearchMovieSuccess(this.movieSearchResponse);
}
