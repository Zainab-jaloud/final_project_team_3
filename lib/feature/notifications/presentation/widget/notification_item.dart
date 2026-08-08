import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/notifications/data/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 36.r,
          height: 36.r,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 36.r,
                height: 36.r,
                decoration: BoxDecoration(
                  color: AppColors.svgBackground,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/notification_bell.svg',
                    width: 24.r,
                    height: 24.r,
                  ),
                ),
              ),
              if (!notification.isRead)
                Positioned(
                  top: 4.r,
                  left: 23.r,
                  child: Container(
                    width: 4.r,
                    height: 4.r,
                    decoration: BoxDecoration(
                      color: AppColors.redColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: notification.beforeBold,
                  style: AppTextStyle.notificationBodyStyle,
                ),
                TextSpan(
                  text: notification.boldPart,
                  style: AppTextStyle.notificationBoldSpanStyle,
                ),
                TextSpan(
                  text: notification.afterBold,
                  style: AppTextStyle.notificationBodyStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}