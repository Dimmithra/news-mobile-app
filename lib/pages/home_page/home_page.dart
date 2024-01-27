import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/pages/home_page/homewidget.dart';
import 'package:news_app/pages/search/search.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/main_body.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false)
          .determinePosition(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "News",
      appbarTitleColor: kdefWhiteColor,
      appBarColor: kdefWhiteColor,
      leading: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return homeProvider.selectedIndex == 0
              ? IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SearchScreen();
                      },
                    ));
                  },
                  icon: const Icon(Icons.search))
              : Container();
        },
      ),
      actions: [
        Consumer<HomeProvider>(
          builder: (context, homeProvider, child) {
            return IconButton(
              onPressed: () async {
                await homeProvider.toggleTheme();
              },
              icon: Icon(
                homeProvider.darkMode
                    ? Ionicons.moon_sharp
                    : Ionicons.sunny_sharp,
                color: homeProvider.darkMode
                    ? Colors.yellow.shade700
                    : Colors.white,
              ),
            );
          },
        )
      ],
      body: homePage(context),
      bottomNavigationBar: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return BottomNavigationBar(
            iconSize: 30,
            backgroundColor:
                homeProvider.darkMode ? kHeaderDarkMode : Colors.grey.shade800,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Global News',
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.my_location_outlined),
                label: 'Local News',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.featured_play_list),
                label: 'Discover',
                backgroundColor: Colors.green,
              ),
            ],
            unselectedItemColor: kdefWhiteColor,
            currentIndex: homeProvider.selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (int index) async {
              if (index == 1) {
                Position position =
                    await homeProvider.determinePosition(context);
                setState(() {
                  homeProvider.selectedIndex = index;
                  homeProvider.geoLocation =
                      'latitude:${position.latitude} Longer:${position.longitude}';
                  homeProvider.googleAddressLocation(position);
                  homeProvider.location;
                });
              } else {
                setState(() {
                  homeProvider.selectedIndex = index;
                });
              }
            },
          );
        },
      ),
    );
  }
}
