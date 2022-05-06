part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeNowPlaying extends HomeState {
  final NowPlayingResponse dataMovieNowPlaying;
  HomeNowPlaying(this.dataMovieNowPlaying);
  // final List dataMovieUpcoming;
  // HomeUpcomingSuccess(this.dataMovieUpcoming);
}

class HomeUpcomingError extends HomeState {
  final String errMessage;
  HomeUpcomingError(this.errMessage);
}

class HomeNowPlayingMovieDetail extends HomeState {
  final NowPlayingDetailResponse dataMovieNowPlayingDetail;
  HomeNowPlayingMovieDetail(this.dataMovieNowPlayingDetail);
}

