import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/user/sign_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const routeName = '/sign-up';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool? _obscureText;
  bool _checkBoxValAgreement = false;
  bool _checkBoxValUpdates = false;

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
            "Create Your HBO GO Account",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
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
                        hintStyle: Theme.of(context).textTheme.displaySmall,
                        icon: Icon(
                          Icons.mail_outline_outlined,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        hintText: "Email Address"),
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
                    decoration: InputDecoration(
                        hintStyle: Theme.of(context).textTheme.displaySmall,
                        icon: Icon(
                          Icons.person_outline_rounded,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        hintText: "Fullname"),
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
                  width: double.infinity,
                  // height: 50,
                  // color: Colors.red,
                  margin: EdgeInsets.only(
                    right: 20,
                    left: 40,
                  ),
                  alignment: Alignment.topLeft,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.white,
                            ),
                            child: Checkbox(
                                activeColor: Colors.blue,
                                value: this._checkBoxValAgreement,
                                onChanged: (value) {
                                  setState(() {
                                    this._checkBoxValAgreement = value!;
                                  });
                                }),
                          ),
                          Text(
                            "You're agree to our",
                            // softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                            onPressed: (() {}),
                            child: Text(
                              "Terms & Conditions",
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.white,
                            ),
                            child: Checkbox(
                                activeColor: Colors.blue,
                                value: this._checkBoxValUpdates,
                                onChanged: (value) {
                                  setState(() {
                                    this._checkBoxValUpdates = value!;
                                  });
                                }),
                          ),
                          Text(
                            "Send me new updates on HBO GO.",
                            // softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
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
                            10,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Get.offAndToNamed(LandingPage.routName);
                    },
                    child: Text(
                      "Submit",
                      style: Theme.of(context).textTheme.titleMedium,
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
                        "Joined Us Before? ",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(SignInPage.routName);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
