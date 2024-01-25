import 'package:flutter/material.dart';
import 'package:news_app/pages/filter_pages/filter_pages.dart';
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
            return Padding(
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
                        cardName: 'Entertainment',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const FilterPages(
                                    title: "Entertainment",
                                    searchType: "Entertainment");
                              },
                            ),
                          );
                        },
                      ),
                      CommonDetailsCard(
                        assetName: "assets/images/sports.png",
                        cardName: 'Sports',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const FilterPages(
                                  title: "Sports",
                                  searchType: "Sports",
                                );
                              },
                            ),
                          );
                        },
                      ),
                      CommonDetailsCard(
                        assetName: "assets/images/healthandfitness.png",
                        cardName: 'Health & Fitness',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const FilterPages(
                                  title: "Health & Fitness",
                                  searchType: "Health & Fitness",
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CommonDetailsCard(
                        assetName: "assets/images/politics.png",
                        cardName: 'Politics',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const FilterPages(
                                  title: "Politics",
                                  searchType: "Politics",
                                );
                              },
                            ),
                          );
                        },
                      ),
                      CommonDetailsCard(
                        assetName: "assets/images/economic.png",
                        cardName: 'Economics',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const FilterPages(
                                  title: "Economic",
                                  searchType: "Economics",
                                );
                              },
                            ),
                          );
                        },
                      ),
                      CommonDetailsCard(
                        assetName: "assets/images/social_news.png",
                        cardName: 'social news',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const FilterPages(
                                  title: "social news",
                                  searchType: "social news",
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CommonDetailsCard(
                        assetName: "assets/images/technology.png",
                        cardName: 'Technology',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const FilterPages(
                                  title: "Science & Technology",
                                  searchType: "Science & Technology",
                                );
                              },
                            ),
                          );
                        },
                      ),
                      CommonDetailsCard(
                        assetName: "assets/images/environment.png",
                        cardName: 'Environment',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const FilterPages(
                                  title: "Environment",
                                  searchType: "Environment",
                                );
                              },
                            ),
                          );
                        },
                      ),
                      CommonDetailsCard(
                        assetName: "assets/images/other.png",
                        cardName: 'Others',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const FilterPages(
                                  title: "Others",
                                  searchType: "Others",
                                );
                              },
                            ),
                          );
                        },
                      ),
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
