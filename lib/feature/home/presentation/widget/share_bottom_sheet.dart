import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/app_images.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/home/presentation/widget/share_item.dart';
 

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration:  BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(35),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),

          
          Container(
            width: 42,
            height: 6,
            decoration: BoxDecoration(
              color:Color.fromRGBO(0, 0, 0,0.1),
              borderRadius: BorderRadius.circular(100),
            ),
          ),

          const SizedBox(height: 20),

           Text(
            "Share to",
            style: AppTextStyle.optionValueStyle.copyWith(fontSize: 16)
        
          ),

          const SizedBox(height: 32),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing:24,
                crossAxisSpacing: 63,
                children:  [
                  ShareItem(
                    icon:AppImages.facebook,
                     
                    title: "Facebook",
                  ),
                  ShareItem(
                    icon:AppImages.instagram,
                  
                    title: "Instagram",
                  ),
                  ShareItem(
                     
                    title: "Twitter", icon:AppImages.twitter,
                  ),
                  ShareItem(
                    icon:AppImages.whatsapp  ,
                     
                    title: "Whatsapp",
                  ),
                  ShareItem(
                    icon: AppImages.linkedIn ,
                     
                    title: "LinkedIn",
                  ),
                  ShareItem(
                    icon:  AppImages.pinterest,
                     
                    title: "Pinterest",
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