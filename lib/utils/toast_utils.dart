// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class ToastUtils {
//   static Future<bool?> showToatMessage(
//   {
//     required String message,
//     required Color backgroundColor,
//     required Color textColor
// }
//       ){
//     return Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: backgroundColor,
//         textColor: textColor,
//         fontSize: 16.0
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void showToastMessage({
    required String message,
    required Color backgroundColor,
    required Color textColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}