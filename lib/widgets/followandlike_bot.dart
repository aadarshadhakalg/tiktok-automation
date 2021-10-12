import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controllers/followandlikecontroller.dart';

class FollowAndLikeBotWidget extends StatelessWidget {
  FollowAndLikeBotWidget({
    Key? key,
  }) : super(key: key);

  final FollowAndLikeBotController _followBotController =
      Get.put(FollowAndLikeBotController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Obx(() {
        if (_followBotController.currentState.value ==
            FollowAndLikeBotControllerState.stopped) {
          return ListTile(
            title: const Text("Auto Follow and Like"),
            subtitle: const Text(
              'Open Tiktok app and Play a Video. The App will scroll automatically and keep following and liking videos and unfollowed id\'s.',
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
            title: const Text("Auto Follow and Like"),
            subtitle: const Text(
              'Open Tiktok app and Play a Video. The App will scroll automatically and keep following and liking videos and unfollowed id\'s.',
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
