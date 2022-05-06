import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/now_playing/cubit/home_cubit.dart';
import 'package:movie_app/presentation/screen/movie_detail.dart';
import 'package:movie_app/widget/loading.dart';

class NowPlayingDetail extends StatefulWidget {
  const NowPlayingDetail({Key? key}) : super(key: key);
  static const routName = '/movie-upcoming-detail';

  @override
  State<NowPlayingDetail> createState() => _NowPlayingDetailState();
}

class _NowPlayingDetailState extends State<NowPlayingDetail> {
  @override
  Widget build(BuildContext context) {
    final movie_id = ModalRoute.of(context)!.settings.arguments;
    print(movie_id);
    return BlocProvider(
      create: (context) => HomeCubit()..getMovieNowPlayingDetail(movie_id),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeUpcomingError) {
            print(state.errMessage);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(
                  state.errMessage,
                ),
              ),
            );
          } else if (state is HomeLoading) {
            print("Loading");
          } else if (state is HomeNowPlayingMovieDetail) {
            print(state.dataMovieNowPlayingDetail.toJson());
          }
        },
        builder: (context, state) {
          if (state is HomeUpcomingError) {
            return GetMovieUpcomingDetailError();
          } else if (state is HomeLoading) {
            return LoadingProgress();
          } else if (state is HomeNowPlayingMovieDetail) {
            return MovieDetail(
              state.dataMovieNowPlayingDetail,
              state.dataMovieNowPlayingDetail.genres!,
              context,
            );
          }
          return GetMovieUpcomingDetailError();
        },
      ),
    );
  }
}

class GetMovieUpcomingDetailError extends StatelessWidget {
  const GetMovieUpcomingDetailError({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final getMovieId = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Something Wrong",
            ),
            IconButton(
              onPressed: () {
                print("Refresh");
                context.read<HomeCubit>().getMovieNowPlayingDetail(getMovieId);
                // context.read<HomeUpcomingBloc>()
                //   ..add(const HomeUpcomingEvent.getMovieUpcoming());
              },
              icon: Icon(Icons.replay),
            ),
          ],
        ),
      ),
    );
  }
}
