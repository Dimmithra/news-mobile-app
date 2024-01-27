import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/utils/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert newsapp_message(
  context, {
  required String messageHeader,
  String? messageBody,
  bool showIcon = true,
  // Icon? icon,
  Image? notificationImage,
  int btnType = 0,
  List<DialogButton>? button,
  Color? backgroundColor,
}) =>
    Alert(
      onWillPopActive: button != null,
      context: context,
      style: AlertStyle(
        backgroundColor: backgroundColor,
        animationType: AnimationType.fromBottom,
        alertPadding: const EdgeInsets.all(8.0),
      ),
      closeIcon: Container(),
      content: Column(
        children: [
          if (showIcon)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: Icon(
                btnType == 1
                    ? Icons.notification_important_rounded
                    : btnType == 2
                        ? Ionicons.warning_outline
                        : Ionicons.close_circle_outline,
                size: 35,
                color: btnType == 1
                    ? kNotification
                    : btnType == 2
                        ? kWarrningColor
                        : kErrorColor,
              ),
            ),
          Text(
            messageHeader,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          notificationImage ?? Container(),
          Text(
            "$messageBody",
            textAlign: TextAlign.center,
          ),
        ],
      ),
      buttons: button ?? [],
    );
