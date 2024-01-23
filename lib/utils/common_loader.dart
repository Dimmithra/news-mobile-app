import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CommonPageLoader extends StatelessWidget {
  const CommonPageLoader({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.fourRotatingDots(
      color: color ?? Colors.blue,
      size: 75,
    );
  }
}
