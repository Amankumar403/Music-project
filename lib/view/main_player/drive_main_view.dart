import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ghost_music_app/view/main_player/play_playlist_view.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../common_color/color_extension.dart';
import '../../common_widget/song_widget/player_bottom_button.dart';

class DriveMainView extends StatefulWidget {
  const DriveMainView({super.key});

  @override
  State<DriveMainView> createState() => _DriveMainViewState();
}

class _DriveMainViewState extends State<DriveMainView> {
  var silderVal = 0.7;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(
            "assets/img/close.png",
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "Driver Mode",
          style: TextStyle(
              color: TColor.primaryText80,
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (_, ___, __) => const PlayPlayListView(),
                ),
              );
            },
            icon: Image.asset(
              "assets/img/playlist.png",
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(media.width * 0.4),
                  child: Image.asset(
                    "assets/img/player_image.png",
                    width: media.width * 0.4,
                    height: media.width * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: media.width * 0.4,
                  height: media.width * 0.4,
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                        customWidths: CustomSliderWidths(
                            trackWidth: 4, progressBarWidth: 6, shadowWidth: 8),
                        customColors: CustomSliderColors(
                            dotColor: const Color(0xffFFB1B2),
                            trackColor:
                            const Color(0xffffffff).withOpacity(0.3),
                            progressBarColors: [
                              const Color(0xffFB9967),
                              const Color(0xffE9585A)
                            ],
                            shadowColor: const Color(0xffFFB1B2),
                            shadowMaxOpacity: 0.05),
                        infoProperties: InfoProperties(
                          topLabelStyle: const TextStyle(
                              color: Colors.transparent,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          topLabelText: 'Elapsed',
                          bottomLabelStyle: const TextStyle(
                              color: Colors.transparent,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          bottomLabelText: 'time',
                          mainLabelStyle: const TextStyle(
                              color: Colors.transparent,
                              fontSize: 50.0,
                              fontWeight: FontWeight.w600),
                        ),
                        startAngle: 270,
                        angleRange: 360,
                        size: 350.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24,),
            Text("Black or White",style: TextStyle(color: TColor.primaryText80.withOpacity(0.9),fontSize: 18,fontWeight: FontWeight.w600),),
            SizedBox(height: 18,),
            Text("Michael Jackson | Album ",style: TextStyle(color: TColor.primaryText80,fontSize: 12,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Text("232/327",style: TextStyle(color: TColor.primaryText80,fontSize: 12,fontWeight: FontWeight.w600),),

            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Slider(value: silderVal, onChanged: (newVal){
                setState(() {
                  silderVal = newVal;
                });
              }),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: (){},
                  icon: Image.asset("assets/img/next_song.png"),
                ),
                SizedBox(width: 30,),
                SizedBox(
                  height: 80,width: 80,
                  child:  IconButton(
                    onPressed: (){},
                    icon: Image.asset("assets/img/play.png"),
                  ),
                ),
                SizedBox(width: 20,),
                IconButton(
                  onPressed: (){},
                  icon: Image.asset("assets/img/next_song.png"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
