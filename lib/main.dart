import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/splashpage.dart';

void main() async {
  await GetStorage.init();
  runApp(const TikTokBot());
}

class TikTokBot extends StatelessWidget {
  const TikTokBot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
