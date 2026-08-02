import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/text_style.dart';

class NotificationSectionHeader extends StatelessWidget {
  const NotificationSectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyle.notificationSectionTitle);
  }
}