import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:movie_app/presentation/landing_page.dart';
import 'package:movie_app/presentation/hbo_main_page.dart';
import 'package:movie_app/presentation/user/sign_up_page.dart';
import 'package:movie_app/widget/app_bar_container.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static const routName = '/sign-in';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool? _obscureText;

  @override
  void initState() {
    // TODO: implement initState
    _obscureText = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text(
            "Sign In",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  // color: Colors.red,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.displaySmall,
                    decoration: InputDecoration(
                        enabledBorder: Theme.of(context)
                            .inputDecorationTheme
                            .enabledBorder,
                        hintStyle: Theme.of(context).textTheme.displaySmall,
                        icon: Icon(
                          Icons.mail_outline_outlined,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        hintText: "Email"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // color: Colors.red,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.displaySmall,
                    obscureText: _obscureText!,
                    decoration: InputDecoration(
                        enabledBorder: Theme.of(context)
                            .inputDecorationTheme
                            .enabledBorder,
                        hintStyle: Theme.of(context).textTheme.displaySmall,
                        icon: Icon(
                          Icons.lock_open_outlined,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        suffixIcon: InkWell(
                          child: (_obscureText == false)
                              ? Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Theme.of(context).iconTheme.color,
                                )
                              : Icon(
                                  Icons.visibility_off_outlined,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                          onTap: () {
                            if (_obscureText == false) {
                              _obscureText = true;
                            } else {
                              _obscureText = false;
                            }
                            setState(() {});
                          },
                        ),
                        hintText: "Password"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "FORGOT PASSWORD ?",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
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
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.mail_lock_sharp),
                        // SizedBox(
                        //   width: 30,
                        // ),
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
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "As we have recently updated our system, you will require an HBO GO email and password to sign in moving forward. If you have signed in to HBO GO with any operators prior to 1 january 2020.",
                          style: Theme.of(context).textTheme.displaySmall,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Any questions? Visit FAQ for more information.",
                          style: Theme.of(context).textTheme.displaySmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
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
