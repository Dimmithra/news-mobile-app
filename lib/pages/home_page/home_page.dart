import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:news_app/provider/splash_provider.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/common_loader.dart';
import 'package:news_app/utils/main_body.dart';
import 'package:news_app/widgets/common_news_card.dart';
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
      // Provider.of<HomeProvider>(context, listen: false).getLoadAllData(context);
      // Provider.of<SplashProvider>(context, listen: false)
      //     .getLoadAllData(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "News",
      appbarTitleColor: kdefWhiteColor,
      appBarColor: kdefWhiteColor,
      actions: [
        Consumer<HomeProvider>(
          builder: (context, homeProvider, child) {
            return IconButton(
                onPressed: () async {
                  await homeProvider.toggleTheme();
                },
                icon: Icon(
                    homeProvider.darkMode ? Ionicons.moon : Ionicons.sunny));
          },
        )
      ],
      body: Consumer2<SplashProvider, HomeProvider>(
        builder: (context, splashProvider, homeProvider, child) {
          if (splashProvider.getloadSplashScreen) {
            return const CommonPageLoader();
          }

          return ListView.builder(
            itemCount: splashProvider.getnewsPaperResponseData!.articles.length,
            itemBuilder: (context, index) {
              return CommonNewsCard(
                  newsTitle: splashProvider
                      .getnewsPaperResponseData!.articles[index].title,
                  imageUrl:
                      "${splashProvider.getnewsPaperResponseData!.articles[index].urlToImage}",
                  errorWidget: const Image(
                    image: AssetImage("assets/images/newspaper.png"),
                    height: 200,
                    width: 200,
                  ));
            },
          );
        },
      ),
    );
  }
}
