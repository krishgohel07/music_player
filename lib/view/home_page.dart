import 'package:audio_player/provider/audio_provider.dart';
import 'package:audio_player/provider/video_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/video_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexz = 0;

  @override
  Widget build(BuildContext context) {
    VideoModel videoModel = VideoModel();
    var audio = Provider.of<audioprovider>(context);
    var audiofalse = Provider.of<audioprovider>(context, listen: false);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text("Music"),
                  ),
                  Tab(
                    child: Text("Video"),
                  )
                ],
              ),
              title: Text("RAINBOW MUSIC"),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setBool('isLogin', false);
                      Navigator.of(context).pushNamed('signin');
                    },
                    icon: Icon(Icons.logout_outlined))
              ],
            ),
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: audio.songlist.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('songcontrol', arguments: index);
                    },
                    child: Container(
                      height: 90,
                      width: double.infinity,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: audio.colorlist[index]),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage(audio.songlist[index]['imgpath']),
                        ),
                        title: Text(
                          "${audio.songlist[index]['name']}",
                          style: TextStyle(fontSize: 23, color: Colors.black),
                        ),
                        subtitle: Text(
                          "${audio.songlist[index]['artist']}",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            if (audio.isPlaying == false) {
                              audiofalse.isplaying();
                              audiofalse
                                  .playaudio(audio.songlist[index]['path']);
                              Navigator.of(context)
                                  .pushNamed('songcontrol', arguments: index);
                            } else {
                              print("Error ");
                            }
                          },
                          icon: Icon(Icons.play_arrow),
                        ),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: videoModel.list.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'videodetails',
                            arguments: index);
                        Provider.of<VideoProvider>(context, listen: false)
                            .startvideo(index);
                        Provider.of<VideoProvider>(context, listen: false)
                            .chewiecontroller();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          margin: EdgeInsets.all(6),
                          height: 300,
                          width: double.infinity,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Center(
                                child: Image.asset(
                                  videoModel.list[index]['imgpath'],
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            )));
  }
}
