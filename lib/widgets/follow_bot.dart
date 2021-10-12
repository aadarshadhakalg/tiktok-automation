import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controllers/followbotcontroller.dart';

class FollowBotWidget extends StatelessWidget {
  FollowBotWidget({
    Key? key,
  }) : super(key: key);

  final FollowBotController _followBotController =
      Get.put(FollowBotController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Obx(() {
        if (_followBotController.currentState.value ==
            FollowBotControllerState.stopped) {
          return ListTile(
            title: const Text("Auto Follow"),
            subtitle: const Text(
              'Open Tiktok app and Play a Video. The App will scroll automatically and keep following unfollowed id\'s.',
            ),
            trailing: IconButton(
              onPressed: () {
                _followBotController.start();
              },
              icon: const Icon(Icons.play_arrow),
            ),
          );
        } else {
          return ListTile(
            title: const Text("Auto Follow"),
            subtitle: const Text(
              'Open Tiktok app and Play a Video. The App will scroll automatically and keep following unfollowed id\'s.',
            ),
            trailing: IconButton(
              onPressed: () {
                _followBotController.stop();
              },
              icon: const Icon(Icons.stop),
            ),
          );
        }
      }),
    );
  }
}
