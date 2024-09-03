import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghost_music_app/common_widget/song_widget/all_song_row.dart';
import 'package:ghost_music_app/view/main_player/main_player_view.dart';
import 'package:ghost_music_app/view_model/view_songs_models/all_songs_view_models.dart';


class AllSongsView extends StatefulWidget {
  const AllSongsView({super.key});

  @override
  State<AllSongsView> createState() => _AllSongsViewState();
}

class _AllSongsViewState extends State<AllSongsView> {
  final allVM = Get.put(AllSongsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>ListView.builder(
        itemCount: allVM.allList.length,
        itemBuilder: (context , index){
          var sObj = allVM.allList[index];
          return AllSongRow(
               sObj: sObj,
              onPressed: (){},
              onPressedPlay: (){
                Get.to(()=> MainPlayerView());
              },
          );
        },
      )),
    );
  }
}
