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
          width: 36,
          height: 36,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.svgBackground,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/notification_bell.svg',
                    width: 21,
                    height: 21,
                  ),
                ),
              ),
              if (!notification.isRead)
                Positioned(
                  top: 4,
                  left: 23,
                  child: Container(
                    width: 4,
                    height: 4,
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
                  style: AppTextStyle.optionLabelStyle,
                ),
                TextSpan(
                  text: notification.boldPart,
                  style: AppTextStyle. fasilitiesTextStyl,
                ),
                TextSpan(
                  text: notification.afterBold,
                  style: AppTextStyle.optionLabelStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}