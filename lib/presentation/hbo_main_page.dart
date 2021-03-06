// import 'dart:ffi';

// import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart' as pdio;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:movie_app/application/now_playing/cubit/home_cubit.dart';
import 'package:movie_app/application/upcoming/cubit/upcoming_cubit.dart';
import 'package:movie_app/presentation/screen/now_playing.dart';
import 'package:movie_app/presentation/screen/upcoming_list.dart';
import 'package:movie_app/utils/constant.dart';
// import 'package:movie_app/widget/carousel_slider_image.dart';
// import 'package:movie_app/widget/app_bar_container.dart';
// import 'package:movie_app/widget/loading.dart';

class HboMainPage extends StatefulWidget {
  const HboMainPage({Key? key}) : super(key: key);
  static const routName = '/main-page';
  @override
  State<HboMainPage> createState() => _HboMainPageState();
}

class _HboMainPageState extends State<HboMainPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SliderImageFromAPI(),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 15,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                "Now Playing",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BlocConsumer<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeNowPlaying) {
                  return NowPlaying(
                      context, state.dataMovieNowPlaying.results!);
                } else if (state is HomeLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ErrorScreen();
              },
              listener: (context, state) {
                if (state is HomeLoading) {
                  print("Loading Movie List");
                } else if (state is HomeNowPlaying) {
                  print(state.dataMovieNowPlaying.toJson());
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 18,
              ),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Upcoming",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BlocConsumer<UpcomingCubit, UpcomingState>(
              builder: (context, state) {
                if (state is UpcomingLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is UpcomingMovie) {
                  return UpcomingList(
                      context, state.dataMovieUpcoming.results!);
                }
                return ErrorScreen();
              },
              listener: (context, state) {
                if (state is HomeLoading) {
                  print("Loading Movie Upcoming");
                } else if (state is UpcomingMovie) {
                  print(
                    "Movie Upcoming : " +
                        state.dataMovieUpcoming.toJson().toString(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  CarouselSlider SliderImageFromAPI() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(
          seconds: 5,
        ),
      ),
      items: List.generate(
        2,
        (index) {
          return GestureDetector(
            onTap: () {
              // Get.toNamed(NowPlayingDetail.routName,
              //     arguments: _dataResult[index].id);
            },
            child: Container(
              decoration: BoxDecoration(
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image:
                        // CachedNetworkImage(imageUrl: uriImage+_dataResult[index].posterPath!, progressIndicatorBuilder: ,),
                        NetworkImage(Constant.uriImage500 +
                            "/neMZH82Stu91d3iqvLdNQfqPPyl.jpg"),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.medium,
                    scale: 1.0),
              ),
              // width: 250,
              // height: 600,
            ),
          );
        },
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Something Wrong",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {
              print("Refresh");
              context.read<HomeCubit>()..getMovieNowPlaying();
              // context.read<HomeUpcomingBloc>()
              //   ..add(const HomeUpcomingEvent.getMovieUpcoming());
            },
            icon: Icon(Icons.replay),
          ),
        ],
      ),
    );
  }
}
