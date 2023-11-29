import 'package:audio_player/provider/audio_provider.dart';
import 'package:audio_player/provider/video_provider.dart';
import 'package:audio_player/view/home_page.dart';
import 'package:audio_player/view/sign_up.dart';
import 'package:audio_player/view/sign_in.dart';
import 'package:audio_player/view/song_controll.dart';
import 'package:audio_player/view/video_controll.dart';
import 'package:audio_player/view/welcome_back.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isLogin = preferences.getBool('isLogin') ?? false;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => audioprovider(),
      ),
      ChangeNotifierProvider(
        create: (context) => VideoProvider(),
      ),
    ],
    builder: (context, _) => MaterialApp(
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      initialRoute: (isLogin) ? 'welcome' : 'signin',
      routes: {
        '/': (context) => HomePage(),
        'songcontrol': (context) => SongControl(),
        'signin': (context) => signin(),
        'signup': (context) => signup(),
        'welcome': (context) => welcomeback(),
        'videodetails':(context)=> VideoDetails()
      },
    ),
  ));
}
