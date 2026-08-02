import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/notifications/data/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MessageNotificationItem extends StatelessWidget {
  const MessageNotificationItem({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    final hasAvatar = notification.avatarAsset != null;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: hasAvatar ? null : AppColors.svgBackground,
            image: hasAvatar
                ? DecorationImage(
                    image: AssetImage(notification.avatarAsset!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: hasAvatar
              ? null
              : Center(
                  child: SvgPicture.asset(
                    'assets/icons/person_placeholder.svg',
                    width: 24.w,
                    height: 24.w,
                  ),
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
                  style: AppTextStyle.notificationNameBoldStyle,
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