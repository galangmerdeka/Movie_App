import 'package:flutter/material.dart';
import 'package:movie_app/domain/home/now_playing_detail_response.dart';
import 'package:movie_app/utils/constant.dart';
import 'package:movie_app/widget/app_bar_container.dart';
import 'package:readmore/readmore.dart';

Scaffold MovieDetail(NowPlayingDetailResponse _data, List<Genres> _dataGenre,
    BuildContext context) {
  // final uriImage = "https://image.tmdb.org/t/p/w500";
  // bool _pinned = true;
  // bool _snap = false;
  // bool _floating = false;
  final resultPopularity = _data.popularity! / 100;
  print(Constant.uriImage500 + _data.backdropPath!);
  return Scaffold(
    appBar: AppBar(
      title: AppBarContainer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      actions: [
        Container(
          child: IconButton(
            icon: Icon(Icons.share_sharp),
            onPressed: () {},
          ),
        ),
      ],
    ),
    backgroundColor: Theme.of(context).colorScheme.background,
    body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(Constant.uriImage500 + _data.posterPath!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              // color: Colors.red,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              width: double.infinity,
              // decoration: BoxDecoration(gradient: Gradient(colors: )),
              child: Text(
                _data.title!,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // alignment: Alignment.centerLeft,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 10,
                top: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Popularity",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rate_sharp,
                        size: 50.0,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        (resultPopularity >= 100)
                            ? "10/10"
                            : resultPopularity.toStringAsFixed(1) + "/10",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Movie Description",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    width: double.infinity,
                    // height: 200,
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: (_data.overview == null || _data.overview!.isEmpty)
                          ? Text(
                              "No Description Available",
                              softWrap: true,
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          : Container(
                              alignment: Alignment.center,
                              child: ReadMoreText(
                                _data.overview!,
                                trimLines: 3,
                                colorClickableText: Colors.blue,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'read more',
                                trimExpandedText: 'read less',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Genres",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Wrap(
                    spacing: 5,
                    children: List.generate(
                      _dataGenre.length,
                      (index) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Chip(
                            label: Text(
                              _dataGenre[index].name!,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
