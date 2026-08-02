import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/add_review/data/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReviewPropertyCard extends StatelessWidget {
  const ReviewPropertyCard({
    super.key,
    required this.property,
    this.overrideImage,
  });

  final ReviewPropertyModel property;
  final File? overrideImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: overrideImage != null
              ? Image.file(
                  overrideImage!,
                  width: 80.w,
                  height: 62.h,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  property.imageAsset,
                  width: 80.w,
                  height: 62.h,
                  fit: BoxFit.cover,
                ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(property.name, style: AppTextStyle.reviewPropertyNameStyle),
              SizedBox(height: 4.h),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/location_pin.svg',
                    width: 16.w,
                    height: 16.w,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      property.address,
                      style: AppTextStyle.reviewPropertyAddressStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(property.dateRange, style: AppTextStyle.reviewPropertyAddressStyle),
            ],
          ),
        ),
      ],
    );
  }
}