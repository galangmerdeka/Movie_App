part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeNowPlaying extends HomeState {
  final NowPlayingResponse dataMovieNowPlaying;
  HomeNowPlaying(this.dataMovieNowPlaying);
}

class HomePopular extends HomeState {
  final PopularResponse dataMoviePopular;
  HomePopular(this.dataMoviePopular);
}

class HomeUpcomingError extends HomeState {
  final String errMessage;
  HomeUpcomingError(this.errMessage);
}

class HomeNowPlayingMovieDetail extends HomeState {
  final NowPlayingDetailResponse dataMovieNowPlayingDetail;
  HomeNowPlayingMovieDetail(this.dataMovieNowPlayingDetail);
}
