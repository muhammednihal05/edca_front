import 'dart:convert';
import 'dart:io';

import 'package:emotion_detection/core/global.dart';
import 'package:emotion_detection/models/response.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MlServices {
  static Future<String> getemotions(File image) async {
    try {
      // final response = http.post(Uri.parse('));

      var request =
          http.MultipartRequest('POST', Uri.parse('$BASE_URL/upload'));

      // Add the image to the request.
      var file = await image.readAsBytes();
      request.files.add(
        http.MultipartFile.fromBytes(
          'file',
          file,
          filename: image.path,
        ),
      );

      final response = await request.send();
      final body = await response.stream.transform(utf8.decoder).join();
      if (kDebugMode) {
        print(body);
      }
      return body;
    } catch (e) {
      print(e);
      throw Exception('error on API request');
    }
  }

  static Future<String> getRealtimeemotions() async {
    try {
      // final response = http.post(Uri.parse('));

      var response = await http.get(Uri.parse('$BASE_URL/emotion'));

      // Add the image to the request

      final body = response.body;
      if (kDebugMode) {
        print(body);
      }
      return body;
    } catch (e) {
      print(e);
      throw Exception('error on API request');
    }
  }
}
