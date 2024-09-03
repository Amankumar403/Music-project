import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghost_music_app/common_color/color_extension.dart';
import 'package:ghost_music_app/view/setting_view.dart';
import 'package:ghost_music_app/view/song/view_song/songs_view.dart';
import 'package:ghost_music_app/view_model/splash_view_model.dart';
import '../common_widget/icon_text_row.dart';
import 'home_view.dart';


class MainTabView extends StatefulWidget {
  const MainTabView({super.key});
  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    super.initState();
    controller  = TabController(length: 3, vsync: this);
    controller?.addListener((){
      setState(() {
        selectTab = controller?.index?? 0 ;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    var splashVM = Get.find<SplashViewMode>();
    return Scaffold(
      key: splashVM.scaffoldKey,
        drawer: Drawer(
            backgroundColor: const Color(0xff10121D),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 240,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/img/ghost.jpg",
                          width: media.width * 0.20,
                        ),
                        const SizedBox(height: 40,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("328\nSongs",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffC1C0C0), fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text("52\nAlbums",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffC1C0C0), fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text("87\nArtists",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffC1C0C0), fontSize: 12),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                IconTextRow(
                  title: "Themes",
                  icon: "assets/img/m_theme.png",
                  onTap: () {},
                ),
                IconTextRow(
                  title: "Ringtone Cutter",
                  icon: "assets/img/m_ring_cut.png",
                  onTap: () {},
                ),

                IconTextRow(
                  title: "Sleep Timer",
                  icon: "assets/img/m_sleep_timer.png",
                  onTap: () {},
                ),
                IconTextRow(
                  title: "Equalizer",
                  icon: "assets/img/m_eq.png",
                  onTap: () {},
                ),
                IconTextRow(
                  title: "Driver Mode",
                  icon: "assets/img/m_driver_mode.png",
                  onTap: () {},
                ),

                IconTextRow(
                  title: "Hidden Folders",
                  icon: "assets/img/m_hidden_folder.png",
                  onTap: () {},
                ),
                IconTextRow(
                  title: "Scan Media",
                  icon: "assets/img/m_scan_media.png",
                  onTap: () {},
                ),
              ],
            )),
      body: TabBarView(controller: controller,
        children: [
          const HomeView(),
          const SongsView(),
          const SettingsView()
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: TColor.bg,
          boxShadow: [
            BoxShadow(color: Colors.black38,blurRadius: 5,offset: Offset(0 , -3)),
          ]
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 1,
          child: TabBar(
            controller: controller,
            indicatorColor: Colors.transparent,
            indicatorWeight: 0.1,
            labelColor: TColor.primary,
            unselectedLabelColor: TColor.primaryText28,
            labelStyle: TextStyle(fontSize: 10),
            unselectedLabelStyle: TextStyle(fontSize: 10),
            tabs: [
              Tab(
                text: "Home", icon: Image.asset(selectTab==0?"assets/img/home_tab.png" :"assets/img/home_tab_un.png",width: 20,height: 20,),
              ),
              Tab(
                text: "Song", icon: Image.asset(selectTab==1?"assets/img/songs_tab.png" :"assets/img/songs_tab_un.png",width: 20,height: 20,),
              ),
              Tab(
                text: "Settings", icon: Image.asset(selectTab==2?"assets/img/setting_tab.png" :"assets/img/setting_tab_un.png",width: 20,height: 20,),
              )
            ],
          ),
        ),
      )
    );
  }
}
