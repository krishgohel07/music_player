import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoModel {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  List<Map<String, dynamic>> list = [
    {
      'name': "Happier",
      'videopath': "assets/video/happier.mp4",
      'imgpath': "assets/image/happier.jpeg",
      'imgpath2': "assets/image/happier.jpeg",
    },
    {
      'name': "Hasi",
      'videopath': "assets/video/hasi.mp4",
      'imgpath': "assets/image/hasi.jpeg",
      'imgpath2': "assets/image/hasi.jpeg",
    },
    {
      'name': "Tu hai Kahan",
      'videopath': "assets/video/tuhaikaha.mp4",
      'imgpath2': "assets/image/tuhaikaha.jpeg",
      'imgpath': "assets/image/tuhaikaha.jpeg",
    },
    {
      'name': "Tu Ne Jo Na Kahan",
      'videopath': "assets/video/tunejo.mp4",
      'imgpath': "assets/image/tunejo.jpeg",
      'imgpath2': "assets/image/tunejo.jpeg",
    },
  ];
}
