import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/widgets/notification_widget.dart';

AppBar bestSellingAppBar() {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      ),
    ],
    centerTitle: true,
    title: Text(
      'الأكثر مبيعًا',
      textAlign: TextAlign.center,
      style: AppStyles.bold19,
    ),
  );
}
