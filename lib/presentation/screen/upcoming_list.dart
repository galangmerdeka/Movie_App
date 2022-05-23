import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/domain/home/upcoming_response.dart';
import 'package:movie_app/presentation/movie_detail/now_playing_detail.dart';
import 'package:movie_app/utils/constant.dart';

Container UpcomingList(
    BuildContext context, List<ResultsUpcoming> _dataResult) {
  // final uriImage = "https://image.tmdb.org/t/p/w500";
  return Container(
    // height: MediaQuery.of(context).size.height * 0.4,
    height: 200,
    width: double.infinity,
    padding: EdgeInsets.only(
      bottom: 10,
      top: 10,
    ),
    alignment: Alignment.centerLeft,
    child: GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 1,
      scrollDirection: Axis.horizontal,
      mainAxisSpacing: 10,
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
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image:
                        // CachedNetworkImage(imageUrl: uriImage+_dataResult[index].posterPath!, progressIndicatorBuilder: ,),
                        NetworkImage(Constant.uriImage500 +
                            _dataResult[index].posterPath!),
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
    ),
  );
}
