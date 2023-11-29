import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Align(
            alignment: Alignment(1.4, -1.5),
            child: Container(
              height: 260,
              width: 260,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(130),
                  color: Color(0xff38B4FE)),
            ),
          ),
          Align(
            alignment: Alignment(-2.1, -1.6),
            child: Container(
              height: 320,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(160),
                  color: Color(0xff3197FA)),
            ),
          ),
          Align(
            alignment: Alignment(-2.0, -1.5),
            child: Container(
              height: 280,
              width: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(140),
                  color: Color(0xff1F6AC7)),
            ),
          ),
          Align(
            alignment: Alignment(0.1, -0.7),
            child: Container(
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.blue,
                size: 60,
              ),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.3),
            child: Container(
              height: 400,
              width: double.infinity,
              margin: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  Text(
                    "Create",
                    style: TextStyle(fontSize: 60, color: Colors.blue),
                  ),
                  Text(
                    "account",
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  ),
                  TextFormField(
                    onChanged: (val) {
                      email = val;
                    },
                    decoration: InputDecoration(
                        hintText: 'E-mail',
                        hintStyle: TextStyle(color: Colors.black),
                        suffixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      password = val;
                    },
                    decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff1F6AC7), Color(0xff3197FA)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () async {
                            SharedPreferences preference =
                                await SharedPreferences.getInstance();
                            preference
                                .setStringList('login', [email, password]);
                            preference.setBool('isLogin',true);
                            Navigator.of(context).pushNamed('signin');
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have account?",
                  style: TextStyle(color: Colors.black),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('signin');
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
