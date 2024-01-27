import 'package:flutter/material.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/common_loader.dart';
import 'package:news_app/utils/main_body.dart';
import 'package:news_app/utils/network_connection_check_class.dart';
import 'package:news_app/widgets/common_news_card.dart';
import 'package:provider/provider.dart';

class FilterPages extends StatefulWidget {
  const FilterPages({
    super.key,
    required this.title,
    required this.searchType,
  });
  final String title;
  final String searchType;

  @override
  State<FilterPages> createState() => _FilterPagesState();
}

class _FilterPagesState extends State<FilterPages> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      InternetConnectionChecker().isInternetAvailable(context);
      Provider.of<HomeProvider>(context, listen: false)
          .getSearchFilterData(context, widget.searchType);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      automaticallyImplyLeading: false,
      title: widget.title,
      appbarTitleColor: kdefWhiteColor,
      leading: GestureDetector(
        child: const Icon(
          Icons.arrow_back_ios,
          color: kdefWhiteColor,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          if (homeProvider.getsearchDataLoading) {
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
