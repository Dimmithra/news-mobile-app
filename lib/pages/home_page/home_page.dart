import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:news_app/provider/splash_provider.dart';
import 'package:news_app/utils/common_loader.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        // leading: Icon(Icons.abc),
        title: Text("Welcome"),
      ),
      body: Consumer2<SplashProvider, HomeProvider>(
        builder: (context, splashProvider, homeProvider, child) {
          if (splashProvider.getloadSplashScreen) {
            return const CommonPageLoader();
          }
          return ListView.builder(
            itemCount: splashProvider.getnewsPaperResponseData!.articles.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          // splashProvider.getnewsPaperResponseData!
                          //                 .articles[index].urlToImage ==
                          //             null ||
                          //         splashProvider.getnewsPaperResponseData!
                          //             .articles[index].urlToImage!.isEmpty ||
                          //         splashProvider.getnewsPaperResponseData!
                          //                 .articles[index].urlToImage ==
                          //             "Invalid image data"
                          //     ? Icon(Icons.abc)
                          //     : Image.network(
                          //         splashProvider.getnewsPaperResponseData!
                          //             .articles[index].urlToImage
                          //             .toString(),
                          //         scale: 8,
                          //         // fit: BoxFit.cover,
                          //       ),
                          // CachedNetworkImage(
                          //   imageUrl: splashProvider.getnewsPaperResponseData!
                          //       .articles[index].urlToImage
                          //       .toString(),
                          //   placeholder: (context, url) {
                          //     return CommonPageLoader();
                          //   },
                          //   errorWidget: (context, url, error) {
                          //     return Icon(Icons.error);
                          //   },
                          // )
                          CachedNetworkImage(
                            imageUrl: splashProvider.getnewsPaperResponseData!
                                .articles[index].urlToImage
                                .toString(),
                            placeholder: (BuildContext context, String url) =>
                                Container(
                              // width: 320,
                              // height: 240,
                              child: splashProvider.getloadSplashScreen
                                  ? CommonPageLoader()
                                  : Image.network(
                                      splashProvider.getnewsPaperResponseData!
                                          .articles[index].urlToImage
                                          .toString(),
                                      scale: 5,
                                      // fit: BoxFit.cover,
                                    ),
                            ),
                            errorWidget: (context, url, error) {
                              return Icon(Icons.error);
                            },
                          ),
                          // Flexible(
                          //   child: Text(
                          //       "${splashProvider.getnewsPaperResponseData!.articles[index].title}"),
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
