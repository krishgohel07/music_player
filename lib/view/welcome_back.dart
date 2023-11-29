import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class welcomeback extends StatefulWidget {
  const welcomeback({super.key});

  @override
  State<welcomeback> createState() => _welcomebackState();
}

class _welcomebackState extends State<welcomeback> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Align(
            alignment: Alignment(1.7, -0.4),
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(125),
                  color: Color(0xff1F6AC7)),
            ),
          ),
          Align(
            alignment: Alignment(2.1, -1),
            child: Container(
              height: 380,
              width: 380,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(195),
                  gradient: LinearGradient(
                      colors: [Color(0xff1F6AC7), Color(0xff3197FA)])),
            ),
          ),
          Align(
            alignment: Alignment(2, -1.6),
            child: Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(175),
                  color: Color(0xff38B4FE)),
            ),
          ),
          Align(
            alignment: Alignment(-0.5, -0.05),
            child: Container(
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.blue,
                size: 80,
              ),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 1.3),
            child: Container(
              height: 400,
              width: double.infinity,
              margin: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(fontSize: 60, color: Colors.blue),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Back",
                        style: TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
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
                          onPressed: () {
                            Navigator.of(context).pushNamed('/');
                          },
                          child: Text(
                            "Login As ",
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
            child: TextButton(
              onPressed: () async{
                SharedPreferences preference =
                    await SharedPreferences.getInstance();
                preference.setBool('isLogin',false);
                Navigator.of(context).pushNamed('signin');
              },
              child: Text(
                "Delete Account",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          )
        ],
      ),
    );
  }
}
