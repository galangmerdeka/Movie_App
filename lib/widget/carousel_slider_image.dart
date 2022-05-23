import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:movie_app/domain/home/now_playing_response.dart';
import 'package:movie_app/domain/home/popular_response.dart';
import 'package:movie_app/presentation/movie_detail/now_playing_detail.dart';
import 'package:movie_app/utils/constant.dart';

CarouselSliderImage(BuildContext context, List<ResultsPopular> _dataResult) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 180.0,
      enlargeCenterPage: true,
      autoPlay: true,
      autoPlayInterval: Duration(
        seconds: 3,
      ),
    ),
    items: List.generate(
      _dataResult.length,
      (index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(NowPlayingDetail.routName,
                arguments: _dataResult[index].id);
          },
          child: Container(
            // width: 200,
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
            // width: 150,
            // height: 200,
          ),
        );
      },
    ),
  );
}
