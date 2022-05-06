import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
import 'package:movie_app/domain/home/movie_search_response.dart';
import 'package:movie_app/utils/constant.dart';

class MovieSearchRepository {
  // static var uri = "https://api.themoviedb.org/3/search/movie?";

  final Dio _dio = Dio();

  Future<Either<String, MovieSearchResponse>> getListMovieSearchResult(
      {required String keyword}) async {
    Response _response;
    print("enter to hit api search movie by ${keyword} keyword");
    try {
      _response = await _dio
          .get(Constant.baseUrlMovieDB + "search/movie?", queryParameters: {
        'api_key': 'c87bf1c2b8e947dc8751367b5fd8affb',
        'language': 'en-US',
        'query': keyword,
        'include_adult': false,
      });

      print("get result from api ${_response.data}");

      MovieSearchResponse _movieSearchResponse =
          MovieSearchResponse.fromJson(_response.data);
      print(_movieSearchResponse);
      return right(_movieSearchResponse);
    } on DioError catch (e) {
      String? errMessage = e.response?.data.toString();
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.sendTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.receiveTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.response:
          // TODO: Handle this case.
          errMessage = e.response?.data['status_message'];
          break;
        case DioErrorType.cancel:
          // TODO: Handle this case.
          break;
        case DioErrorType.other:
          // TODO: Handle this case.
          break;
      }
      return left(errMessage!);
    }
  }
}
