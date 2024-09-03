import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ghost_music_app/view/song/all_songs_view.dart';
import 'package:ghost_music_app/view/song/playlist_view.dart';

import '../../../common_color/color_extension.dart';
import '../../../view_model/splash_view_model.dart';
import '../albums_view.dart';
import '../artists_view.dart';
import '../genres_view.dart';

class SongsView extends StatefulWidget {
  const SongsView({super.key});

  @override
  State<SongsView> createState() => _SongsViewState();
}

class _SongsViewState extends State<SongsView> with SingleTickerProviderStateMixin{

  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller?.addListener(() {
      setState(() {
        selectTab = controller?.index??0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
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
          ),
        ),
        title: Center(
          child: Text(
            "Songs",
            style: TextStyle(
                color: TColor.primaryText80,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //Get.find<SplashViewMode>().openDrawer();
            },
            icon: Image.asset(
              "assets/img/search.png",
              width: 20,
              height: 20,
              fit: BoxFit.contain,
              color: TColor.primaryText35,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: kToolbarHeight,
            child: TabBar(
              controller: controller,
              indicatorColor: TColor.focus,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
              isScrollable: true,
              labelColor: TColor.focus,
              labelStyle: TextStyle(
                  color: TColor.focus,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              unselectedLabelColor: TColor.primaryText80,
              unselectedLabelStyle: TextStyle(
                  color: TColor.primaryText80,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              tabs: [
                Tab(text: "All Songs",),
                Tab(text: "Playlists",),
                Tab(text: "Albums",),
                Tab(text: "Artists",),
                Tab(text: "Genres",),
              ],),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                const AllSongsView(),
                const PlayListView(),
                const AlbumsView(),
                const ArtistsView(),
                const GenresView()
              ],
            ),
          )
        ],
      ),
    );
  }
}
