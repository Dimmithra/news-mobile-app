import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/splash_screen/splash_screen.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/widgets/news_message.dart';
import 'dart:developer' as dev;

import 'package:rflutter_alert/rflutter_alert.dart';

class InternetConnectionChecker {
  // Singleton instance
  static final InternetConnectionChecker _instance =
      InternetConnectionChecker._internal();

  factory InternetConnectionChecker() {
    return _instance;
  }

  InternetConnectionChecker._internal();

  Future<bool> isInternetAvailable(context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      newsapp_message(context,
          messageHeader: 'Your offline',
          messageBody:
              "Your Device is Currently offline and not connected to the internet",
          // btnType: 1,
          notificationImage: const Image(
            image: AssetImage("assets/images/internet.png"),
            height: 200,
            width: 200,
          ),
          button: [
            DialogButton(
              color: kNotification,
              child: const Text(
                'Retry',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) {
                    return const SplashScreen();
                  },
                ), (route) => false);
              },
            )
          ]).show();
      dev.log('network fasle');
      return false;
      // return false; // No internet connection
    } else {
      dev.log('network true');
      return true;
      // return true; // Internet connection available
    }
  }
}
