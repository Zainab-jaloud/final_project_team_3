import 'package:flutter/material.dart';
import 'package:flutter_application/feature/messages/data/message_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatListItemWidget extends StatefulWidget {
  final ChatModel chat;
  final VoidCallback onTap;
  final VoidCallback onMore;
  final VoidCallback onDelete;

  const ChatListItemWidget({
    super.key,
    required this.chat,
    required this.onTap,
    required this.onMore,
    required this.onDelete,
  });

  @override
  State<ChatListItemWidget> createState() => _ChatListItemWidgetState();
}

class _ChatListItemWidgetState extends State<ChatListItemWidget> {
  double _dragExtent = 0;
  final double _maxDragExtent = 160;

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragExtent += details.delta.dx;
      _dragExtent = _dragExtent.clamp(-_maxDragExtent, 0);
    });
  }

  void _onDragEnd(DragEndDetails details) {
    setState(() {
      if (_dragExtent < -_maxDragExtent / 2) {
        _dragExtent = -_maxDragExtent;
      } else {
        _dragExtent = 0;
      }
    });
  }

  void _closeSwipe() {
    setState(() => _dragExtent = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _swipeActionButton(
                label: 'More',
                iconPath: 'assets/icons/More Square.svg',
                backgroundColor: AppColors.dotColor,
                iconColor: AppColors.pagescolor,
                onTap: () {
                  _closeSwipe();
                  widget.onMore();
                },
              ),
              _swipeActionButton(
                label: 'Delete',
                iconPath: 'assets/icons/Delete.svg',
                backgroundColor: AppColors.primaryColor,
                iconColor: AppColors.pagescolor,
                onTap: () {
                  _closeSwipe();
                  widget.onDelete();
                },
              ),
            ],
          ),
        ),

        GestureDetector(
          onHorizontalDragUpdate: _onDragUpdate,
          onHorizontalDragEnd: _onDragEnd,
          onTap: _dragExtent == 0 ? widget.onTap : _closeSwipe,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.translationValues(_dragExtent, 0, 0),
            color: AppColors.pagescolor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundImage: AssetImage(widget.chat.imagePath),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.chat.name,
                          style: AppTextStyle.optionValueStyle,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          widget.chat.lastMessage,
                          style: AppTextStyle.optionLabelStyle.copyWith(
                            fontSize: 13.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.chat.time,
                    style: AppTextStyle.fasilitiesTextStyl.copyWith(
                      color: AppColors.locationColor,
                      //  fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _swipeActionButton({
    required String label,
    required String iconPath,
    required Color backgroundColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 55.w,
        height: 72.h,
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 22.w,
              height: 22.w,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: AppTextStyle.fasilitiesTextStyl.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 11,
                color: AppColors.pagescolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
