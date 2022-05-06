import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/domain/home/now_playing_detail_response.dart';
// import 'package:movie_app/domain/home/now_playing_detail_response.dart';
import 'package:movie_app/domain/home/now_playing_response.dart';
import 'package:movie_app/domain/home/upcoming_response.dart';

class MovieRepository {
  static var uri = "https://api.themoviedb.org/3/";
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: uri,
    responseType: ResponseType.json,
    connectTimeout: 3000,
    receiveTimeout: 3000,
    validateStatus: (code) {
      if (code == 200) {
        return true;
      }
      return false;
    },
  );
  final Dio _dio = Dio();

  Future<Either<String, NowPlayingDetailResponse>> getMovieUpcomingDetail(
      {required movie_id}) async {
    Response _response;
    print("enter to hit api movie upcoming detail id $movie_id");
    try {
      // RequestOptions? options = RequestOptions(
      //   path: uri,
      // );
      _response = await _dio.get(
        "https://api.themoviedb.org/3/movie/$movie_id?",
        queryParameters: {
          'api_key': 'c87bf1c2b8e947dc8751367b5fd8affb',
          'language': 'en-US'
        },
      );
      NowPlayingDetailResponse _movieDetailUpcoming =
          NowPlayingDetailResponse.fromJson(_response.data);
      return right(_movieDetailUpcoming);
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

  Future<Either<String, NowPlayingResponse>> getListMovieNowPlaying() async {
    Response _response;
    print("enter to hit API");
    try {
      // RequestOptions? options = RequestOptions(
      //   path: uri,
      // );
      _response = await _dio.get(
        "https://api.themoviedb.org/3/movie/now_playing?",
        queryParameters: {
          'api_key': 'c87bf1c2b8e947dc8751367b5fd8affb',
          'page': 1
        },
      );
      // final _result = _response.data;
      // List _movieListUpcoming = List.fromJson(_result);
      NowPlayingResponse _movieListNowPlaying =
          NowPlayingResponse.fromJson(_response.data);
      return right(_movieListNowPlaying);
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

  Future<Either<String, UpcomingResponse>> getListMovieUpcoming() async {
    Response _response;
    print("enter to hit API Upcoming");
    try {
      // RequestOptions? options = RequestOptions(
      //   path: uri,
      // );
      _response = await _dio.get(
        "https://api.themoviedb.org/3/movie/upcoming?",
        queryParameters: {
          'api_key': 'c87bf1c2b8e947dc8751367b5fd8affb',
          'page': 1
        },
      );
      // final _result = _response.data;
      // List _movieListUpcoming = List.fromJson(_result);
      UpcomingResponse _movieListUpcoming =
          UpcomingResponse.fromJson(_response.data);
      return right(_movieListUpcoming);
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