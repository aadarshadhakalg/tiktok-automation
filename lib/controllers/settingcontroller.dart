import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SettingController extends GetxController {
  GetStorage box = GetStorage();
  late final FormGroup form;

  @override
  void onInit() {
    super.onInit();
    form = FormGroup(
      {
        'videoLikeX': FormControl<String>(
            value: box.read('videoLikeX')?.toString(),
            validators: [Validators.number, Validators.required]),
        'videoLikeY': FormControl<String>(
            value: box.read('videoLikeY')?.toString(),
            validators: [Validators.number, Validators.required]),
        'videoFollowX': FormControl<String>(
            value: box.read('videoFollowX')?.toString(),
            validators: [Validators.number, Validators.required]),
        'videoFollowY': FormControl<String>(
            value: box.read('videoFollowY')?.toString(),
            validators: [Validators.number, Validators.required]),
        'liveSpamText': FormControl<String>(
            value: box.read('liveSpamText'),
            validators: [Validators.number, Validators.required]),
        'liveCommentX': FormControl<String>(
            value: box.read('videoFollowX')?.toString(),
            validators: [Validators.number, Validators.required]),
        'liveCommentY': FormControl<String>(
            value: box.read('videoFollowY')?.toString(),
            validators: [Validators.number, Validators.required]),
        'liveSendX': FormControl<String>(
            value: box.read('videoFollowX')?.toString(),
            validators: [Validators.number, Validators.required]),
        'liveSendY': FormControl<String>(
            value: box.read('videoFollowY')?.toString(),
            validators: [Validators.number, Validators.required]),
      },
    );
  }

  void save() async {
    try {
      await box.write(
          'videoLikeX', int.parse(form.control('videoLikeX').value));
      await box.write(
          'videoLikeY', int.parse(form.control('videoLikeY').value));
      await box.write(
          'videoFollowX', int.parse(form.control('videoFollowX').value));
      await box.write(
          'videoFollowY', int.parse(form.control('videoFollowY').value));
      await box.write('liveSendX', int.parse(form.control('liveSendX').value));
      await box.write('liveSendY', int.parse(form.control('liveSendY').value));
      await box.write(
          'liveCommentX', int.parse(form.control('liveCommentX').value));
      await box.write(
          'liveCommentY', int.parse(form.control('liveCommentY').value));
      await box.write(
        'liveSpamText',
        form.control('liveSpamText').value,
      );
      Get.snackbar("Success", 'Saved');
    } catch (e) {
      Get.snackbar("Error ", "Something Went Wrong");
    }
  }
}
