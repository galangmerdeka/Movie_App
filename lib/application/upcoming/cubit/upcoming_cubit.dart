import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/domain/home/upcoming_response.dart';
import 'package:movie_app/infrastructure/home/movie_repository.dart';

part 'upcoming_state.dart';
// part 'upcoming_cubit.freezed.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  UpcomingCubit() : super(UpcomingInitial());
  final MovieRepository _movieRepository = MovieRepository();

    void getMovieUpcoming() async {
    emit(UpcomingLoading());
    try {
      final _data = await _movieRepository.getListMovieUpcoming();
      _data.fold(
        (l) => emit(UpcomingError(l)),
        (r) => emit(UpcomingMovie(r)),
      );
    } catch (e) {
      emit(UpcomingError(e.toString()));
    }
  }
}
