import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movie_app/presentation/first_landing.dart';
// import 'package:movie_app/presentation/landing_page.dart';
import 'package:movie_app/presentation/hbo_main_page.dart';
import 'package:movie_app/presentation/movie_detail/now_playing_detail.dart';
import 'package:movie_app/presentation/user/sign_page.dart';
import 'package:movie_app/presentation/user/sign_up_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primaryColorDark: Colors.black,
        ).copyWith(
          background: Colors.black,
          secondary: Colors.grey[600],
        ),
        unselectedWidgetColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
              labelMedium: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              displaySmall: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              displayMedium: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              // bodyText2: TextStyle(
              //   color: Colors.blue,
              //   fontSize: 15,
              // ),
            ),
      ),
      title: "Movie App",
      initialRoute: '/',
      routes: {
        '/': (ctx) => FirstLanding(),
        NowPlayingDetail.routName: (ctx) => NowPlayingDetail(),
        SignInPage.routName: (ctx) => SignInPage(),
        HboMainPage.routName: (ctx) => HboMainPage(),
        SignUpPage.routeName: (ctx) => SignUpPage(),
      },
    );
  }
}
