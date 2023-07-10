import 'package:flutter_easyloading/flutter_easyloading.dart';

class ShowDialogHelper {
  static void showLoading() {
    EasyLoading.show(status: 'Loading...');
  }

  static void showSuccess(String message) {
    EasyLoading.showSuccess(message);
  }

  static void showError(String message) {
    EasyLoading.showError(message);
  }

  static dismissLoading() {
    EasyLoading.dismiss();
  }
}