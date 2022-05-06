part of 'upcoming_cubit.dart';

@immutable
abstract class UpcomingState {}

class UpcomingInitial extends UpcomingState {}

class UpcomingLoading extends UpcomingState {}

class UpcomingError extends UpcomingState {
  final String errMessage;
  UpcomingError(this.errMessage);
}

class UpcomingMovie extends UpcomingState {
  final UpcomingResponse dataMovieUpcoming;
  UpcomingMovie(this.dataMovieUpcoming);
}
