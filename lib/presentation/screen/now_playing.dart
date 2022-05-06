// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
// import 'package:movie_app/application/now_playing/cubit/home_cubit.dart';
import 'package:movie_app/domain/home/now_playing_response.dart';
// import 'package:movie_app/domain/home/upcoming_response.dart';
// import 'package:movie_app/domain/home/upcoming_response.dart';
import 'package:movie_app/presentation/movie_detail/now_playing_detail.dart';
import 'package:movie_app/utils/constant.dart';
// import 'package:movie_app/widget/loading.dart';

Container NowPlaying(BuildContext context, List<Results> _dataResult) {
  // final uriImage = "https://image.tmdb.org/t/p/w500";
  // final uriImageSmall = "https://image.tmdb.org/t/p/w154/";
  return Container(
    // color: Colors.black
    height: MediaQuery.of(context).size.height * 0.4,
    width: double.infinity,
    padding: EdgeInsets.only(
      bottom: 10,
      top: 10,
    ),
    child: GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 1,
      scrollDirection: Axis.horizontal,
      mainAxisSpacing: 50,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(
        _dataResult.length,
        (index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(NowPlayingDetail.routName,
                  arguments: _dataResult[index].id);
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image:
                        // CachedNetworkImage(imageUrl: uriImage+_dataResult[index].posterPath!, progressIndicatorBuilder: ,),
                        NetworkImage(Constant.uriImage500 + _dataResult[index].posterPath!),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.medium,
                    scale: 1.0),
              ),
              width: 250,
              height: 600,
            ),
          );
        },
      ),
    ),
  );
}

// Center GetMovieError(BuildContext context) {
//   return Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "Something Wrong",
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         IconButton(
//           color: Colors.white,
//           onPressed: () {
//             print("Refresh");
//             context.read<HomeCubit>()..getMovieNowPlaying();
//             // context.read<HomeUpcomingBloc>()
//             //   ..add(const HomeUpcomingEvent.getMovieUpcoming());
//           },
//           icon: Icon(Icons.replay),
//         ),
//       ],
//     ),
//   );
// }



// GridView UpcomingList(List<ResultsUpcoming> _dataResult, String uriImage) {
//   return GridView.count(
//     // Create a grid with 2 columns. If you change the scrollDirection to
//     // horizontal, this produces 2 rows.
//     crossAxisCount: 1,
//     scrollDirection: Axis.horizontal,
//     mainAxisSpacing: 50,
//     // Generate 100 widgets that display their index in the List.
//     children: List.generate(
//       _dataResult.length,
//       (index) {
//         return GestureDetector(
//           onTap: () {
//             Get.toNamed(NowPlayingDetail.routName,
//                 arguments: _dataResult[index].id);
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.circular(12),
//               image: DecorationImage(
//                   image:
//                       NetworkImage(uriImage + _dataResult[index].posterPath!),
//                   fit: BoxFit.cover,
//                   filterQuality: FilterQuality.medium,
//                   scale: 1.0),
//             ),
//             width: 250,
//             height: 600,
//           ),
//         );
//       },
//     ),
//   );
// }
