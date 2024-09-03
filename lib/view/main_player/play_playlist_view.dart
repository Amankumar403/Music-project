import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../common_color/color_extension.dart';
import '../../common_widget/song_widget/all_song_row.dart';
import '../../view_model/view_songs_models/all_songs_view_models.dart';
import 'drive_main_view.dart';


class PlayPlayListView extends StatefulWidget {
  const PlayPlayListView({super.key});

  @override
  State<PlayPlayListView> createState() => _PlayPlayListViewState();
}

class _PlayPlayListViewState extends State<PlayPlayListView> {
  final allVM = Get.put(AllSongsViewModel());
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: TColor.bg,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(
            "assets/img/back.png",
            width: 25,
            height: 25,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "Playlist",
          style: TextStyle(
              color: TColor.primaryText80,
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          PopupMenuButton<int>(
              color: const Color(0xff383B49),
              offset: const Offset(-10, 15),
              elevation: 1,
              icon: Image.asset(
                "assets/img/more_btn.png",
                width: 20,
                height: 20,
                color: Colors.white,
              ),
              padding: EdgeInsets.zero,
              onSelected: (selectIndex) {},
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: 1,
                    height: 30,
                    child: Text(
                      "Social Share",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    height: 30,
                    child: Text(
                      "Playing Queue",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 3,
                    height: 30,
                    child: Text(
                      "Add to playlist...",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 4,
                    height: 30,
                    child: Text(
                      "Lyrics",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 5,
                    height: 30,
                    child: Text(
                      "Volume",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 6,
                    height: 30,
                    child: Text(
                      "Details",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 7,
                    height: 30,
                    child: Text(
                      "Sleep timer",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 8,
                    height: 30,
                    child: Text(
                      "Equaliser",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 9,
                    height: 30,
                    child: Text(
                      "Driver mode",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ];
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: (){},
                  icon: Image.asset("assets/img/next_song.png"),
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
                                trackWidth: 2, progressBarWidth: 4, shadowWidth: 6),
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
                            size: 110.0),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: (){},
                  icon: Image.asset("assets/img/next_song.png"),
                )
              ],
            ),
            SizedBox(height: 10,),

            Text("3:15|4:26",style: TextStyle(color: TColor.primaryText80,fontSize: 12,fontWeight: FontWeight.w600),),

            SizedBox(height: 24,),

            Text("Black or White",style: TextStyle(color: TColor.primaryText80.withOpacity(0.9),fontSize: 18,fontWeight: FontWeight.w600),),

            SizedBox(height: 18,),

            Text("Michael Jackson | Album ",style: TextStyle(color: TColor.primaryText80,fontSize: 12,fontWeight: FontWeight.w600),),

            Obx(()=>ListView.builder(
              padding: EdgeInsets.all(15),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: allVM.allList.length,
              itemBuilder: (context , index){
                var sObj = allVM.allList[index];
                return AllSongRow(
                   sObj: sObj,
                  onPressed: (){},
                  onPressedPlay: (){
                   // Get.to(()=> MainPlayerView());
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
