import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page/discove_page.dart';
import 'package:news_app/pages/home_page/local_new.dart';
import 'package:news_app/provider/splash_provider.dart';
import 'package:news_app/utils/common_loader.dart';
import 'package:news_app/widgets/common_news_card.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

Widget homePage(BuildContext context) {
  return Consumer2<SplashProvider, HomeProvider>(
    builder: (context, splashProvider, homeProvider, child) {
      if (splashProvider.getloadSplashScreen) {
        return const CommonPageLoader();
      }

      return [
        ListView.builder(
          itemCount: splashProvider.getnewsPaperResponseData!.articles!.length,
          itemBuilder: (context, index) {
            return CommonNewsCard(
              shareBtn: () {
                homeProvider.shareRecord(
                    context,
                    splashProvider
                        .getnewsPaperResponseData!.articles![index].url);
              },
              onTap: () {
                homeProvider.launchInBrowser(Uri.parse(
                    "${splashProvider.getnewsPaperResponseData!.articles![index].url}"));
              },
              newsTitle:
                  "${splashProvider.getnewsPaperResponseData!.articles![index].title}",
              imageUrl:
                  "${splashProvider.getnewsPaperResponseData!.articles![index].urlToImage}",
              errorWidget: const Image(
                image: AssetImage("assets/images/newspaper.png"),
                height: 200,
                width: 200,
              ),
              auther:
                  "${splashProvider.getnewsPaperResponseData!.articles![index].author == null ? "" : splashProvider.getnewsPaperResponseData!.articles![index].author}",
              publishDate:
                  " ${splashProvider.getnewsPaperResponseData!.articles![index].publishedAt == null ? "" : splashProvider.getnewsPaperResponseData!.articles![index].publishedAt}",
            );
          },
        ),
        //Local News
        const LocalNews(),
        //Discover
        const DiscoverPage()
      ][homeProvider.selectedIndex];
    },
  );
}
