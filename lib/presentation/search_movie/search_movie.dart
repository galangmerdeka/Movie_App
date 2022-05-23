import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/search_movie/search_movie_result.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import 'package:movie_app/application/search/cubit/search_cubit.dart';
// import 'package:movie_app/presentation/search_movie/search_movie_result.dart';

class SearchMovie extends StatefulWidget {
  const SearchMovie({Key? key}) : super(key: key);

  @override
  State<SearchMovie> createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  final _keywordInput = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _keywordInput.addListener(() {
      setState(() {});
    });
  }

  void clearTypeSearch() {
    _keywordInput.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          TextFormField(
            controller: _keywordInput,
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (String msg) {
              Get.to(
                SearchMovieResult(),
                arguments: _keywordInput.text,
              );
            },
            decoration: InputDecoration(
              enabledBorder:
                  Theme.of(context).inputDecorationTheme.enabledBorder,
              hintStyle: Theme.of(context).textTheme.displaySmall,
              hintText: "Search Movies",
              prefixIcon: Icon(
                Icons.search_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              suffixIcon: _keywordInput.text.isNotEmpty
                  ? IconButton(
                      onPressed: () => clearTypeSearch(),
                      icon: Icon(Icons.close),
                      color: Theme.of(context).iconTheme.color,
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            // color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: Column(
              children: [
                Icon(
                  Icons.local_movies_sharp,
                  size: 120,
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Give Me Random Movie",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
            color: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          // SingleChildScrollView(
          //   child: Container(
          //     color: Colors.red,
          //     child: Center(
          //       child: Column(
          //         children: [
          //           Text(
          //             "Categories 1",
          //             style: Theme.of(context).textTheme.displayMedium,
          //           ),
          //           Text(
          //             "Categories 2",
          //             style: Theme.of(context).textTheme.displayMedium,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
