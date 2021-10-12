import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controllers/likebotcontroller.dart';

class LikeBotWidget extends StatelessWidget {
  LikeBotWidget({
    Key? key,
  }) : super(key: key);

  final LikeBotController _likeBotController = Get.put(LikeBotController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Obx(() {
        if (_likeBotController.currentState.value ==
            LikeBotControllerState.stopped) {
          return ListTile(
            title: const Text("Auto Like"),
            subtitle: const Text(
              'Open Tiktok app and Play a Video. The App will scroll automatically and keep liking videos',
            ),
            trailing: IconButton(
              onPressed: () {
                _likeBotController.start();
              },
              icon: const Icon(Icons.play_arrow),
            ),
          );
        } else {
          return ListTile(
            title: const Text("Auto Like"),
            subtitle: const Text(
              'Open Tiktok app and Play a Video. The App will scroll automatically and keep liking videos',
            ),
            trailing: IconButton(
              onPressed: () {
                _likeBotController.stop();
              },
              icon: const Icon(Icons.stop),
            ),
          );
        }
      }),
    );
  }
}
