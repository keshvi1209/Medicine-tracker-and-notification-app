import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HelperFunctions {

  static void showAlert(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: ()=> Navigator.of(context).pop(),
                  child: const Text('OK')
              )
            ],
          );
        }
    );
  }

  static void navigateToScreen(BuildContext context, dynamic screen){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => screen)
    );
  }

  static void shiftToScreen(BuildContext context, dynamic screen){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => screen)
    );
  }


  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  // static Size screenSize() {
  //   return MediaQuery.of(Get.context!).size;
  // }
  //
  // static double screenHeight() {
  //   return MediaQuery.of(Get.context!).size.height;
  // }
  //
  // static double screenWidth() {
  //   return MediaQuery.of(Get.context!).size.width;
  // }

  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  String getUppercaseTextBeforeAt(String email) {
    String beforeAt = email.split('@')[0];
    return beforeAt.toUpperCase();
  }


  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];

    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(i, i + rowSize > widgets.length ? widgets.length - i : rowSize);
      wrappedList.add(Row(children: rowChildren));
    }

    return wrappedList;
  }


}