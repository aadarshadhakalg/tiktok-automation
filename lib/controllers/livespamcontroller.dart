import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:process_run/shell_run.dart';

enum LiveSpamBotControllerState { started, stopped }

class LiveSpamBotController extends GetxController {
  final GetStorage _box = GetStorage();
  Shell? _shell;

  Rx<LiveSpamBotControllerState> currentState =
      Rx<LiveSpamBotControllerState>(LiveSpamBotControllerState.stopped);

  String _generateScript() {
    int _liveCommentX = _box.read('liveCommentX');
    int _liveCommentY = _box.read('liveCommentY');
    int _liveSendX = _box.read('liveSendX');
    int _liveSendY = _box.read('liveSendY');

    return '''
while :
    do
        adb shell input tap $_liveCommentX $_liveCommentY
        adb shell input keyevent 41 29 29 29 29 29
        adb shell input tap $_liveSendX $_liveSendY
        sleep 0.5
        adb shell input tap $_liveCommentX $_liveCommentY
        adb shell input keyevent 41 33 46 43
        adb shell input tap $_liveSendX $_liveSendY
        sleep 0.5
        adb shell input tap $_liveCommentX $_liveCommentY
        adb shell input keyevent 41 29 29 29
        adb shell input tap $_liveSendX $_liveSendY
        sleep 0.5
        adb shell input tap $_liveCommentX $_liveCommentY
        adb shell input keyevent 41 33 46 43 62 41 33 46 43
        adb shell input tap $_liveSendX $_liveSendY
        sleep 0.5

    done
  ''';
  }

  void start() async {
    Directory tempDir = await getTemporaryDirectory();
    File file = File('${tempDir.path}/livespam.sh');
    await file.writeAsString(_generateScript());
    _shell ??= Shell();
    _shell?.run('bash ${tempDir.path}/livespam.sh');
    currentState.value = LiveSpamBotControllerState.started;
  }

  void stop() {
    _shell?.kill();
    _shell = null;
    currentState.value = LiveSpamBotControllerState.stopped;
  }
}
