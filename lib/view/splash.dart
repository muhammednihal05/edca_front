import 'package:emotion_detection/controller/provider/auth_provider.dart';
import 'package:emotion_detection/screen_home.dart';
import 'package:emotion_detection/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Consumer<AuthProvider>(builder: (context, value, child) {
            if (value.isLoading) {
              return CircularProgressIndicator();
            }
            if (value.response!) {
              WidgetsBinding.instance.addPostFrameCallback((_) =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScreenHome();
                  })));
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScreenLogin();
                  })));
            }
            return SizedBox();
          }),
        ),
      ),
    );
  }
}
