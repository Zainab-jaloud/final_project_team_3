import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/notifications/data/model.dart';
import 'package:flutter_application/feature/notifications/presentation/screens/notification_empty_screen.dart';
import 'package:flutter_application/feature/notifications/presentation/widget/message_notification_item.dart';
import 'package:flutter_application/feature/notifications/presentation/widget/notification_item.dart';
import 'package:flutter_application/feature/notifications/presentation/widget/notification_section_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  static final List<NotificationModel> _notifications = [
    const NotificationModel(
      id: '1',
      type: NotificationType.bell,
      section: 'Today',
      isRead: false,
      beforeBold: 'Congratulations, your listing is now active.\n',
      boldPart: 'click here to see your listing',
      afterBold: '',
    ),
    const NotificationModel(
      id: '2',
      type: NotificationType.bell,
      section: 'Today',
      isRead: false,
      beforeBold: 'Welcome, Don\'t forget to complete your personal\ninfo',
      boldPart: '',
      afterBold: '',
    ),
    const NotificationModel(
      id: '3',
      type: NotificationType.message,
      section: 'Yesterday',
      isRead: false,
      avatarAsset: 'assets/images/notification_avatar_anggela.png',
      beforeBold: '',
      boldPart: 'Anggela and joni',
      afterBold: ' send you message, check it\nnow',
    ),
    const NotificationModel(
      id: '4',
      type: NotificationType.bell,
      section: 'Yesterday',
      isRead: false,
      beforeBold: 'Welcome, Don\'t forget to complete your personal\ninfo',
      boldPart: '',
      afterBold: '',
    ),
    const NotificationModel(
      id: '5',
      type: NotificationType.message,
      section: 'Yesterday',
      isRead: true,
      avatarAsset: null,
      beforeBold: '',
      boldPart: '',
      afterBold: 'Welcome, Don\'t forget to complete your personal\ninfo',
    ),
    const NotificationModel(
      id: '6',
      type: NotificationType.message,
      section: 'Yesterday',
      isRead: true,
      avatarAsset: 'assets/images/notification_avatar_jhon.png',
      beforeBold: '',
      boldPart: 'Jhon, ani & 2 other',
      afterBold: ' send you message, check it\nnow',
    ),
    const NotificationModel(
      id: '7',
      type: NotificationType.message,
      section: 'Yesterday',
      isRead: true,
      avatarAsset: null,
      beforeBold: '',
      boldPart: '',
      afterBold: 'Welcome, Don\'t forget to complete your personal\ninfo',
    ),
  ];

  @override
  Widget build(BuildContext context) {
  
    if (_notifications.isEmpty) {
      return const NotificationEmptyScreen();
    }

    final Map<String, List<NotificationModel>> grouped = {};
    for (final notification in _notifications) {
      grouped.putIfAbsent(notification.section, () => []).add(notification);
    }

    return Scaffold(
      backgroundColor: AppColors.pagescolor,
      appBar: CustomAppBar(
        title: 'Notification',
        icon1: '',
        icon2: '',
        rightIcon1: false,
        rightIcon2: false, onPageChanged: () {context.pop();},
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 16.h),
        children: [
          for (final entry in grouped.entries) ...[
            NotificationSectionHeader(title: entry.key),
            SizedBox(height: 16.h),
            _buildItemsWithDividers(entry.value),
            SizedBox(height: 32.h),
          ],
        ],
      ),
    );
  }

  Widget _buildItemsWithDividers(List<NotificationModel> items) {
    return Column(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          _buildItem(items[i]),
          if (i != items.length - 1) ...[
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 48.w),
              child: Divider(
                height: 1,
                thickness: 0.5,
                color: AppColors.borderColor,
              ),
            ),
            SizedBox(height: 12.h),
          ],
        ],
      ],
    );
  }

  Widget _buildItem(NotificationModel notification) {
    switch (notification.type) {
      case NotificationType.bell:
        return NotificationItem(notification: notification);
      case NotificationType.message:
        return MessageNotificationItem(notification: notification);
    }
  }
}