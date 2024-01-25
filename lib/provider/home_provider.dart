import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:news_app/model/local_news_model.dart';
import 'package:news_app/utils/shared_pref.dart';
import 'package:news_app/widgets/news_message.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:developer' as dev;
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  final storage = new FlutterSecureStorage();

  TextEditingController searchNewsController = TextEditingController();
  TextEditingController get getsearchNewsController => searchNewsController;

  var homeProvider = Provider.of<HomeProvider>;
  bool loadAllNewsData = false;
  bool get getloadAllNewsData => loadAllNewsData;
  setloadAllNewsData(val) {
    loadAllNewsData = val;
    notifyListeners();
  }

  //bottom nav bar
  int selectedIndex = 0;

  void onTapIcon(int index) {
    selectedIndex = index;
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

  //Share News Data
  Future<void> shareRecord(BuildContext context, String? url) async {
    await Share.share(
      "$url",
      subject: 'Share News',
      sharePositionOrigin: Rect.fromCircle(center: (Offset.zero), radius: 20),
    );
  }

  //Full news Veiw in web
  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  //search news
  bool searchData = false;
  bool get getsearchData => searchData;
  setsearchData(val) {
    searchData = val;
    notifyListeners();
  }

  Future<void> getLocalNewsData(context) async {
    var country = await storage.read(key: kcountry);
    try {
      setsearchData(true);
      dev.log(country!);
      final Uri url = Uri.parse(
          'https://newsapi.org/v2/everything?q=$country&apiKey=e890f258dab74a0b8df549648fcc3fb1');
      // 'https:newsapi.org/v2/everything?q=$searchType&from=$formattedDate&sortBy=publishedAt&apiKey=ff00d9c8fc8243f7a5923902de3709a8');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        dev.log(response.body);
        LocalNewsModel temp =
            LocalNewsModel.fromJson(jsonDecode(response.body));
        if (temp.status == "ok") {
          setlocalNewsModel(temp);
          notifyListeners();
        } else {
          dev.log("${temp.status}");
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      dev.log("$e");
    } finally {
      setsearchData(false);
    }
  }

  LocalNewsModel? localNewsModel;
  LocalNewsModel? get getlocalNewsModel => localNewsModel;
  setlocalNewsModel(val) {
    localNewsModel = val;
    notifyListeners();
  }

  LocalArticles? article;
  LocalArticles? get getarticle => article;
  setarticle(val) {
    article = val;
    notifyListeners();
  }

  //Get google app sign in location
  bool loadMapData = false;
  bool get getloadMapData => loadMapData;
  setloadMapData(val) {
    loadMapData = val;
    notifyListeners();
  }

  String? geoLocation;
  String location = 'Google Location:';
  String latitude = '';
  String longatude = '';

  Future<Position> determinePosition(context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      newsapp_message(context,
          messageHeader: 'Notification',
          btnType: 1,
          messageBody: "Please Enable Your Location to get better experience",
          button: [
            DialogButton(
              child: const Text('Okay',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.pop(context);
              },
            )
          ]).show();

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> googleAddressLocation(Position position) async {
    setloadMapData(true);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    dev.log(placemarks.toString());
    try {
      dev.log(placemarks.toString());

      Placemark place = placemarks[0];
      latitude = '${position.latitude}';
      longatude = '${position.longitude}';
      location = '${place.country}';
      dev.log(location);
      await storage.write(key: kcountry, value: place.country);
    } catch (e) {
      dev.log(e.toString());
    } finally {
      setloadMapData(false);
    }
  }
}
