import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/get_allnews_data_model.dart';
import 'package:news_app/pages/home_page/home_page.dart';
import 'package:news_app/services/common_http.dart';
import 'dart:developer' as dev;
import 'package:news_app/utils/url.dart';

class SplashProvider extends ChangeNotifier {
  bool loadSplashScreen = false;
  bool get getloadSplashScreen => loadSplashScreen;
  setloadSplashScreen(val) {
    loadSplashScreen = val;
    notifyListeners();
  }

  Future<void> splashScreenLoading(context) async {
    try {
      setloadSplashScreen(true);
      await getLoadAllData(context);
    } catch (e) {
      dev.log("$e");
    } finally {
      setloadSplashScreen(false);
    }
  }

  Future<void> getLoadAllData(context) async {
    try {
      setloadSplashScreen(true);
      final CommonHttp commonHttp = CommonHttp("");
      final response = await commonHttp.get(kApiKey);

      dev.log(response);
      NewsPaperResponseData temp =
          NewsPaperResponseData.fromJson(jsonDecode(response));
      if (temp.status == "ok") {
        setnewsPaperResponseData(temp);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ), (route) => false);
      } else {
        dev.log(temp.status);
      }
    } catch (e) {
      dev.log("$e");
    } finally {
      setloadSplashScreen(false);
    }
  }

  NewsPaperResponseData? newsPaperResponseData;
  NewsPaperResponseData? get getnewsPaperResponseData => newsPaperResponseData;
  setnewsPaperResponseData(val) {
    newsPaperResponseData = val;
    notifyListeners();
  }

  Article? article;
  Article? get getarticle => article;
  setarticle(val) {
    article = val;
    notifyListeners();
  }
}
