import 'package:flutter/material.dart';
import '../common_color/color_extension.dart';

class ViewAllSection extends StatelessWidget {
  final String title;
  final String buttomTitle;
  final VoidCallback onPressed;
  const ViewAllSection({super.key,required this.title, this.buttomTitle = "View All", required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(title,
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: TColor.primaryText80),),
          ),
          TextButton(
              onPressed: onPressed,
              child: Text(buttomTitle,
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: TColor.org),),
          )
        ],
      )
    );
  }
}
