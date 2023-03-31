import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme.dart';

import 'login.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  GlobalKey<FormState> formForgotKey = GlobalKey<FormState>();
  bool _isObscure = true;

  TextEditingController email_cont_forgot = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
              ),
              Text(
                'Reset Password',
                style: titleText,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Please enter your email address',
                style: subTitle.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: formForgotKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is empty';
                      }
                    },
                    controller: email_cont_forgot,
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: kTextFieldColor,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                        suffixIcon: false
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
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (formForgotKey.currentState!.validate()) {
                      forgot();
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: kPrimaryColor),
                  child: Text(
                    "Send Reset Email",
                    style: textButton.copyWith(color: kWhiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future forgot() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email_cont_forgot.text.trim(),
      );
      print(" Done");
    } on Exception catch (e) {
      print("fail");
    }
  }
}
