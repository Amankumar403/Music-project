import 'package:flutter/material.dart';

import '../../common_color/color_extension.dart';


class PlayListCell extends StatelessWidget {
  final Map mObj;
  const PlayListCell({super.key, required this.mObj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.asset(mObj["image"],
              width: double.maxFinite,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8,),
          Text(mObj["name"],
            maxLines: 1,
            style: TextStyle(color: TColor.primaryText80,fontWeight: FontWeight.w600,fontSize: 15),
          ),
          Text(mObj["artists"],
            maxLines: 1,
            style: TextStyle(color: TColor.secondaryText,fontWeight: FontWeight.w700,fontSize: 12),
          )
        ],
      ),
    );
  }
}
