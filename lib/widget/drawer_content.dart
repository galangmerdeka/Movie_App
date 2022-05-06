import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/settings/playback_options.dart';

class DrawerContent extends StatelessWidget {
  DrawerContent({
    Key? key,
  }) : super(key: key);

  final List<Map<String, dynamic>> _settingsOption = [
    {
      'title': 'Playback Options',
      'route': PlaybackOptions.routeName,
    },
    {
      'title': 'Language',
      'route': "language",
    },
    {
      'title': 'App Information',
      'route': "information",
    },
    {
      'title': 'Help',
      'route': "help",
    },
    {
      'title': 'Contact Us',
      'route': "contact us",
    }
  ];

  // final List<Map<String, dynamic>> _others = [
  //   {
  //     'title': 'Privacy Policy (Updated)',
  //     'route': "Policy",
  //   },
  //   {
  //     'title': 'Term of User',
  //     'route': "Term",
  //   },
  //   {
  //     'title': 'Legal Notice',
  //     'route': "Legal",
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          width: double.infinity,
          height: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                // color: Colors.red,
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Settings",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: ListView.builder(
                  itemCount: _settingsOption.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        // print(_settingsOption[index]['route']);
                        Get.toNamed(_settingsOption[index]['route'],
                            arguments: _settingsOption[index]['title']);
                      },
                      title: Text(
                        _settingsOption[index]['title'],
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
