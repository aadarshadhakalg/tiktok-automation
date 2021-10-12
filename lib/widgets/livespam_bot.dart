import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controllers/livespamcontroller.dart';

class LiveSpamBotWidget extends StatelessWidget {
  LiveSpamBotWidget({
    Key? key,
  }) : super(key: key);

  final LiveSpamBotController _liveSpamBotController =
      Get.put(LiveSpamBotController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Obx(() {
        if (_liveSpamBotController.currentState.value ==
            LiveSpamBotControllerState.stopped) {
          return ListTile(
            title: const Text("Spam Live"),
            subtitle: const Text(
              'Open Live. The App will spam text. Change span text in settings.',
            ),
            trailing: IconButton(
              onPressed: () {
                _liveSpamBotController.start();
              },
              icon: const Icon(Icons.play_arrow),
            ),
          );
        } else {
          return ListTile(
            title: const Text("Spam Live"),
            subtitle: const Text(
              'Open Live. The App will spam text. Change span text in settings.',
            ),
            trailing: IconButton(
              onPressed: () {
                _liveSpamBotController.stop();
              },
              icon: const Icon(Icons.stop),
            ),
          );
        }
      }),
    );
  }
}
