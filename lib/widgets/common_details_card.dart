import 'package:flutter/material.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class CommonDetailsCard extends StatelessWidget {
  const CommonDetailsCard({
    super.key,
    this.assetName,
    this.cardName,
    this.onTap,
  });

  final String? assetName;
  final String? cardName;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: homeProvider.darkMode ? Colors.white : Colors.black,
                    width: 3),
                borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .25,
              width: MediaQuery.of(context).size.width * .3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("$assetName"),
                  ),
                  Text(
                    "$cardName",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
