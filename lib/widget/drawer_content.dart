// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:movie_app/application/auth/cubit/auth_cubit.dart';
import 'package:movie_app/infrastructure/auth/auth_service.dart';
// import 'package:movie_app/application/auth/cubit/auth_cubit.dart';
// import 'package:movie_app/infrastructure/auth/auth_service.dart';
import 'package:movie_app/presentation/settings/playback_options.dart';
import 'package:movie_app/presentation/user/sign_page.dart';
import 'package:provider/provider.dart';

class DrawerContent extends StatelessWidget {
  // final User firebaseUser;
  final String dataUser;
  DrawerContent({
    Key? key,
    required this.dataUser,
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

  // DrawerContent(this.firebaseUser);
  @override
  Widget build(BuildContext context) {
    // final _dataUser = ModalRoute.of(context)!.settings.arguments;
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
              Text(
                "Hello, ${dataUser}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // color: Colors.red,
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Account",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                // height: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: (dataUser != "User")
                    ? ListTile(
                        onTap: () async {
                          // print(_settingsOption[index]['route']);
                          await AuthServiceRepository().signOutUser();
                          // context.read<AuthCubit>().signOutUser();
                          Get.offAllNamed('/');
                        },
                        title: Text(
                          "Sign Out",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      )
                    : ListTile(
                        onTap: () async {
                          // print(_settingsOption[index]['route']);
                          // await AuthServiceRepository().signOutUser();
                          // context.read<AuthCubit>().signOutUser();
                          Get.toNamed(SignInPage.routName);
                        },
                        title: Text(
                          "Log In",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
              ),
              SizedBox(
                height: 20,
              ),
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
