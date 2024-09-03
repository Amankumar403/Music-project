import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ghost_music_app/view/song/view_song/albumditils_view.dart';
import '../../common_widget/song_widget/albumms_cell.dart';
import '../../view_model/view_songs_models/albums_view_models.dart';

class AlbumsView extends StatefulWidget {
  const AlbumsView({super.key});

  @override
  State<AlbumsView> createState() => _AlbumsViewState();
}

class _AlbumsViewState extends State<AlbumsView> {
  final albumVM = Get.put(AlbumViewModel());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    var cellWidth = (media.width - 40.0 - 20.0) * 0.5;

    return Scaffold(
      body: Obx(
            () => GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: cellWidth / (cellWidth + 45.0),
                crossAxisSpacing: 20,
                mainAxisSpacing: 10),
            itemCount: albumVM.allList.length,
            itemBuilder: (context, index) {
              var aObj = albumVM.allList[index];
              return AlbumCell(
                aObj: aObj,
                onPressed: () {
                   Get.to(() => const AlbumDetailsView());
                },
                onPressedMenu: (selectIndex) {
                  // if (kDebugMode) {
                  //   print(index);
                  // }
                },
              );
            }),
      ),
    );
  }
}
