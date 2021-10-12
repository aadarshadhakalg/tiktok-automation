import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:process_run/shell_run.dart';

enum FollowBotControllerState { started, stopped }

class FollowBotController extends GetxController {
  final GetStorage _box = GetStorage();
  Shell? _shell;

  Rx<FollowBotControllerState> currentState =
      Rx<FollowBotControllerState>(FollowBotControllerState.stopped);

  String _generateScript() {
    int _buttonX = _box.read('videoFollowX');
    int _buttonY = _box.read('videoFollowY');

    return '''
while :
    do
        adb shell input tap $_buttonX $_buttonY
        adb shell input swipe 500 1000 300 300
        sleep 1
    done
  ''';
  }

  void start() async {
    Directory tempDir = await getTemporaryDirectory();
    File file = File('${tempDir.path}/autofollow.sh');
    await file.writeAsString(_generateScript());
    _shell ??= Shell();
    _shell?.run('bash ${tempDir.path}/autofollow.sh');
    currentState.value = FollowBotControllerState.started;
  }

  void stop() {
    _shell?.kill();
    _shell = null;
    currentState.value = FollowBotControllerState.stopped;
  }
}
