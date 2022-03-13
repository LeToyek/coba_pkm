import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  var textController = TextEditingController();
  var controllerText = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    textController.addListener(() {
      controllerText.value = textController.text;
    });
  }
}
