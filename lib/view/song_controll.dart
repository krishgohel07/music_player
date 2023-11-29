import 'package:audio_player/provider/audio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SongControl extends StatefulWidget {
  const SongControl({super.key});

  @override
  State<SongControl> createState() => _SongControlState();
}

class _SongControlState extends State<SongControl> {
  @override
  Widget build(BuildContext context) {
    var audio = Provider.of<audioprovider>(context);
    var audiofalse = Provider.of<audioprovider>(context, listen: false);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          audiofalse.dispose();
        },icon: Icon(Icons.arrow_back_outlined),),
        elevation: 0,
        title: Text("NOW PLAYING"),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage(audio.songlist[index]['imgpath']),
                  opacity: 5.0,
                  fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                        image: DecorationImage(
                            image: AssetImage(audio.songlist[index]['imgpath']),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${audio.songlist[index]['name']} By - ${audio.songlist[index]['artist']}",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            if(audio.isPlaying==true){
                              audiofalse.isplaying();
                              audiofalse.iconfalse();
                            }
                            audiofalse.stoplaying();
                            print("true");
                            setState(() {

                            });
                          },
                          icon: Icon(
                            Icons.stop,
                            color: Colors.white,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {
                            if(audio.isPlaying==false){
                              audiofalse.isplaying();
                              audiofalse.playaudio(audio.songlist[index]['path']);
                              print("Gohel");
                            }
                            if(audio.isPlaying==true){
                              audiofalse.iconChange();
                              audiofalse.playorpause();
                              print("Krish");
                            }
                          },
                          icon: (audio.Isicon == false)
                              ? Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 50,
                                )
                              : Icon(
                                  Icons.pause,
                                  color: Colors.white,
                                  size: 50,
                                )),
                      IconButton(
                          onPressed: () {
                            audiofalse.mutevolume();
                          },
                          icon: (audio.muteaudio == false)
                              ? Icon(
                                  Icons.headphones,
                                  size: 30,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.headset_off,
                                  size: 30,
                                  color: Colors.white,
                                ))
                    ],
                  ),
                  Slider(
                    value: audio.value,
                      min: 0,
                      onChanged: (val) {
                      }),
                ],
              ),
            ),
          )),
    );
  }
}
