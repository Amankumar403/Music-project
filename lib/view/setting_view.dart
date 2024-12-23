import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common_color/color_extension.dart';
import '../common_widget/icon_text_row.dart';
import '../view_model/splash_view_model.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
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
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Settings",
            style: TextStyle(
                color: TColor.primaryText80,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
        )
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10),
        child: ListView(
          children: [
            SizedBox(height: 20,),
            IconTextRow(
              title: "Display",
              icon: "assets/img/s_display.png",
              onTap: () {},
            ),
            IconTextRow(
              title: "Audio",
              icon: "assets/img/s_audio.png",
              onTap: () {},
            ),
            IconTextRow(
              title: "Headset",
              icon: "assets/img/s_headset.png",
              onTap: () {},
            ),
            IconTextRow(
              title: "Lock Screen",
              icon: "assets/img/s_lock_screen.png",
              onTap: () {},
            ),
            IconTextRow(
              title: "Advanced",
              icon: "assets/img/s_menu.png",
              onTap: () {},
            ),

            IconTextRow(
              title: "Other",
              icon: "assets/img/s_other.png",
              onTap: () {},
            ),
          ],
        ),
      )
    );
  }
}
