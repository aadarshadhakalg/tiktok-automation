import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:process_run/shell_run.dart';

enum FollowAndLikeBotControllerState { started, stopped }

class FollowAndLikeBotController extends GetxController {
  final GetStorage _box = GetStorage();
  Shell? _shell;

  Rx<FollowAndLikeBotControllerState> currentState =
      Rx<FollowAndLikeBotControllerState>(
          FollowAndLikeBotControllerState.stopped);

  String _generateScript() {
    int _followButtonX = _box.read('videoFollowX');
    int _followButtonY = _box.read('videoFollowY');
    int _likeButtonX = _box.read('videoLikeX');
    int _likeButtonY = _box.read('videoLikeY');

    return '''
while :
    do
        adb shell input tap $_followButtonX $_followButtonY
        sleep 0.5
        adb shell input tap $_likeButtonX $_likeButtonY
        adb shell input swipe 500 1000 300 300
        sleep 1
    done
  ''';
  }

  void start() async {
    Directory tempDir = await getTemporaryDirectory();
    File file = File('${tempDir.path}/autofollowandlike.sh');
    await file.writeAsString(_generateScript());
    _shell ??= Shell();
    _shell?.run('bash ${tempDir.path}/autofollowandlike.sh');
    currentState.value = FollowAndLikeBotControllerState.started;
  }

  void stop() {
    _shell?.kill();
    _shell = null;
    currentState.value = FollowAndLikeBotControllerState.stopped;
  }
}
