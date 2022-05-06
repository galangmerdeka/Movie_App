import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/now_playing/cubit/home_cubit.dart';
import 'package:movie_app/application/search/cubit/search_cubit.dart';
import 'package:movie_app/application/upcoming/cubit/upcoming_cubit.dart';
import 'package:movie_app/presentation/hbo_main_page.dart';
import 'package:movie_app/presentation/search_movie/search_movie.dart';
import 'package:movie_app/widget/app_bar_container.dart';
import 'package:movie_app/widget/drawer_content.dart';

class TabularPage extends StatefulWidget {
  const TabularPage({Key? key}) : super(key: key);

  @override
  State<TabularPage> createState() => _TabularPageState();
}

class _TabularPageState extends State<TabularPage> {
  final List<Map<String, dynamic>> _tabPages = [
    {
      'page': HboMainPage(),
      'title': 'GO HOME',
      'icon': Icon(Icons.home_filled),
    },
    {
      'page': Container(
        child: Text(
          "Page Download",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      'title': 'Downloads',
      'icon': Icon(Icons.download),
    },
    {
      'page': SearchMovie(),
      'title': 'Search',
      'icon': Icon(Icons.search_sharp),
    },
    {
      'page': Container(
        child: Text(
          "Page Live Streaming",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      'title': 'Live',
      'icon': Icon(Icons.live_tv_sharp),
    },
  ];

  int _selectedPagesIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _tabPages;
      _selectedPagesIndex = index;
      print("at pages : " + _tabPages[_selectedPagesIndex]['title']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getMovieNowPlaying(),
        ),
        BlocProvider(
          create: (context) => UpcomingCubit()..getMovieUpcoming(),
        ),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (_, state) {
          return Scaffold(
            drawer: Drawer(
              backgroundColor: Theme.of(context).colorScheme.background,
              child: DrawerContent(),
              elevation: 2.0,
            ),
            appBar: AppBar(
              title: AppBarContainer(),
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            body: _tabPages[_selectedPagesIndex]['page'],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedPagesIndex,
              onTap: _selectPage,
              items: [
                BottomNavigationBarItem(
                  icon: _tabPages[0]['icon'],
                  backgroundColor: Theme.of(context).colorScheme.background,
                  label: _tabPages[0]['title'],
                ),
                BottomNavigationBarItem(
                  icon: _tabPages[1]['icon'],
                  backgroundColor: Theme.of(context).colorScheme.background,
                  label: _tabPages[1]['title'],
                ),
                BottomNavigationBarItem(
                  icon: _tabPages[2]['icon'],
                  backgroundColor: Theme.of(context).colorScheme.background,
                  label: _tabPages[2]['title'],
                ),
                BottomNavigationBarItem(
                  icon: _tabPages[3]['icon'],
                  backgroundColor: Theme.of(context).colorScheme.background,
                  label: _tabPages[3]['title'],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


