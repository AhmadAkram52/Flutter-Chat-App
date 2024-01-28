import 'dart:async';
import 'dart:io';

import 'package:a_chat/util/constants/colors.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class AHelperFunctions {
  /// Get color based on the provided value
  static Color? getColor(String value) {
    /// Define your product specific colors here and it will match the attribute colors and show specific 🟠🟡🟢🔵🟣🟤
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else {
      return null;
    }
  }

  /// Show a SnackBar with the given message and optional color
  static void showSnackBar({required String msg, Color? color}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color ?? AColors.info,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Show an alert dialog with the provided title and message
  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// Show a centered circular progress indicator
  static void showProgressBar() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  /// Navigate to a new screen with the provided widget
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  /// Truncate text to a specified maximum length
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  /// Check if the app is in dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Get the screen size
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  /// Get the screen height
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// Get the screen width
  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  /// Format DateTime to a string with the specified format
  static String getFormatDateTime(DateTime dateTime,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(dateTime);
  }

  /// Capitalize the first letter of each word in a string
  static String capitalize(String text, {bool all = true}) {
    return StringUtils.capitalize(text, allWords: all);
  }

  /// Remove duplicates from a list
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  /// Wrap a list of widgets into rows with a specified row size
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  /// Load an image from the provided URL asynchronously
  static Future<Image> loadImage({required String imageUrl}) async {
    final Completer<Image> completer = Completer();
    final Image image = Image.network(imageUrl);

    image.image.resolve(const ImageConfiguration()).addListener(
          ImageStreamListener(
            (info, synchronousCall) => completer.complete(image),
            onError: (error, stackTrace) =>
                completer.completeError('Network Error'),
          ),
        );
    return completer.future;
  }

  /// Download an image from the provided URL and get its file path
  static Future<String> downloadImageGetFilePath(
      {required String imageUrl}) async {
    http.Response response = await http.get(Uri.parse(imageUrl));
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String filePath = '${appDocDir.path}/downloaded_image.jpg';
    File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}
