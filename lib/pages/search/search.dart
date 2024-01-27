import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/pages/home_page/home_page.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/common_loader.dart';
import 'package:news_app/utils/main_body.dart';
import 'package:news_app/utils/network_connection_check_class.dart';
import 'package:news_app/widgets/common_input.dart';
import 'package:news_app/widgets/common_news_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    InternetConnectionChecker().isInternetAvailable(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).clearSearchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "Search",
      appbarTitleColor: kdefWhiteColor,
      leading: GestureDetector(
        child: const Icon(
          Icons.arrow_back_ios,
          color: kdefWhiteColor,
        ),
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false);
        },
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonTextFeil(
                  hinttext: 'Search....',
                  label: 'Search',
                  controller: homeProvider.getsearchNewsController,
                  hinttextColor:
                      homeProvider.darkMode ? Colors.white : kDefTextColor,
                  labelColor:
                      homeProvider.darkMode ? Colors.white : kDefTextColor,
                  fillColor: homeProvider.darkMode
                      ? const Color.fromARGB(255, 100, 100, 100)
                      : Colors.transparent,
                  suffixIcon: IconButton(
                    onPressed: () {
                      homeProvider.getSearchFilterData(
                          context, homeProvider.getsearchNewsController.text);
                    },
                    icon: Icon(
                      Ionicons.search_circle,
                      color: homeProvider.darkMode ? Colors.white : Colors.grey,
                      size: 55,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 8),
                child: homeProvider.getsearchDataLoading
                    ? const Center(
                        child: CommonPageLoader(),
                      )
                    : homeProvider.getlocalNewsModel != null
                        ? ListView.builder(
                            itemCount: homeProvider
                                .getlocalNewsModel!.localArticle!.length,
                            itemBuilder: (context, index) {
                              return CommonNewsCard(
                                shareBtn: () {
                                  homeProvider.shareRecord(
                                      context,
                                      homeProvider.getlocalNewsModel!
                                          .localArticle![index].url);
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
                                  image:
                                      AssetImage("assets/images/newspaper.png"),
                                  height: 200,
                                  width: 200,
                                ),
                                auther:
                                    "${homeProvider.getlocalNewsModel!.localArticle![index].author == null ? "" : homeProvider.getlocalNewsModel!.localArticle![index].author}",
                                publishDate:
                                    " ${homeProvider.getlocalNewsModel!.localArticle![index].publishedAt == null ? "" : homeProvider.getlocalNewsModel!.localArticle![index].publishedAt}",
                              );
                            },
                          )
                        : Container(child: Text('No Record Founded')),
              )
            ],
          );
        },
      ),
    );
  }
}
