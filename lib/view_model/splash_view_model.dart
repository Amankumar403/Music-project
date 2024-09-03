import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/main_tap_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SplashViewMode extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void loadView() async {
    await Future.delayed(const Duration(seconds: 2) );
    Get.to( () => const MainTabView() );
  }

  void openDrawer (){
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer (){
    scaffoldKey.currentState?.closeDrawer();
  }


}