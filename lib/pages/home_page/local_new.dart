import 'package:flutter/material.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:news_app/utils/common_loader.dart';
import 'package:news_app/utils/network_connection_check_class.dart';
import 'package:news_app/widgets/common_news_card.dart';
import 'package:provider/provider.dart';

class LocalNews extends StatefulWidget {
  const LocalNews({super.key});

  @override
  State<LocalNews> createState() => _LocalNewsState();
}

class _LocalNewsState extends State<LocalNews> {
  @override
  void initState() {
    InternetConnectionChecker().isInternetAvailable(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false)
          .getLocalNewsData(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          if (homeProvider.getsearchData || homeProvider.getloadMapData) {
            return const Center(
              child: CommonPageLoader(),
            );
          }
          return ListView.builder(
            itemCount: homeProvider.getlocalNewsModel!.localArticle!.length,
            itemBuilder: (context, index) {
              return CommonNewsCard(
                shareBtn: () {
                  homeProvider.shareRecord(context,
                      homeProvider.getlocalNewsModel!.localArticle![index].url);
                },
                onTap: () {
                  homeProvider.launchInBrowser(Uri.parse(
                      "${homeProvider.getlocalNewsModel!.localArticle![index].url}"));
                },
                newsTitle:
                    "${homeProvider.getlocalNewsModel!.localArticle![index].title}",
                imageUrl:
                    "${homeProvider.getlocalNewsModel!.localArticle![index].urlToImage}",
                errorWidget: const Image(
                  image: AssetImage("assets/images/newspaper.png"),
                  height: 200,
                  width: 200,
                ),
                auther:
                    "${homeProvider.getlocalNewsModel!.localArticle![index].author == null ? "" : homeProvider.getlocalNewsModel!.localArticle![index].author}",
                publishDate:
                    " ${homeProvider.getlocalNewsModel!.localArticle![index].publishedAt == null ? "" : homeProvider.getlocalNewsModel!.localArticle![index].publishedAt}",
              );
            },
          );
        },
      ),
    );
  }
}
