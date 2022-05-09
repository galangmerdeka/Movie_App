import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Scaffold ModalShareButton(BuildContext context) {
  final List<Map<String, dynamic>> _shareOption = [
    {
      'title': 'Whatsapp',
      'icon': IconButton(
        color: Colors.white,
        iconSize: 50.0,
        onPressed: () {
          print("Icon clicked");
        },
        icon: Icon(Icons.whatsapp),
      ),
    },
    {
      'title': 'Facebook',
      'icon': IconButton(
        color: Colors.white,
        iconSize: 50.0,
        onPressed: () {
          print("Icon clicked");
        },
        icon: Icon(Icons.facebook_outlined),
      ),
    },
    {
      'title': 'Email',
      'icon': IconButton(
        color: Colors.white,
        iconSize: 50.0,
        onPressed: () {
          print("Icon clicked");
        },
        icon: Icon(Icons.email_outlined),
      ),
    },
    {
      'title': 'Copy Link',
      'icon': IconButton(
        color: Colors.white,
        iconSize: 50.0,
        onPressed: () {
          print("Icon clicked");
        },
        icon: Icon(Icons.copy_outlined),
      ),
    },
    {
      'title': 'Others',
      'icon': IconButton(
        color: Colors.white,
        iconSize: 50.0,
        onPressed: () {
          print("Icon clicked");
        },
        icon: Icon(Icons.drag_indicator_sharp),
      ),
    },
  ];
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,
    body: Container(
      // color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
            // color: Color.fromARGB(255, 255, 255, 255),
            ),
      ),
      child: GridView.count(
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        children: List.generate(
          _shareOption.length,
          (index) {
            return Container(
              // color: Colors.red,
              height: double.infinity,
              width: 20,
              child: Column(
                children: [
                  _shareOption[index]['icon'],
                  Text(
                    _shareOption[index]['title'],
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ),
  );
}
