import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/domain/home/movie_search_response.dart';
import 'package:movie_app/infrastructure/home/movie_search_repository.dart';

part 'search_state.dart';
// part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final MovieSearchRepository _movieSearchRepository = MovieSearchRepository();

  void getMovieSearchByKeyword(String keyword) async {
    emit(SearchLoading());
    try {
      print("keyword : ${keyword}");
      final _data = await _movieSearchRepository.getListMovieSearchResult(
          keyword: keyword);
      _data.fold(
        (l) => emit(SearchError(l)),
        (r) => emit(SearchMovieSuccess(r)),
      );
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
