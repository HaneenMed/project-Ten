import 'package:flutter/material.dart';
import 'package:loginten/screens/reset_password.dart';
import 'package:loginten/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginten/src/screens/home_screen.dart';
import '../main.dart';
import '../src/styles/colors_app.dart';
import '../theme.dart';
import '../widgets/login_option.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final FirebaseAuth  _auth = FirebaseAuth.instance; 
  GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
  bool _isObscure = true;

  TextEditingController email_cont = TextEditingController();
  TextEditingController pass_cont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 70,
              ),
              Text(
                'Welcome to TEN',
                style: TextStyle(color: ColorsApp.primary700,fontSize: 35 , fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
                width: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  key: formLoginKey,
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
                          controller: email_cont,
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
                            if (value!.isEmpty) {
                              return 'Password is empty';
                            }
                          },
                          controller: pass_cont,
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
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen()));
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: kZambeziColor,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,

                  ),

                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (formLoginKey.currentState!.validate()) {
                      signIn();
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
                    "Log In",
                    style: textButton.copyWith(color: kWhiteColor),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    "Don't have an account?",
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
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Or log in with:',
                style: subTitle.copyWith(color: kBlackColor),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  googleSignIn();
                },
                child: Padding(
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignInWithCredential(credential) async {
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    debugPrint('_handleSignInWithCredential ${userCredential.user}');
    if (userCredential.user != null) {
      
    }
  }

  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) {
      } else {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _handleSignInWithCredential(credential);
      }
    } catch (e) {}
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email_cont.text.trim(),
        password: pass_cont.text.trim(),
      );
      //print(" Done");
     Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } on Exception catch (e) {
      print(" fail");
    }
  }
}
