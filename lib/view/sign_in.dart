import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    loginlist = pref.getStringList('login')!;
  }

  List<String> loginlist = [];
  String name = '';
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
              height: 280,
              width: double.infinity,
              margin: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (val) {
                      name = val;
                    },
                    decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.black),
                        suffixIcon: Icon(
                          Icons.person,
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
                      child: InkWell(
                        onTap: () {
                          if (loginlist[0] == name &&
                              loginlist[1] == password) {
                            Navigator.of(context).pushNamed('/');
                            print("${loginlist}");
                          } else {
                            print("${loginlist}");
                            print("Name not Matched");
                          }
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have account?",
                  style: TextStyle(color: Colors.black),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('signup');
                    },
                    child: Text(
                      "Sign up",
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
