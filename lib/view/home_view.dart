import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghost_music_app/common_widget/song_widget/playlist_cell.dart';
import 'package:ghost_music_app/common_widget/song_widget/song_row.dart';
import 'package:ghost_music_app/common_widget/title_section.dart';
import 'package:ghost_music_app/view_model/home_view_models.dart';

import '../common_color/color_extension.dart';
import '../common_widget/Recommended_cell.dart';
import '../common_widget/view_all_section.dart';
import '../view_model/splash_view_model.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeVn = Get.put((HomeViewModel()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
               Get.find<SplashViewMode>().openDrawer();
            },
            icon: Image.asset(
              "assets/img/menu.png",
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            )),
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xff292E4B),
                  borderRadius: BorderRadius.circular(19),
                ),
                child: TextField(
                  controller: homeVn.txtsearch.value,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 20),
                      prefixIcon: Icon(Icons.search,color: TColor.primaryText28,),
                      hintText: "Search album song",
                      hintStyle: TextStyle(
                        color: TColor.primaryText28,
                        fontSize: 13,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleSection(title: "Hot Recommended"),
            SizedBox(
              height: 175,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                itemCount: homeVn.hostRecommendedArr.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index){
                  var mObj = homeVn.hostRecommendedArr[index];
                  return RecommendedCell(mObj: mObj);
                },
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.3),
              indent: 20,endIndent: 20,
            ),
            ViewAllSection(
              title: "PlayList",
              onPressed: (){},
            ),
            SizedBox(
              height: 155,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 5),
                itemCount: homeVn.playListArr.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index){
                  var mObj = homeVn.playListArr[index];
                  return PlayListCell(mObj: mObj);
                },
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.3),
              indent: 20,endIndent: 20,
            ),
            ViewAllSection(
              title: "Recently Played",
              onPressed: (){},
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 5),
                itemCount: homeVn.recentlyPlayedArr.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context , index){
                  var sObj = homeVn.recentlyPlayedArr[index];
                  return SongsRow(
                    sObj: sObj,
                    onPressed: () {},
                    onPressedPlay: (){},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
