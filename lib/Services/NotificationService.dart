import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationService {
  static void showSuccessMessage(String bodyMessage, [String? headerMessage]) {
    showMessage('success', bodyMessage, headerMessage);
  }

  static void showErrorMessage(String bodyMessage, [String? headerMessage]) {
    showMessage('error', bodyMessage, headerMessage);
  }

  static void showMessage(String type, String bodyMessage,
      [String? headerMessage]) {
    String message =
        headerMessage != null ? '$headerMessage\n$bodyMessage' : bodyMessage;
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: type == 'success' ? Colors.green : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
