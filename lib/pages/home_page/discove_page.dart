import 'package:flutter/material.dart';
import 'package:news_app/widgets/common_details_card.dart';
import 'package:provider/provider.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: SingleChildScrollView(
        child: Consumer(
          builder: (context, value, child) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CommonDetailsCard(
                          assetName: "assets/images/entertainment.png",
                          cardName: 'Entertainment'),
                      CommonDetailsCard(
                          assetName: "assets/images/sports.png",
                          cardName: 'Sports'),
                      CommonDetailsCard(
                          assetName: "assets/images/healthandfitness.png",
                          cardName: 'Health & Fitness'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CommonDetailsCard(
                          assetName: "assets/images/politics.png",
                          cardName: 'Politics'),
                      CommonDetailsCard(
                          assetName: "assets/images/economic.png",
                          cardName: 'Economics'),
                      CommonDetailsCard(
                          assetName: "assets/images/social_news.png",
                          cardName: 'social news'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CommonDetailsCard(
                          assetName: "assets/images/technology.png",
                          cardName: 'Technology'),
                      CommonDetailsCard(
                          assetName: "assets/images/environment.png",
                          cardName: 'Environment'),
                      CommonDetailsCard(
                          assetName: "assets/images/other.png",
                          cardName: 'Others'),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
