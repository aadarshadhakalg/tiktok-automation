import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:process_run/shell_run.dart';

enum LikeBotControllerState { started, stopped }

class LikeBotController extends GetxController {
  final GetStorage _box = GetStorage();
  Shell? _shell;

  Rx<LikeBotControllerState> currentState =
      Rx<LikeBotControllerState>(LikeBotControllerState.stopped);

  String _generateScript() {
    int _buttonX = _box.read('videoLikeX');
    int _buttonY = _box.read('videoLikeY');

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
    File file = File('${tempDir.path}/autolike.sh');
    await file.writeAsString(_generateScript());
    _shell ??= Shell();
    _shell?.run('bash ${tempDir.path}/autolike.sh');
    currentState.value = LikeBotControllerState.started;
  }

  void stop() {
    _shell?.kill();
    _shell = null;
    currentState.value = LikeBotControllerState.stopped;
  }
}
