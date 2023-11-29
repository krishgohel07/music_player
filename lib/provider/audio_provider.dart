import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player/model/path_model.dart';
import 'package:flutter/material.dart';

class audioprovider extends ChangeNotifier {
  bool Isicon = false;
  bool isPlaying = false;
  bool muteaudio = false;
  double value = 0;
  List<Map<String, dynamic>> songlist = [
    {
      'path': 'assets/music/alone.mp3',
      'imgpath': 'assets/image/alan_walker.jpg',
      'name': 'Alone Pt.||',
      'artist': 'Alan Walker',
    },
    {
      'path': 'assets/music/blank.mp3',
      'imgpath': 'assets/image/3.jpg',
      'name': 'Blank Space',
      'artist': 'Taylor Swift',
    },
    {
      'path': 'assets/music/inthestars.mp3',
      'imgpath': 'assets/image/inthestars.jpg',
      'name': 'In The Stars',
      'artist': 'Sami Rose',
    },
    {
      'path': 'assets/music/pretty.mp3',
      'imgpath': 'assets/image/pretty.jpg',
      'name': 'Preety Girl',
      'artist': 'Meggie Landermine',
    },
    {
      'path': 'assets/music/Bewajah.mp3',
      'imgpath': 'assets/image/bewajah.jpeg',
      'name': 'Bewajah',
      'artist': 'Meggie Landermine',
    },
    {
      'path': 'assets/music/chanave.mp3',
      'imgpath': 'assets/image/chanave.jpeg',
      'name': 'Chana Ve',
      'artist': 'Meggie Landermine',
    },
    {
      'path': 'assets/music/HaiApnaDil.mp3',
      'imgpath': 'assets/image/dilaawara.jpeg',
      'name': 'Hai Apna Dil ',
      'artist': 'Meggie Landermine',
    },
    {
      'path': 'assets/music/Heeriye.mp3',
      'imgpath': 'assets/image/heeriye.jpeg',
      'name': 'Heeriye',
      'artist': 'Meggie Landermine',
    },
    {
      'path': 'assets/music/KinnaSona.mp3',
      'imgpath': 'assets/image/kinnasona.jpg',
      'name': 'Kinna Sona',
      'artist': 'Meggie Landermine',
    },
    {
      'path': 'assets/music/MereBina.mp3',
      'imgpath': 'assets/image/merebina.jpeg',
      'name': 'Mere Bina',
      'artist': 'Meggie Landermine',
    },
    {
      'path': 'assets/music/Saudebaazi.mp3',
      'imgpath': 'assets/image/saudebazi.jpeg',
      'name': 'Saudebazzi',
      'artist': 'Meggie Landermine',
    }
  ];
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  void playaudio(String path) {
    assetsAudioPlayer.open(Audio(path));
  }

  void iconfalse() {
    Isicon == false;
  }

  void stoplaying() {
    assetsAudioPlayer.dispose();
    notifyListeners();
  }

  void playorpause() {
    assetsAudioPlayer.playOrPause();
    notifyListeners();
  }

  void iconChange() {
    Isicon = !Isicon;
    notifyListeners();
  }

  void isplaying() {
    isPlaying = !isPlaying;
    notifyListeners();
  }

  void mutevolume() {
    muteaudio = !muteaudio;
    if (muteaudio == true) {
      assetsAudioPlayer.setVolume(0);
      notifyListeners();
    } else {
      assetsAudioPlayer.setVolume(100);
    }
    print("Audio ${muteaudio}");
    notifyListeners();
  }

  List<Color> colorlist = [
    Color(0xff38B4FE),
    Color(0xff3197FA),
    Color(0xff1F6AC7),
    Colors.green,
    Colors.lightGreen,
    Colors.lightGreenAccent,
    Colors.yellow,
    Colors.yellowAccent,
    Colors.redAccent,
    Colors.orange,
    Colors.orangeAccent,
    Colors.purple,
    Colors.pinkAccent,
    Colors.purpleAccent
  ];
}
