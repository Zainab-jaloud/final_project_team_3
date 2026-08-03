import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/app_images.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/add_review/data/model.dart';
import 'package:flutter_application/feature/add_review/presentation/widget/photo_upload_box.dart';
import 'package:flutter_application/feature/add_review/presentation/widget/review_property_card.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key, required this.property});
final PropertyModel property;
  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  late ReviewPropertyModel _property;

@override
void initState() {
  super.initState();

  _property = ReviewPropertyModel(
    name: widget.property.name,
    address: widget.property.location,
    dateRange: '08 Aug - 12 Aug',
    imageAsset:widget.property.image,
  );
}

  final TextEditingController _reviewController = TextEditingController();
  final int _maxChars = 350;

  File? _uploadedImage;
  File? _propertyImageOverride;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _uploadedImage = File(picked.path);
      });
    }
  }

  void _submitReview() {
    if (_uploadedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No photo added')),
      );
      return;
    }

    setState(() {
      _propertyImageOverride = _uploadedImage;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Your review added successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final remainingChars = _maxChars - _reviewController.text.length;

    return Scaffold(
      backgroundColor: AppColors.pagescolor,
      appBar: CustomAppBar(
        title: 'Write a review',
        icon1: '',
        icon2: '',
        rightIcon1: false,
        rightIcon2: false, onPageChanged: () { (context).go('/home'); },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReviewPropertyCard(
              property: _property,
              overrideImage: _propertyImageOverride,
            ),
            SizedBox(height: 16.h),
            Divider(height: 0.5, thickness: 0.5, color: AppColors.borderColor),
            SizedBox(height: 24.h),
            Text('Add Photo or Video', style: AppTextStyle.optionValueStyle.copyWith(fontSize: 16)),
            SizedBox(height: 8.h),
            PhotoUploadBox(image: _uploadedImage, onTap: _pickImage),
            SizedBox(height: 24.h),
            Text('Write your review', style: AppTextStyle.optionValueStyle.copyWith(fontSize: 16)),
            SizedBox(height: 8.h),
            DashedBorderBox(
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: TextField(
                  controller: _reviewController,
                  maxLength: _maxChars,
                  maxLines: null,
                  expands: true,
                  style: AppTextStyle.optionLabelStyle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                    hintText:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard',
                    hintStyle: AppTextStyle.optionLabelStyle,
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$remainingChars characters remaining',
                style: AppTextStyle.optionLabelStyle,
              ),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: 327.w,
              height: 52.h,
              child: ElevatedButton(
                onPressed: _submitReview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                ),
                child: Text('Submit Review', style: AppTextStyle.optionLabelStyle.copyWith(fontSize: 18,color: AppColors.whiteColor)),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}