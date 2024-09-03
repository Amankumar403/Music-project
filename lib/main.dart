import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghost_music_app/view/splash_view.dart';
import 'common_color/color_extension.dart';



void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ghost_music_app",
      theme: ThemeData(
        fontFamily: "Cricular Std",
        scaffoldBackgroundColor: TColor.bg,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor:  TColor.primaryText,
          displayColor:  TColor.primaryText,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: TColor.primary,
        ),
        useMaterial3: false
      ),
      home: SplashView(),
    );
  }
}

