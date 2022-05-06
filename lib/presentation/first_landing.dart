import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/hbo_main_page.dart';
import 'package:movie_app/presentation/tabular_page.dart';
import 'package:movie_app/presentation/user/sign_page.dart';
import 'package:movie_app/presentation/user/sign_up_page.dart';

class FirstLanding extends StatelessWidget {
  const FirstLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Container(
        //   padding: EdgeInsets.only(
        //     left: 50,
        //   ),
        //   child: Center(
        //     child: Image.asset(
        //       "assets/image/hbogo_logo.jpg",
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          Container(
            child: Center(
              child: TextButton(
                onPressed: () {
                  Get.offAll(TabularPage());
                },
                child: Text(
                  "Browse",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            // color: Colors.red,
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage("assets/image/pngwing.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue.shade700),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(SignUpPage.routeName);
                    },
                    child: Text(
                      "Create an Account",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue.shade700),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(SignInPage.routName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign In",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // color: Colors.red,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  // alignment: Alignment.centerRight,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Going beyond the screen",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
