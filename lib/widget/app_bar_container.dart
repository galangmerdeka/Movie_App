import 'package:flutter/material.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 2,
      // height: 100,
      child: Center(
          child: Text(
        "The MovieDB",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      )),
    );
  }
}
