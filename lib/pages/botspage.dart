import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controllers/settingcontroller.dart';
import 'package:tiktok/pages/settings_page.dart';
import 'package:tiktok/widgets/follow_bot.dart';
import 'package:tiktok/widgets/followandlike_bot.dart';
import 'package:tiktok/widgets/like_bot.dart';
import 'package:tiktok/widgets/livespam_bot.dart';

class BotPage extends StatelessWidget {
  BotPage({Key? key}) : super(key: key);

  final SettingController _settingController =
      Get.put<SettingController>(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.redAccent,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          LikeBotWidget(),
          FollowBotWidget(),
          FollowAndLikeBotWidget(),
          // const ListTile(
          //   title: Text("Auto Comment"),
          //   subtitle: Text(
          //     'Open Video. The App will start commenting.',
          //   ),
          // ),
          LiveSpamBotWidget()
        ],
      ),
    );
  }
}
