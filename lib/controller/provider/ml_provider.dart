import 'dart:io';

import 'package:emotion_detection/controller/services/ml_services.dart';
import 'package:flutter/material.dart';

class MlProvider extends ChangeNotifier {
  bool isLoading = false;
  String response = '';
  String error = '';
  Future<void> getMlResponse(File file, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      response = await MlServices.getemotions(file);
    } on HttpException catch (e) {
      error = e.message;
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    showEmotionDialogue(context);
  }

  Future<void> getMlRealTimeResonse(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      response = await MlServices.getRealtimeemotions();
    } on HttpException catch (e) {
      error = e.message;
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    showEmotionDialogue(context);
    // Future.delayed(Duration(seconds: 5));

    // Navigator.of(context).pop();
  }

  Future<dynamic> showEmotionDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Emotion'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  if (response == '"sad"') ...[
                    const ListTile(
                      leading: Icon(Icons.sentiment_satisfied),
                      title: Text(
                        'Sad',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ] else if (response == '"angry"') ...[
                    ListTile(
                      leading: Icon(Icons.sentiment_very_dissatisfied),
                      title: Text('Anger'),
                    ),
                  ] else ...[
                    ListTile(
                      leading: Icon(Icons.error),
                      title: Text(error),
                    ),
                  ]
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Do something when the user clicks on the OK button.
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }
}
