import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_app/application/search/cubit/search_cubit.dart';
import 'package:movie_app/domain/home/movie_search_response.dart';
import 'package:movie_app/presentation/movie_detail/now_playing_detail.dart';
import 'package:movie_app/utils/constant.dart';
import 'package:movie_app/widget/loading.dart';

class SearchMovieResult extends StatefulWidget {
  const SearchMovieResult({Key? key}) : super(key: key);

  @override
  State<SearchMovieResult> createState() => _SearchMovieResultState();
}

class _SearchMovieResultState extends State<SearchMovieResult> {
  @override
  Widget build(BuildContext context) {
    final _keywordMovie = ModalRoute.of(context)!.settings.arguments;

    return BlocProvider(
      create: (context) =>
          SearchCubit()..getMovieSearchByKeyword(_keywordMovie.toString()),
      child: BlocConsumer<SearchCubit, SearchState>(builder: (context, state) {
        if (state is SearchLoading) {
          return LoadingProgress();
        } else if (state is SearchError) {
          return GetMovieSearchError();
        } else if (state is SearchMovieSuccess) {
          return SearchResult(context, state.movieSearchResponse.results!,
              _keywordMovie.toString());
        }
        return GetMovieSearchError();
      }, listener: (context, state) {
        if (state is SearchLoading) {
          print("Loading Search");
        } else if (state is SearchError) {
          print(state.errMessage);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                "Error",
                style: TextStyle(color: Colors.black),
              ),
              content: Text(
                state.errMessage,
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        } else if (state is SearchMovieSuccess) {
          print("Data Result Search : ${state.movieSearchResponse.toJson()}");
        }
      }),
    );
  }
}

Scaffold SearchResult(BuildContext context,
    List<ResultsSearch> _dataSearchResult, String keyword) {
  // final uriImage = "https://image.tmdb.org/t/p/w300";
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      title: Text(keyword),
    ),
    body: Container(
      // color: Colors.red,
      height: MediaQuery.of(context).size.height * 1,
      width: double.infinity,
      padding: EdgeInsets.only(
        bottom: 10,
        top: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Result (${_dataSearchResult.length})",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 20,
            ),
            (_dataSearchResult == null || _dataSearchResult == '')
                ? Container(
                    child: Text(
                      "No Data Found",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 1,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                    ),
                    child: GridView.count(
                      crossAxisCount: 3,
                      scrollDirection: Axis.vertical,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: List.generate(
                        _dataSearchResult.length,
                        (index) {
                          return (_dataSearchResult[index].posterPath == null)
                              ? Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(1),
                                      color: Colors.grey),
                                  width: 250,
                                  height: 600,
                                  child: Text(
                                    "No Image",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    Get.toNamed(NowPlayingDetail.routName,
                                        arguments: _dataSearchResult[index].id);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(1),
                                      image: DecorationImage(
                                          image:
                                              // CachedNetworkImage(imageUrl: uriImage+_dataSearchResult[index].posterPath!, progressIndicatorBuilder: ,),
                                              NetworkImage(
                                            Constant.uriImage300 +
                                                _dataSearchResult[index]
                                                    .posterPath!,
                                          ),
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
                  ),
          ],
        ),
      ),
    ),
  );
}

class GetMovieSearchError extends StatelessWidget {
  const GetMovieSearchError({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _keywordMovie = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
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
              onPressed: () {
                print("Refresh");
                context
                    .read<SearchCubit>()
                    .getMovieSearchByKeyword(_keywordMovie.toString());
              },
              icon: Icon(Icons.replay),
            ),
          ],
        ),
      ),
    );
  }
}
