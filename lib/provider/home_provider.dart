import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/get_allnews_data_model.dart';
import 'package:news_app/pages/home_page/home_page.dart';
import 'package:news_app/services/common_http.dart';
import 'package:news_app/utils/url.dart';
import 'dart:developer' as dev;

import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
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
}
