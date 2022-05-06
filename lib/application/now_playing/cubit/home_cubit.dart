import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/home/now_playing_detail_response.dart';
import 'package:movie_app/domain/home/now_playing_response.dart';
// import 'package:movie_app/domain/home/upcoming_response.dart';
import 'package:movie_app/infrastructure/home/movie_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final MovieRepository _movieRepository = MovieRepository();
  // final ResultData _upcomingRepository = ResultData();

  void getMovieNowPlayingDetail(movie_id) async {
    emit(HomeLoading());
    try {
      final _data = await _movieRepository.getMovieUpcomingDetail(
          movie_id: movie_id.toString());
      _data.fold(
        (l) => emit(HomeUpcomingError(l)),
        (r) => emit(HomeNowPlayingMovieDetail(r)),
      );
    } catch (e) {
      emit(HomeUpcomingError(e.toString()));
    }
  }

  void getMovieNowPlaying() async {
    emit(HomeLoading());
    try {
      final _data = await _movieRepository.getListMovieNowPlaying();
      _data.fold(
        (l) => emit(HomeUpcomingError(l)),
        (r) => emit(HomeNowPlaying(r)),
      );
    } catch (e) {
      emit(HomeUpcomingError(e.toString()));
    }
  }


}
