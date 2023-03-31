import 'package:flutter/material.dart';

import '../src/styles/colors_app.dart';
import '../theme.dart';
import '../widgets/login_option.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formSignKey = GlobalKey<FormState>();
  bool _isObscure = true;

  TextEditingController email_cont_sign = TextEditingController();
  TextEditingController pass_cont_sign = TextEditingController();
  TextEditingController Repass_cont_sign = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 70,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Create Account',

                style: TextStyle(color: ColorsApp.primary700,fontSize: 35 , fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Form(
                  key: formSignKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ('email is empty');
                            }
                          },
                          controller: email_cont_sign,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: kTextFieldColor,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          obscureText: _isObscure,
                          validator: (value) {
                            RegExp regExp = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return 'Password is empty';
                            }
                            if (!regExp.hasMatch(value)) {
                              return 'Password less more 6 character';
                            }
                          },
                          controller: pass_cont_sign,
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                color: kTextFieldColor,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor),
                              ),
                              suffixIcon: true
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                      icon: _isObscure
                                          ? Icon(
                                              Icons.visibility_off,
                                              color: kTextFieldColor,
                                            )
                                          : Icon(
                                              Icons.visibility,
                                              color: kPrimaryColor,
                                            ),
                                    )
                                  : null),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          obscureText: _isObscure,
                          validator: (value) {
                            RegExp regExp = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return 'Confirm Password is empty';
                            } else if (!regExp.hasMatch(value)) {
                              return 'Password less more 6 character';
                            } else if (pass_cont_sign.text !=
                                Repass_cont_sign.text) {
                              return 'Password not match Confirm Password';
                            }
                          },
                          controller: Repass_cont_sign,
                          decoration: InputDecoration(
                              labelText: "Confirm Password",
                              labelStyle: TextStyle(
                                color: kTextFieldColor,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor),
                              ),
                              suffixIcon: true
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                      icon: true
                                          ? Icon(
                                              Icons.visibility_off,
                                              color: kTextFieldColor,
                                            )
                                          : Icon(
                                              Icons.visibility,
                                              color: kPrimaryColor,
                                            ),
                                    )
                                  : null),
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (formSignKey.currentState!.validate()) {
                      signUp();
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorsApp.primary700),
                  child: Text(
                    "Sign Up",
                    style: textButton.copyWith(color: kWhiteColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Or sign up with:',
                style: subTitle.copyWith(color: kBlackColor),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Container(
                height: mediaQuery.height * 0.06,
                width: mediaQuery.width * 0.36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //border: Border.all(color: Colors.grey[300])
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 40,
                      width: 40,
                      image: AssetImage('images/google.png'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Google"),
                  ],
                ),
              ),
            ),
            SizedBox(
             height: 30,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Row(
                children: [
                  Text(
                    'Already a member?',
                    style: subTitle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInScreen()));
                    },
                    child: Text(
                      'Log In',
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email_cont_sign.text.trim(),
        password: pass_cont_sign.text.trim(),
      );
      print(" Done");
    } on Exception catch (e) {
      print("fail");
    }
  }
}
