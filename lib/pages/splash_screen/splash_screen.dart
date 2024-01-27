import 'package:flutter/material.dart';
import 'package:news_app/provider/splash_provider.dart';
import 'package:news_app/utils/common_loader.dart';
import 'package:news_app/utils/network_connection_check_class.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    InternetConnectionChecker().isInternetAvailable(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashProvider>(context, listen: false)
          .splashScreenLoading(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SafeArea(
                child: Image(
                  image: AssetImage("assets/images/splashimage.png"),
                ),
              ),
              CommonPageLoader()
            ],
          ),
        ),
      ),
    );
  }
}
