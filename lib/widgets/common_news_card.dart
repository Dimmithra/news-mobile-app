import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/common_loader.dart';
import 'package:provider/provider.dart';

class CommonNewsCard extends StatelessWidget {
  const CommonNewsCard({
    super.key,
    required this.newsTitle,
    required this.imageUrl,
    required this.errorWidget,
  });
  final String newsTitle;
  final String imageUrl;
  final Widget errorWidget;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return InkWell(
          child: Container(
            decoration: BoxDecoration(),
            child: Card(
              color: homeProvider.getDarkTheme
                  ? const Color.fromARGB(255, 105, 105, 105)
                  : const Color.fromARGB(255, 247, 244, 244),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .8,
                              child: Text(
                                newsTitle,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: homeProvider.darkMode
                                      ? kdefWhiteColor
                                      : kDefTextColor,
                                ),
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .13,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.more_vert,
                                      color: homeProvider.getDarkTheme
                                          ? Colors.white
                                          : kDefTextColor),
                                ))
                          ],
                        ),
                        CachedNetworkImage(
                          imageUrl: imageUrl,
                          height: 200,
                          width: 200,
                          placeholder: (context, url) {
                            return const CommonPageLoader();
                          },
                          errorWidget: (context, url, error) {
                            return errorWidget;
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
