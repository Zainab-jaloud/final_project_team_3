
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyImageDetails extends StatelessWidget {
  const PropertyImageDetails({
    super.key,
    required this.images,
    required PageController pageController,
  }) : _pageController = pageController;

  final List<dynamic> images;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(  offset: const Offset(0, 0),
      child: SizedBox(height:72,width:327.sw,
        child: ListView.builder( itemCount: images.length,
          scrollDirection: Axis.horizontal,physics: NeverScrollableScrollPhysics(), 
          itemBuilder: (BuildContext context, int index) {
            return index>0?
            GestureDetector( onTap: () {
        _pageController.animateToPage(
          index ,  
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      },
              child: Container(
                margin: const EdgeInsets.only(right:8),
                width: 76.w,
                height: 72.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child:
                  Image.asset(
                        images[index])
                ),
              ),
            ):SizedBox();},),
      ),
    );
  }
}
