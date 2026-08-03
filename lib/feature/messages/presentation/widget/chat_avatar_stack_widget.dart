import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class ChatAvatarStackWidget extends StatelessWidget {
  final List<String> imagePaths;
  final VoidCallback onAddTap;

  const ChatAvatarStackWidget({
    super.key,
    required this.imagePaths,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: onAddTap,
            child: Container(
              width: 54.w,
              height: 54.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryColor,
              ),
              child: Icon(Icons.add, color: AppColors.pagescolor, size: 25.sp),
            ),
          ),
          SizedBox(width: 11.w),

          Container(
            width: 2,
            height: 40.h,
            color: AppColors.locationColor,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundImage: AssetImage(imagePaths[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
