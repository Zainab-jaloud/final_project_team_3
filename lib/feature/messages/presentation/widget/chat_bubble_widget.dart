import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';

class ChatBubbleWidget extends StatelessWidget {
  final String message;
  final String time;
  final bool isMe;
  final String? senderImagePath;

  const ChatBubbleWidget({
    super.key,
    required this.message,
    required this.time,
    required this.isMe,
    this.senderImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMe && senderImagePath != null) ...[
            CircleAvatar(
              radius: 16.r,
              backgroundImage: AssetImage(senderImagePath!),
            ),
            SizedBox(width: 12.w),
          ],
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                minWidth: isMe ? 0 : 280.w,
                maxWidth: 300.w,
              ),
              child: Column(
                crossAxisAlignment: isMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Container(
                    width: isMe ? null : 220,
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: isMe
                          ? AppColors.primaryColor
                          : AppColors.borderColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomLeft: Radius.circular(isMe ? 8.r : 0),
                        bottomRight: Radius.circular(isMe ? 0 : 8.r),
                      ),
                    ),
                    child: Text(
                      message,
                      style: AppTextStyle.optionValueStyle.copyWith(
                        color: isMe
                            ? AppColors.pagescolor
                            : AppColors.titleColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Text(
                    time,
                    style: AppTextStyle.optionLabelStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
