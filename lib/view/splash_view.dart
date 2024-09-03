import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghost_music_app/view_model/splash_view_model.dart';



class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  final splashVN = Get.put(SplashViewMode());

  @override
  void initState() {
    ///put it
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
   splashVN.loadView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Center(
              child: Image.asset("assets/img/ghost.jpg", width: media.width *0.3,),
            ),
          Center(
            child: Text("ghost"),
          ),
          Center(
            child: Text("Music",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
          )
        ],
      )
    );
  }
}
