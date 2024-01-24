import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:news_app/model/get_allnews_data_model.dart';
import 'package:news_app/utils/shared_pref.dart';
import 'dart:developer' as dev;

import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  final storage = new FlutterSecureStorage();

  var homeProvider = Provider.of<HomeProvider>;
  bool loadAllNewsData = false;
  bool get getloadAllNewsData => loadAllNewsData;
  setloadAllNewsData(val) {
    loadAllNewsData = val;
    notifyListeners();
  }

  NewsPaperResponseData? newsPaperResponseData;
  NewsPaperResponseData? get getnewsPaperResponseData => newsPaperResponseData;
  setnewsPaperResponseData(val) {
    newsPaperResponseData = val;
    notifyListeners();
  }

  //DarkMode and Light Mode
  bool darkMode = false;
  bool get getDarkTheme => darkMode;

  Future<void> loadTheme() async {
    String? theme = await storage.read(key: kThemeStyle);
    dev.log(kThemeStyle);
    if (theme != null) {
      darkMode = theme == 'dark';
    }
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    darkMode = !darkMode;
    await storage.write(key: kThemeStyle, value: darkMode ? 'dark' : 'light');
    notifyListeners();
  }
}
