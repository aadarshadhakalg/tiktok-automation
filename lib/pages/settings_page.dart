import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:tiktok/controllers/settingcontroller.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SettingController _settingController = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.redAccent,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.redAccent,
          ),
        ),
      ),
      body: ReactiveForm(
        formGroup: _settingController.form,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(child: Text('Video Like Position')),
                  SizedBox(
                    width: 100,
                    child: ReactiveTextField(
                      formControlName: 'videoLikeX',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: ReactiveTextField(
                      formControlName: 'videoLikeY',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(child: Text('Video Follow Position')),
                  SizedBox(
                    width: 100,
                    child: ReactiveTextField(
                      formControlName: 'videoFollowX',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: ReactiveTextField(
                      formControlName: 'videoFollowY',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(child: Text('Live Comment Box Position')),
                  SizedBox(
                    width: 100,
                    child: ReactiveTextField(
                      formControlName: 'liveCommentX',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: ReactiveTextField(
                      formControlName: 'liveCommentY',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(child: Text('Live Send Button Position')),
                  SizedBox(
                    width: 100,
                    child: ReactiveTextField(
                      formControlName: 'liveSendX',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: ReactiveTextField(
                      formControlName: 'liveSendY',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(child: Text('Following Button Distance')),
                  SizedBox(
                    width: 300,
                    child: ReactiveTextField(
                      formControlName: 'liveSpamText',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ReactiveFormConsumer(
              builder: (context, form, child) {
                return ElevatedButton(
                  onPressed: () {
                    _settingController.form.valid
                        ? _settingController.save()
                        : null;
                  },
                  child: const Text('Save  Form'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
