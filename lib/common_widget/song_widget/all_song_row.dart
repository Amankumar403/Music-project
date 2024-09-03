import 'package:flutter/material.dart';

import '../../common_color/color_extension.dart';


class AllSongRow extends StatelessWidget {
  final Map sObj;
  final bool isWeb;
  final VoidCallback onPressedPlay;
  final VoidCallback onPressed;

  const AllSongRow({super.key,  required this.onPressed, required this.onPressedPlay, this.isWeb = false, required this.sObj,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20,),
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset("assets/img/ghost.jpg",
                    // sObj["images"],
                    width: 50,height: 50,fit: BoxFit.cover,),
                  // child: isWeb ?
                  // CachedNetworkImage(
                  //   imageUrl: sObj["image"].toString(),
                  //   fit: BoxFit.cover,
                  //   errorWidget: (context, url, error) {
                  //     return Image.asset(
                  //       "assets/img/cover.jpg",
                  //       fit: BoxFit.cover,
                  //     );
                  //   },
                  //   placeholder: (context, url) {
                  //     return Image.asset(
                  //       "assets/img/cover.jpg",
                  //       fit: BoxFit.cover,
                  //     );
                  //   },
                  //   width: 50,
                  //   height: 50,
                  // )
                  //     : Image.asset(
                  //   sObj["image"],
                  //   width: 50,
                  //   height: 50,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: TColor.primaryText28),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: TColor.bg,
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "name",
                      //sObj["name"],
                      maxLines: 1,
                      style: TextStyle(
                          color: TColor.primaryText60,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "dis",
                      //sObj["artists"],
                      maxLines: 1,
                      style: TextStyle(color: TColor.primaryText28, fontSize: 10),
                    )
                  ],
                )),
            IconButton(
              onPressed: onPressedPlay,
              icon: Image.asset(
                "assets/img/play_btn.png",
                width: 25,
                height: 25,
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.white.withOpacity(0.07),
          indent: 50,
        ),
      ],
    );
  }
}